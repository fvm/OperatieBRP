Meta:
@status                 Klaar
@usecase                UCS-BY.0.VA

Narrative: R2344 Waarschuwing tonen indien de gemeente binnen het adres wordt gewijzigd terwijl een verstrekkingsbeperking op basis van een gemeentelijke verordening geregistreerd staat

Scenario:   Persoon heeft een specifieke verstrekkingsbeperking en gemeente verordening niet aanwezig
            LT: WGIS02C10T40

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-WGIS/WGIS02C10T40-001.xls

When voer een bijhouding uit WGIS02C10T40a.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/WGIS/expected/WGIS02C10T40a.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R

When voer een bijhouding uit WGIS02C10T40b.xml namens partij 'Gemeente BRP 2'

Then heeft het antwoordbericht verwerking Geslaagd
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/WGIS/expected/WGIS02C10T40b.xml voor expressie //brp:bhg_vbaActualiseerInfrastructureleWijziging_R



