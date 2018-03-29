Meta:
@status                 Klaar
@usecase                UCS-BY.1.ON


Narrative: Verwerking van ontrelateren relaties

Scenario:   1. DB init scenario om uitgangssituatie te zetten
            preconditie

Given alle personen zijn verwijderd

Scenario: 2. Ontrelateren bij Nietigverklaring huwelijk in Nederland
             LT: ONTR02C10T60

Given enkel initiele vulling uit bestand /LO3PL-ONTR/ONTR02C10T60-001.xls
Given enkel initiele vulling uit bestand /LO3PL-ONTR/ONTR02C10T60-002.xls

When voer een bijhouding uit ONTR02C10T60a.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/ONTR/expected/ONTR02C10T60a.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Given pas laatste relatie van soort 1 aan tussen persoon 292392825 en persoon 525525129 met relatie id 30010001 en betrokkenheid id 30010001

Then is in de database de persoon met bsn 292392825 wel als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn 525525129 wel als PARTNER betrokken bij een HUWELIJK

Given de database is aangepast met: delete from autaut.his_bijhouderfiatuitz where id =99999
And de database is aangepast met: delete from autaut.bijhouderfiatuitz where id =99999
And de database is aangepast met: insert into autaut.bijhouderfiatuitz (id,bijhouder, datingang, dateinde, bijhouderbijhvoorstel, srtdoc, srtadmhnd, indblok) values (99999, (select id from kern.partijrol where partij = (select id from kern.partij where naam = 'Gemeente BRP 3') and rol=2), null , null , (select id from kern.partijrol where partij = (select id from kern.partij where naam = 'Gemeente BRP 1') and rol=2), null, null, null)
And de database is aangepast met: insert into autaut.his_bijhouderfiatuitz (id, bijhouderfiatuitz, tsreg, tsverval, datingang, dateinde, bijhouderbijhvoorstel, srtdoc, srtadmhnd, indblok) values(99999, 99999, now() at time zone 'UTC', null, 19990101, null, (select id from kern.partijrol where partij = (select id from kern.partij where naam = 'Gemeente BRP 1') and rol=2), null, null, null)

When voer een bijhouding uit ONTR02C10T60b.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/ONTR/expected/ONTR02C10T60b.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

!-- Controleer nieuwe betrokkenheden
Then in kern heeft select count(1)
                   from kern.his_betr hr
                   join kern.actie ainh on ainh.id = hr.actieinh
                   LEFT join kern.actie av on av.id = hr.actieverval
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   where sainh.naam ='Ontrelateren' and av.srt is NULL de volgende gegevens:
| veld                      | waarde |
| count                     | 4      |

!-- Controleer vervallen betrokkenheden
Then in kern heeft select count(1)
                   from kern.his_betr hr
                   join kern.actie ainh on ainh.id = hr.actieinh
                   LEFT join kern.actie av on av.id = hr.actieverval
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   where sainh.naam ='Registratie aanvang huwelijk'
                   and saav.naam='Ontrelateren' de volgende gegevens:
| veld                      | waarde |
| count                     | 2      |

!-- Controleer kopie-voorkomen gemaakt van de ActieBron
Then in kern heeft select count(1),ab.doc
from kern.actiebron ab join kern.actie ainh on ainh.id = ab.actie left join kern.srtactie sainh on ainh.srt = sainh.id
where sainh.naam in ('Registratie aanvang huwelijk', 'Ontrelateren') group by ab.doc de volgende gegevens:
| veld                      | waarde |
| count                     | 2      |

!-- Juiste partners gekoppeld aan nieuwe relatie (1) aangemaakt door ontrelateren
Then in kern heeft select hr.actieinh, hr.relatie, count(p1.id) ingeschrevenen, count(p2.id) pseudos, p1.bsn as bsn1, p2.bsn as bsn2
                   from kern.betr b
                   join kern.relatie r on r.id = b.relatie
                   join kern.his_relatie hr on r.id = hr.relatie
                   left outer join kern.pers p1 on p1.id = b.pers and p1.srt = 1
                   left outer join kern.pers p2 on p2.id = b.pers and p2.srt = 2
                   left join kern.actie av on av.id = hr.actieverval
                   left join kern.actie ainh on ainh.id = hr.actieinh
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   where sainh.naam ='Ontrelateren'
                   and hr.tsverval is null
                   group by hr.actieinh, hr.relatie, p1.bsn, p2.bsn
                   order by ingeschrevenen de volgende gegevens:
| veld                      | waarde     |
| pseudos                   | 1          |
| bsn2                      | 525525129  |
----
| ingeschrevenen            | 1          |
| bsn1                      | 292392825  |

