Meta:
@auteur                 tjlee
@status                 Klaar
@regels                 R1681
@sleutelwoorden         voltrekkingHuwelijkInNederland,registratieNaamgebruik,TjieWah,VHNL02C180T10
@usecase                UCS-BY.HG

Narrative:
R1861 Huwelijk en geregistreerd partnerschap, voltrekking huwelijk in Nederland, actie registratieAanvangHuwelijkGeregistreerdPartnerschap, registratieNaamgebruik

Scenario: R1681 Persoon.Naamgebruik verwijst naar een niet-bestaand stamgegeven
          LT: VHNL02C180T10



Given alle personen zijn verwijderd

Given enkel initiele vulling uit bestand /LO3PL/VHNL02C170-sandy.xls
Given enkel initiele vulling uit bestand /LO3PL/VHNL02C170-danny.xls

When voer een bijhouding uit VHNL02C180T10.xml namens partij 'Gemeente BRP 1'

Then is het foutief antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C180T10.txt

Then is in de database de persoon met bsn 156960849 niet als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn 558376617 niet als PARTNER betrokken bij een HUWELIJK

Then lees persoon met anummer 3814796818 uit database en vergelijk met expected VHNL02C180T10-persoon1.xml
Then lees persoon met anummer 1686982546 uit database en vergelijk met expected VHNL02C180T10-persoon2.xml
