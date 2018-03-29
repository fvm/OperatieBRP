Meta:
@status                 Klaar
@usecase                UCS-BY.HG


Narrative: Waarschuwing indien de gerelateerde gegevens van een persoon wijzigen en deze persoon voorkomt als een pseudo-persoon op de persoonslijst van een ander.

Scenario:   1. DB init scenario om uitgangssituatie te zetten
            preconditie

Given alle personen zijn verwijderd

Scenario: 2.  Wijziging geslachtsnaam van persoon bij voltrekking huwelijk waarbij persoon al als pseudo persoon in DB staat (ouder), alleen BSN komt overeen
          LT: VHNL01C410T40

Given enkel initiele vulling uit bestand /LO3PL/VHNL01C410T40-001.xls
Given enkel initiele vulling uit bestand /LO3PL/VHNL01C410T40-002.xls
Given enkel initiele vulling uit bestand /LO3PL/VHNL01C410T40-003.xls

When voer een bijhouding uit VHNL01C410T40.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding/VHNL/expected/VHNL01C410T40.xml voor expressie //brp:bhg_hgpRegistreerHuwelijkGeregistreerdPartnerschap_R


Then is in de database de persoon met bsn 536552009 wel als PARTNER betrokken bij een HUWELIJK
Then is in de database de persoon met bsn 360063081 wel als PARTNER betrokken bij een HUWELIJK