!-- Juiste partners gekoppeld aan nieuwe relatie (2) aangemaakt door ontrelateren
Then in kern heeft select hr.actieinh, hr.relatie, count(p1.id) ingeschrevenen, count(p2.id) pseudos, p1.bsn as bsn1, p2.bsn as bsn2
                   from kern.betr b
                   join kern.relatie r on r.id = b.relatie
                   join kern.his_relatie hr on r.id = hr.relatie
                   left outer join kern.pers p1 on p1.id = b.pers and p1.srt = 1
                   left outer join kern.pers p2 on p2.id = b.pers and p2.srt = 2
                   left join kern.actie av on av.id = hr.actieverval
                   left join kern.actie ainh on ainh.id = hr.actieinh
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   where sainh.naam ='Ontrelateren'
                   and hr.tsverval is not null
                   group by hr.actieinh, hr.relatie, p1.bsn, p2.bsn
                   order by ingeschrevenen de volgende gegevens:
| veld                      | waarde     |
| pseudos                   | 1          |
| bsn2                      | 292392825  |
----
| ingeschrevenen            | 1          |
| bsn1                      | 525525129  |

!-- Controleer aangemaakte personen (pseudo 1)
Then in kern heeft select p.srt, hpid.bsn, hpid.anr, hpsam.indafgeleid, hpsam.indnreeks, hpsam.predicaat, hpsam.voornamen, hpsam.adellijketitel, hpsam.voorvoegsel, hpsam.scheidingsteken, hpsam.geslnaamstam, hpges.geslachtsaand, hpgeb.datgeboorte, hpgeb.gemgeboorte, hpgeb.wplnaamgeboorte, hpgeb.blplaatsgeboorte, hpgeb.blregiogeboorte, hpgeb.omslocgeboorte, hpgeb.landgebiedgeboorte
                   from kern.his_persids hpid
                   left join kern.pers p on p.id = hpid.pers
                   left join kern.his_perssamengesteldenaam hpsam on hpsam.pers = hpid.pers
                   left join kern.actie ainh on ainh.id = hpid.actieinh
                   left join kern.actie av on av.id = hpid.actieverval
                   left join kern.his_persgeslachtsaand hpges on hpsam.pers = hpges.pers
                   left join kern.his_persgeboorte hpgeb on hpsam.pers = hpgeb.pers
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   where sainh.naam ='Conversie GBA'
                   and hpid.bsn ='292392825'
                   order by p.srt de volgende gegevens:
| veld                      | waarde     |
| srt                       | 1          |
| bsn                       | 292392825  |
| anr                       | 7198673185 |
| indafgeleid               | true       |
| indnreeks                 | false      |
| predicaat                 | NULL       |
| voornamen                 | Libby      |
| adellijketitel            | NULL       |
| voorvoegsel               | NULL       |
| scheidingsteken           | NULL       |
| geslnaamstam              | Thatcher   |
| geslachtsaand             | 2          |
| datgeboorte               | 19660821   |
| gemgeboorte               | 17         |
| wplnaamgeboorte           | NULL       |
| blplaatsgeboorte          | NULL       |
| blregiogeboorte           | NULL       |
| omslocgeboorte            | NULL       |
| landgebiedgeboorte        | 229        |
----
| srt                       | 2          |
| bsn                       | 292392825  |
| anr                       | 7198673185 |
| indafgeleid               | false      |
| indnreeks                 | false      |
| predicaat                 | NULL       |
| voornamen                 | Libby      |
| adellijketitel            | NULL       |
| voorvoegsel               | NULL       |
| scheidingsteken           | NULL       |
| geslnaamstam              | Thatcher   |
| geslachtsaand             | 2          |
| datgeboorte               | 19660821   |
| gemgeboorte               | 17         |
| wplnaamgeboorte           | NULL       |
| blplaatsgeboorte          | NULL       |
| blregiogeboorte           | NULL       |
| omslocgeboorte            | NULL       |
| landgebiedgeboorte        | 229        |

!-- Controleer aangemaakte personen (pseudo 2)
Then in kern heeft select p.srt, hpid.bsn, hpid.anr, hpsam.indafgeleid, hpsam.indnreeks, hpsam.predicaat, hpsam.voornamen, hpsam.adellijketitel, hpsam.voorvoegsel, hpsam.scheidingsteken, hpsam.geslnaamstam, hpges.geslachtsaand, hpgeb.datgeboorte, hpgeb.gemgeboorte, hpgeb.wplnaamgeboorte, hpgeb.blplaatsgeboorte, hpgeb.blregiogeboorte, hpgeb.omslocgeboorte, hpgeb.landgebiedgeboorte
                   from kern.his_persids hpid
                   left join kern.pers p on p.id = hpid.pers
                   left join kern.his_perssamengesteldenaam hpsam on hpsam.pers = hpid.pers
                   left join kern.actie ainh on ainh.id = hpid.actieinh
                   left join kern.actie av on av.id = hpid.actieverval
                   left join kern.his_persgeslachtsaand hpges on hpsam.pers = hpges.pers
                   left join kern.his_persgeboorte hpgeb on hpsam.pers = hpgeb.pers
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   where sainh.naam ='Conversie GBA'
                   and hpid.bsn ='525525129'
                   order by p.srt de volgende gegevens:
