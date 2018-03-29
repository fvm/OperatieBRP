Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1726 Geslachtsnaam Nederlands kind moet overeenkomen met ouder

Scenario: Voorvoegsel, scheidingsteken en geslachtsnaam kind komen overeen met een ouder
          LT: GBNL01C110T10

Given alle personen zijn verwijderd

!-- De ouders
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C110T10-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C110T10-002.xls

When voer een bijhouding uit GBNL01C110T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/GBNL/expected/GBNL01C110T10.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R
