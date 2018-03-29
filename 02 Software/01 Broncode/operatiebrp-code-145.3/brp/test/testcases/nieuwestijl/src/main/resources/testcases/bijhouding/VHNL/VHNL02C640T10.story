Meta:
@auteur                 jozon
@status                 Klaar
@sleutelwoorden         Geslaagd
@regels                 R2046
@usecase                UCS-BY.HG

Narrative:
Locatie-omschrijving geboorte verplicht als Land = "Onbekend"

Scenario: Landgebied = 0000 Omschrijving geboorte gevuld
          LT: VHNL02C640T10



Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL/Libby.xls

When voer een bijhouding uit VHNL02C640T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL02C640T10.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 422531881 wel als PARTNER betrokken bij een HUWELIJK

Then lees persoon met anummer 1868196961 uit database en vergelijk met expected VHNL02C640T10-persoon1.xml






