Meta:
@status                 Klaar
@regels                 R1929
@usecase                UCS-BY.0.VA

Narrative: R1929 Persoon wiens adres het betreft moet zelf ouder zijn als aangever meerderjarig kind is

Scenario:   R1929 De adreshouder is geen ouder. Er is geen kind op de PL.
            LT: VZIG01C30T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG-001.xls

When voer een bijhouding uit VZIG01C30T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG01C30T10.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R