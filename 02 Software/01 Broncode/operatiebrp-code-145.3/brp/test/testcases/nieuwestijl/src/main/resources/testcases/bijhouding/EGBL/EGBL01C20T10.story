Meta:
@auteur                 tjlee
@status                 Klaar
@regels                 R1853
@sleutelwoorden         Foutief
@usecase                UCS-BY.HG

Narrative: R1853 Einde geregistreerd partnerschap in het buitenland. Code Reden einde relatie moet bestaan

Scenario: R1853 Code Reden einde relatie bestaat niet
          LT: EGBL01C20T10

Given alle personen zijn verwijderd

Given enkel initiele vulling uit bestand /LO3PL-EGBL/Nienke.xls

Given pas laatste relatie van soort 2 aan tussen persoon 158686421 en persoon 410082089 met relatie id 2000055 en betrokkenheid id 2000056

When voer een bijhouding uit EGBL01C20T10.xml namens partij 'Gemeente BRP 1'

Then is het foutief antwoordbericht gelijk aan /testcases/bijhouding/EGBL/expected/EGBL01C20T10.txt

Then is in de database de persoon met bsn 158686421 wel als PARTNER betrokken bij een GEREGISTREERD_PARTNERSCHAP
