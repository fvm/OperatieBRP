Meta:
@status                 Klaar
@usecase                UCS-BY.HG

Narrative: R2479 Als datum einde niet is gevuld, dan mogen de overige beëindigingsgegevens ook niet zijn gevuld

Scenario:   Datum einde is niet ingevuld en Relatie.Landgebied einde is ingevuld.
            LT: CGPS02C20T40

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-CGPS/CGPS02C20T40-001.xls
Given enkel initiele vulling uit bestand /LO3PL-CGPS/CGPS02C20T40-002.xls

!-- Aangaan van een geregistreerd partnerschap
When voer een bijhouding uit CGPS02C20T40a.xml namens partij 'Gemeente BRP 1'
Then heeft het antwoordbericht verwerking Geslaagd

Given pas laatste relatie van soort 2 aan tussen persoon 491644681 en persoon 340682073 met relatie id 30010001 en betrokkenheid id 30010001
And de database is aangepast met: update kern.his_relatie
                                  set    id = 9999
				  where  id = (
				                  select hr.id
						  from   kern.his_relatie hr
						  join   kern.relatie r
						  on     r.id = hr.relatie
						  where  r.srt = 2
						  and    hr.dataanv = 20160510
					      )

Then is in de database de persoon met bsn 491644681 wel als PARTNER betrokken bij een GEREGISTREERD_PARTNERSCHAP
Then is in de database de persoon met bsn 340682073 wel als PARTNER betrokken bij een GEREGISTREERD_PARTNERSCHAP

!-- Einde geregistreerd partnerschap
When voer een bijhouding uit CGPS02C20T40b.xml namens partij 'Gemeente BRP 1'
Then heeft het antwoordbericht verwerking Geslaagd

!-- De niet-vervallen rij gereed maken om als voorkomensleutel te gebruiken
Given de database is aangepast met: update kern.his_relatie
                                    set    id=9998
				    where  relatie=30010001
				    and    id<>9999
				    and    tsverval is null

!-- Correctie registratie geregistreerd partnerschap
When voer een bijhouding uit CGPS02C20T40c.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/CGPS/expected/CGPS02C20T40.xml voor expressie //brp:bhg_hgpCorrigeerHuwelijkGeregistreerdPartnerschap_R