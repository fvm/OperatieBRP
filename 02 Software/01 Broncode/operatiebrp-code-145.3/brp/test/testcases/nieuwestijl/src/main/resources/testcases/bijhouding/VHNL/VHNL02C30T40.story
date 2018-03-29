Meta:
@auteur                 jozon
@status                 Klaar
@regels                 R1467
@sleutelwoorden         voltrekkingHuwelijkInNederland, VHNL02C30T40
@usecase                UCS-BY.HG

Narrative:
R1467 Land of gebied geboorte moet geldig zijn op datum geboorte

Scenario: Datum geboorte op Dateindegel LandGebied
          LT: VHNL02C30T40



Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL/Libby.xls

When voer een bijhouding uit VHNL02C30T40.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C30T40.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 422531881 niet als PARTNER betrokken bij een HUWELIJK

Then lees persoon met anummer 1868196961 uit database en vergelijk met expected VHNL02C30T40-persoon1.xml







