Meta:
@status                 Klaar
@regels                 R1431
@usecase                UCS-BY.0.VA

Narrative: R1431 Een persoon met de Nederlandse nationaliteit mag geen bijzondere verblijfsrechtelijke positie krijgen

Scenario: Persoon met nederlandse nationaliteit geen BVP toegestaan
          LT: WBVP01C10T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-WBVP/WBVP01C10T10.xls

When voer een bijhouding uit WBVP01C10T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/WBVP/expected/WBVP01C10T10.xml voor expressie //brp:bhg_vbaRegistreerVerblijfsrecht_R
