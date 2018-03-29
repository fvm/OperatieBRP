Meta:
@status                 Klaar
@regels                 R2493
@usecase                UCS-BY.0.VA

Narrative: R2493 Waarschuwing indien er een feitdatum op de persoonslijst staat die recenter dan of gelijk is aan de Peildatum, DAG en DEG van de Administratieve handeling.

Scenario:   R2493 Datum huwelijkssluiting aangaan geregistreerd partnerschap op de PL is recenter of gelijk aan de peildatum, DAG en DEG van de AH
            LT: VZIG01C80T70

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG01C80T70-001.xls

And de database is aangepast met: update kern.his_relatie set dataanv = '20160102' where dataanv is not null and dataanv <> '0';

When voer een bijhouding uit VZIG01C80T70.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG01C80T70.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R
