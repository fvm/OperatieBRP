Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1691 Minderjarig kind moet Nederlandse nationaliteit hebben als een ouder ook de Nederlandse nationaliteit heeft

Scenario:   Kind verkrijgt niet de NL nationaliteit. Beide ouders hebben niet de NL nationaliteit.
            LT: GNNG01C50T40

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GNNG/GNNG01C50T40-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GNNG/GNNG01C50T40-002.xls

When voer een bijhouding uit GNNG01C50T40.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/GNNG/expected/GNNG01C50T40.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R







