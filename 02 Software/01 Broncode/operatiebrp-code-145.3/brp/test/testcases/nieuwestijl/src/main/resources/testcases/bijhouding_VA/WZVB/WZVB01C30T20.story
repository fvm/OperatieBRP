Meta:
@status                 Klaar
@usecase                UCS-BY.0.VA

Narrative: R2330 Datum mededeling verblijfsrecht mag niet in de toekomst liggen

Scenario: Datum mededeling verblijfsrecht ligt in de toekomst
          LT: WZVB01C30T20

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-WZVB/WZVB-001.xls

When voer een bijhouding uit WZVB01C30T20.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/WZVB/expected/WZVB01C30T20.xml voor expressie //brp:bhg_vbaRegistreerVerblijfsrecht_R
