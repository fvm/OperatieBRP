Meta:
@auteur                 reboe
@status                 Klaar
@sleutelwoorden         ontbindingHuwelijkInBuitenland,Foutief
@usecase                UCS-BY.HG

Narrative: R2029 ontbinding huwelijk in Buitenland, actie registratieAanvangHuwelijkGeregistreerdPartnerschap

Scenario: Ontbinding huwelijk in het buitenland. R2029 Land/gebied "NL" + regio einde gevuld
          LT: OHBL01C60T50

Given alle personen zijn verwijderd

Given enkel initiele vulling uit bestand /LO3PL-OHBL/OHBL01C60T50-Marielle.xls

Given pas laatste relatie van soort 1 aan tussen persoon 445965065 en persoon 976064585 met relatie id 3000033 en betrokkenheid id 3000034

When voer een bijhouding uit OHBL01C60T50.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding/OHBL/expected/OHBL01C60T50.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R


