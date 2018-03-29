Meta:
@status                 Klaar
@regels                 R1370
@usecase                UCS-BY.0.VA

Narrative: R1370 Locatie ten opzichte van adres mag alleen ingevuld zijn bij een BAG adres en een niet-BAG adres met openbare ruimte

Scenario: Locatie ten opzichte van adres is ingevuld bij een "Niet-BAG-adres met locatieomschrijving"
          LT: VZIG02C300T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG-001.xls

When voer een bijhouding uit VZIG02C300T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG02C300T10.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R

Then in kern heeft SELECT COUNT(id) FROM kern.admhnd de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |