Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1726 Geslachtsnaam Nederlands kind moet overeenkomen met ouder

Scenario: scheidingsteken en geslachtsnaamstam gelijk, voorvoegsel ongelijk aan de ouder
          LT: GBNL01C110T80

Given alle personen zijn verwijderd

!-- De ouders
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C110-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C110-002.xls

When voer een bijhouding uit GBNL01C110T80.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/GBNL/expected/GBNL01C110T80.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R
