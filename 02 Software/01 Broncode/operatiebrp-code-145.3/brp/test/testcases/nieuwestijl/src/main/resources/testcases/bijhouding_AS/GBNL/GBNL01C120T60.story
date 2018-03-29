Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1727 Geslachtsnaam Nederlands kind moet overeenkomen met die van eerder kind uit dezelfde relatie

Scenario: niet-NL kind met ongelijke stam t.o.v. sibling
          LT: GBNL01C120T60

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C120T60-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C120T60-002.xls

!-- Geboorte toekomstige sibling
When voer een bijhouding uit GBNL01C120T60a.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd

!-- Geboorte kind
When voer een bijhouding uit GBNL01C120T60b.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/GBNL/expected/GBNL01C120T60.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R