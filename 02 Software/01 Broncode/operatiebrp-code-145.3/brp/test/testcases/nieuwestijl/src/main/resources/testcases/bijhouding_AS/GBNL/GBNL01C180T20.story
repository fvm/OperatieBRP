Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1753 Waarschuwing als OUWKIG verhuisd is na datum geboorte kind

Scenario:   OUWKIG is verhuisd op datum geboorte kind
            LT: GBNL01C180T20

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C180T20-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GBNL/GBNL01C180T20-002.xls

When voer een bijhouding uit GBNL01C180T20a.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd

When voer een bijhouding uit GBNL01C180T20b.xml namens partij 'Gemeente BRP 1'
Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_AS/GBNL/expected/GBNL01C180T20.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R


