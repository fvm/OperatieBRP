Meta:
@auteur                 tjlee
@status                 Klaar
@regels                 R2164
@usecase                UCS-BY.HG

Narrative:
R2164 Huwelijk en geregistreerd partnerschap, voltrekking huwelijk in Nederland, actie registratieAanvangHuwelijkGeregistreerdPartnerschap

Scenario: R2164 Gemeente geboorte verwijst niet naar bestaand stamgegeven
          LT: AGNL01C550T10

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-AGNL/Marjan.xls
Given enkel initiele vulling uit bestand /LO3PL-AGNL/Victor.xls

When voer een bijhouding uit AGNL01C550T10.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
And is het antwoordbericht gelijk aan /testcases/bijhouding/AGNL/expected/AGNL01C550T10.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R

Then is in de database de persoon met bsn 221087849 niet als PARTNER betrokken bij een GEREGISTREERD_PARTNERSCHAP
Then is in de database de persoon met bsn 110477200 niet als PARTNER betrokken bij een GEREGISTREERD_PARTNERSCHAP