| veld                      | waarde     |
| srt                       | 1          |
| bsn                       | 525525129  |
| anr                       | 7130769697 |
| indafgeleid               | true       |
| indnreeks                 | false      |
| predicaat                 | NULL       |
| voornamen                 | Piet       |
| adellijketitel            | NULL       |
| voorvoegsel               | NULL       |
| scheidingsteken           | NULL       |
| geslnaamstam              | Jansen     |
| geslachtsaand             | 2          |
| datgeboorte               | 19600821   |
| gemgeboorte               | 17         |
| wplnaamgeboorte           | NULL       |
| blplaatsgeboorte          | NULL       |
| blregiogeboorte           | NULL       |
| omslocgeboorte            | NULL       |
| landgebiedgeboorte        | 229        |
----
| srt                       | 2          |
| bsn                       | 525525129  |
| anr                       | 7130769697 |
| indafgeleid               | false      |
| indnreeks                 | false      |
| predicaat                 | NULL       |
| voornamen                 | Piet       |
| adellijketitel            | NULL       |
| voorvoegsel               | NULL       |
| scheidingsteken           | NULL       |
| geslnaamstam              | Jansen     |
| geslachtsaand             | 2          |
| datgeboorte               | 19600821   |
| gemgeboorte               | 17         |
| wplnaamgeboorte           | NULL       |
| blplaatsgeboorte          | NULL       |
| blregiogeboorte           | NULL       |
| omslocgeboorte            | NULL       |
| landgebiedgeboorte        | 229        |

!-- Controleer betrokken personen zijn gemarkeerd als bijgehouden
Then in kern heeft select sainh.naam as actieInhoud, saav.naam as actieVerval, p.bsn, sa.naam as AdmhndNaam, hpaf.sorteervolgorde
                   from kern.his_persafgeleidadministrati hpaf
                   join kern.actie ainh on ainh.id = hpaf.actieinh
                   left join kern.actie av on av.id = hpaf.actieverval
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   left join kern.pers p on hpaf.pers = p.id
                   left join kern.admhnd a on hpaf.admhnd = a.id
                   left join kern.srtadmhnd sa on a.srt = sa.id
                   where sainh.naam ='Ontrelateren'
                   order by p.bsn de volgende gegevens:
| veld                      | waarde                                        |
| actieinhoud               | Ontrelateren                                  |
| actieverval               | NULL                                          |
| bsn                       | 292392825                                     |
| admhndnaam                | Ontrelateren                                  |
| sorteervolgorde           | 1                                             |
----
| actieinhoud               | Ontrelateren                                  |
| actieverval               | Registratie einde huwelijk                    |
| bsn                       | 525525129                                     |
| admhndnaam                | Ontrelateren                                  |
| sorteervolgorde           | 1                                             |

!-- Controleer de 2 nieuwe relaties, de vervallen symmetrische relatie en de daadwerkelijke beeindingen van relatie
Then in kern heeft select sainh.naam as actieInhoud, saav.naam as actieVerval, hr.dataanv, hr.gemaanv, hr.dateinde, hr.gemeinde
                   from kern.his_relatie hr
                   join kern.actie ainh on ainh.id = hr.actieinh
                   left join kern.actie av on av.id = hr.actieverval
                   left join kern.relatie r on r.id = hr.relatie
                   left join kern.srtactie sainh on ainh.srt = sainh.id
                   left join kern.srtactie saav on av.srt = saav.id
                   left join kern.srtrelatie sr on r.srt = sr.id
                   where sainh.naam in ('Registratie einde huwelijk', 'Ontrelateren', 'Registratie aanvang huwelijk') AND sr.naam='Huwelijk'
                   order by actieinhoud, actieverval de volgende gegevens:
| veld                      | waarde                                        |
| actieinhoud               | Ontrelateren                                  |
| actieverval               | Registratie einde huwelijk                    |
| dataanv                   | 20160510                                      |
| gemaanv                   | 7012                                          |
| dateinde                  | NULL                                          |
| gemeinde                  | NULL                                          |
----
| actieinhoud               | Ontrelateren                                  |
| actieverval               | NULL                                          |
| dataanv                   | 20160510                                      |
| gemaanv                   | 7012                                          |
| dateinde                  | NULL                                          |
| gemeinde                  | NULL                                          |
----
| actieinhoud               | Registratie aanvang huwelijk                   |
| actieverval               | Ontrelateren                                   |
| dataanv                   | 20160510                                       |
| gemaanv                   | 7012                                           |
| dateinde                  | NULL                                           |
| gemeinde                  | NULL                                           |
----
| actieinhoud               | Registratie einde huwelijk                    |
| actieverval               | NULL                                          |
| dataanv                   | 20160510                                      |
| gemaanv                   | 7012                                          |
| dateinde                  | 20160510                                      |
| gemeinde                  | 7012                                          |

Then is in de database de persoon met bsn i:292392825 wel als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn i:525525129 niet als PARTNER betrokken bij een HUWELIJK

Scenario:   3. DB reset scenario om de aangepaste data weer terug te zetten
            postconditie

Given de database is aangepast met: delete from autaut.his_bijhouderfiatuitz where id =99999
And de database is aangepast met: delete from autaut.bijhouderfiatuitz where id =99999