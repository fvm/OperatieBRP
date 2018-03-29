Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R2434 Geboorte van ingezetene mag alleen ingediend worden door gemeente van geboorte of bijhoudingspartij van OUWKIG

Scenario:   Administratieve handeling.Partij komt overeen met Persoon.Bijhoudingspartij van de 'OUWKIG' (R2014)
            LT: AUAH01C170T40

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AUAH/AUAH01C170T40-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AUAH/AUAH01C170T10-002.xls

When voer een bijhouding uit AUAH01C170T40.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/AUAH/expected/AUAH01C170T40.xml voor expressie //brp:bhg_afsRegistreerGeboorte_R