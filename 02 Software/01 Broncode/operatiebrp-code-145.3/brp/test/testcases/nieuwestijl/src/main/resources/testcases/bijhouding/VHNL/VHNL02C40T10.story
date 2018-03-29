Meta:
@auteur                 jozon
@status                 Klaar
@regels                 R1469
@sleutelwoorden         voltrekkingHuwelijkInNederland, VHNL02C40T10
@usecase                UCS-BY.HG

Narrative: R1469 Datum geboorte mag niet onbekend zijn bij geboorte in Nederland

Scenario: Geboortedatum deels onbekend bij geboorte in Nederland(19660100)
          LT: VHNL02C40T10

Gemeente BRP 1

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL/Libby-gebdat-deels-onbekend1.xls

When voer een bijhouding uit VHNL02C40T10.xml namens partij 'Gemeente Tiel'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C40T10.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 422531881 niet als PARTNER betrokken bij een HUWELIJK

Then lees persoon met anummer 1868196961 uit database en vergelijk met expected VHNL02C40T10-persoon1.xml





