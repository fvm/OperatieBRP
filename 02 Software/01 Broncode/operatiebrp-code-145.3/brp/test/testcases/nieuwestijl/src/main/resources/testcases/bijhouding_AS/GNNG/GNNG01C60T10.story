Meta:
@status                 Klaar
@usecase                UCS-BY.0.AS

Narrative: R1690 Kind moet Nederlander worden als het een 3e generatie kind betreft

Scenario: Grootouders (vaders kant) en Vader zijn ingezetene, bij Erkenning na geboorte wordt vader en Nederlandse nationaliteit geregistreerd (erkenningsdatum)
          LT: GNNG01C60T10

Given alle personen zijn verwijderd

!-- Initiële vulling: Ingezeten grootouders
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GNNG/GNNG01C60T10-001.xls
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GNNG/GNNG01C60T10-002.xls

!-- Initiële vulling: Ingezeten moeder
Given enkel initiele vulling uit bestand /LO3PL-AS/LO3PL-GNNG/GNNG01C60T10-003.xls
Given maak bijhouding caches leeg

!-- Geboorte: Ingezeten vader met BSNs van grootouders
Given de database is aangepast met: update kern.gem set dataanvgel = '19800101' where naam = 'Gemeente BRP 1'
And de database is aangepast met: update kern.partij set datingang = '19800101' where naam = 'Gemeente BRP 1'
When voer een bijhouding uit GNNG01C60T10a.xml namens partij 'Gemeente BRP 1'
Then heeft het antwoordbericht verwerking Geslaagd


Scenario: 2. DB reset inclusief story
          postconditie
!-- Geboorte Nederlands kind met BSNs van moeder en vader
Given de database is aangepast met: update kern.gem set dataanvgel = '20160101' where naam = 'Gemeente BRP 1'
And de database is aangepast met: update kern.partij set datingang = '20160101' where naam = 'Gemeente BRP 1'
When voer een bijhouding uit GNNG01C60T10b.xml namens partij 'Gemeente BRP 1'

Then heeft het antwoordbericht verwerking Geslaagd
Given maak bijhouding caches leeg