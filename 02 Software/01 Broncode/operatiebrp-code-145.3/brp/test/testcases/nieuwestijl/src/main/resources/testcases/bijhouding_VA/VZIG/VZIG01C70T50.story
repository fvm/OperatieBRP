Meta:
@status                 Klaar
@regels                 R1931
@usecase                UCS-BY.0.VA

Narrative: R1931 Persoon wiens adres het betreft moet minderjarig zijn of onder curatele staan indien aangever gezaghouder is

Scenario:   Persoon is een meerderjarig kind (leeftijd < 18 jaar en een actueel GP)
            LT: VZIG01C70T50

Given alle personen zijn verwijderd
Given enkel initiele vulling uit bestand /LO3PL-VA/LO3PL-VZIG/VZIG01C70T50-001.xls

And de database is aangepast met: update kern.his_persgeboorte set datgeboorte=to_number(to_char(current_date - interval '17 years','YYYYMMDD'),'9999999999.99') where pers in (select id from kern.pers where voornamen='James');

When voer een bijhouding uit VZIG01C70T50.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Foutief
Then is het antwoordbericht gelijk aan /testcases/bijhouding_VA/VZIG/expected/VZIG01C70T50.xml voor expressie //brp:bhg_vbaRegistreerVerhuizing_R

Then in kern heeft SELECT COUNT(id) FROM kern.admhnd de volgende gegevens:
| veld                      | waarde |
| count                     | 1      |