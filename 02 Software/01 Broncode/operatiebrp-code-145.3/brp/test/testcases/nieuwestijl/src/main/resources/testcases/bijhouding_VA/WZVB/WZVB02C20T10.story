Meta:
@status                 Klaar
@usecase                UCS-BY.0.VA

Narrative: R2349 Datum aanvang verblijfsrecht moet een volledig bekende datum zijn

Scenario: Dag onbekend voor datum aanvang verblijfsrecht
          LT: WZVB02C20T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-WZVB/WZVB02C20T10-001.xls

When voer een bijhouding uit WZVB02C20T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/WZVB/expected/WZVB02C20T10.xml voor expressie //brp:bhg_vbaRegistreerVerblijfsrecht_R