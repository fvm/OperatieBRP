Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1919 Voornaam mag geen spatie bevatten

Scenario:   Een voornaam van 201 characters xxxxxxxxxx
            LT: GBNL02C70T20

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL02C70.xls

When voer een bijhouding uit GBNL02C70T20.xml namens partij 'Gemeente BRP 1'

Then is het foutief antwoordbericht gelijk aan /testcases/bijhouding_AS/GBNL/expected/GBNL02C70T20.txt
