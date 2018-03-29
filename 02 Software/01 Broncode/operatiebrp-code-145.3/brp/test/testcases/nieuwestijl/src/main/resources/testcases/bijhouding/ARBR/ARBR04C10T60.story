Meta:
@status                 Klaar
@usecase                UCS-BY.1.AB
@sleutelwoorden         join kern met ber query

Narrative: Archiveer bericht

Scenario:   Bericht met een GBA handeling en GBA zendende partij
            LT: ARBR04C10T60

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-GVGB/GVGB04C10T10-001.xls

When voer een GBA bijhouding uit ARBR04C10T60.xml namens partij 'Migratievoorziening'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/ARBR/expected/ARBR04C10T60.xml voor expressie /

!-- Controleer de archivering van het ingaande bericht
Then in kern heeft select sb.identifier as berichtSoort, r.naam as richting, p.code as zendendePartij, b.zendendesysteem, b.referentienr, b.crossreferentienr,
                   vw.naam as verwerkingswijze, b.rol, vr.naam as verwerking, br.naam as bijhouding, sm.naam as hoogstemeldingsniveau, sa.naam as admhnd
                   from ber.ber b
                   left join kern.richting r on r.id = b.richting
                   left join kern.srtber sb on sb.id = b.srt
                   left join kern.partij p on p.id = b.zendendepartij
                   left join kern.verwerkingswijze vw on vw.id = b.verwerkingswijze
                   left join kern.verwerkingsresultaat vr on vr.id = b.verwerking
                   left join kern.bijhresultaat br on br.id = b.bijhouding
                   left join kern.srtmelding sm on sm.id = b.hoogstemeldingsniveau
                   left join kern.admhnd a on a.id = b.admhnd
                   left join kern.srtadmhnd sa on sa.id = a.srt
                   where b.tsreg is not null
                   and b.tsverzending is not null
                   and b.tsontv is not null
                   and b.data is not null de volgende gegevens:
| veld                    | waarde                                                  |
| berichtSoort            | isc_migRegistreerVerhuizing                             |
| richting                | Ingaand                                                 |
| zendendePartij          | 507012                                                  |
| zendendesysteem         | ISC                                                     |
| referentienr            | 88409eeb-1aa5-43fc-8614-43055123a165                    |
| crossreferentienr       | NULL                                                    |
| verwerkingswijze        | Bijhouding                                              |
| rol                     | NULL                                                    |
| verwerking              | NULL                                                    |
| bijhouding              | NULL                                                    |
| hoogstemeldingsniveau   | NULL                                                    |
| admhnd                  | NULL                                                    |

!-- Controleer de archivering van het uitgaande bericht
Then in kern heeft select sb.identifier as berichtSoort, r.naam as richting, p.code as zendendePartij, b.zendendesysteem, b.crossreferentienr,
                   vw.naam as verwerkingswijze, b.rol, vr.naam as verwerking, br.naam as bijhouding, sm.naam as hoogstemeldingsniveau, sa.naam as admhnd
                   from ber.ber b
                   left join kern.richting r on r.id = b.richting
                   left join kern.srtber sb on sb.id = b.srt
                   left join kern.partij p on p.id = b.zendendepartij
                   left join kern.verwerkingswijze vw on vw.id = b.verwerkingswijze
                   left join kern.verwerkingsresultaat vr on vr.id = b.verwerking
                   left join kern.bijhresultaat br on br.id = b.bijhouding
                   left join kern.srtmelding sm on sm.id = b.hoogstemeldingsniveau
                   left join kern.admhnd a on a.id = b.admhnd
                   left join kern.srtadmhnd sa on sa.id = a.srt
                   where b.tsreg is not null
                   and b.tsverzending is not null
                   and b.referentienr is not null
                   and b.tsontv is null
                   and b.data is not null de volgende gegevens:
| veld                    | waarde                                                  |
| berichtSoort            | isc_migRegistreerVerhuizing_R                           |
| richting                | Uitgaand                                                |
| zendendePartij          | 199901                                                  |
| zendendesysteem         | BRP                                                     |
| crossreferentienr       | 88409eeb-1aa5-43fc-8614-43055123a165                    |
| verwerkingswijze        | Bijhouding                                              |
| rol                     | NULL                                                    |
| verwerking              | Geslaagd                                                |
| bijhouding              | Verwerkt                                                |
| hoogstemeldingsniveau   | Geen                                                    |
| admhnd                  | GBA - Verhuizing intergemeentelijk GBA naar BRP         |

!-- Controleer totaal aantal gearchiveerde berichten in ber.ber tabel
Then in kern heeft SELECT COUNT(id) FROM ber.ber de volgende gegevens:
| veld                      | waarde |
| count                     | 2      |

!-- Controleer gearchiveerde personen in ber.berpers tabel
Then in kern heeft select p.bsn
                   from ber.berpers bp
                   left join kern.pers p on p.id = bp.pers
                   order by p.bsn de volgende gegevens:
| veld           | waarde               |
| bsn            | 312379353            |
----
| bsn            | 312379353            |

!-- Controleer totaal aantal gearchiveerde personen in ber.berpers tabel
Then in kern heeft SELECT COUNT(ber) FROM ber.berpers de volgende gegevens:
| veld                      | waarde |
| count                     | 2      |
