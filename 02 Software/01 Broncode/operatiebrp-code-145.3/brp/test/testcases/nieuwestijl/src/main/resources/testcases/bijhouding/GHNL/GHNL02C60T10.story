Meta:
@auteur                 fuman
@status                 Klaar
@regels                 R1809
@usecase                UCS-BY.HG

Narrative:
R1809 Namenreeks en Voornaam sluiten elkaar uit

Scenario: R1809 Namenreeks en Voornaam sluiten elkaar uit
          LT: GHNL02C60T10



Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-GHNL/GHNL-Mila.xls

When voer een GBA bijhouding uit GHNL02C60T10.xml namens partij 'Migratievoorziening'

Then heeft het antwoordbericht verwerking Foutief
And is het antwoordbericht gelijk aan /testcases/bijhouding/GHNL/expected/GHNL02C60T10.xml voor expressie //brp:isc_migRegistreerHuwelijkGeregistreerdPartnerschap_R


Then is in de database de persoon met bsn 956803593 niet als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn 189975945 niet als PARTNER betrokken bij een HUWELIJK
