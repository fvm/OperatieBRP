Meta:
@status                 Klaar
@usecase                BY.1.MR

Narrative:
Maak bijhoudingsresultaatbericht

Scenario: Bericht met Resultaat Verwerking 'GBA', (Deels) uitgesteld (GBA)
          LT: MBRB01C10T90



Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-MBRB/MBRB01C10T90-Marie.xls

When voer een bijhouding uit MBRB01C10T90.xml namens partij 'Gemeente BRP 1'

Then is het antwoordbericht gelijk aan /testcases/bijhouding/MBRB/expected/MBRB01C10T90.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R
