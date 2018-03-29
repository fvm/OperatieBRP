Meta:
@status                 Klaar
@regels                 R2518
@usecase                UCS-BY.0.VA

Narrative:
R2518 Bij het registreren van een verstrekkingsbeperking moet aangegeven zijn of het om een volledige of specifieke verstrekkingsbeperking gaat

Scenario:   R2518 Er is niet aangegeven dat het om een volledige of specifieke verstrekkingsbeperking gaat
            LT: VZIG02C380T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG-001.xls

When voer een bijhouding uit VZIG02C380T10.xml namens partij 'Gemeente BRP 3'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG02C380T10.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R