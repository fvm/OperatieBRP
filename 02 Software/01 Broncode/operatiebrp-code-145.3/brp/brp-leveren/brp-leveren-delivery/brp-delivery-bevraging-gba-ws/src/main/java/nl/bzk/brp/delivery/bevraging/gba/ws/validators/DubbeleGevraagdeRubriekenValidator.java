/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.delivery.bevraging.gba.ws.validators;

import java.util.Optional;
import java.util.Set;
import java.util.stream.Collectors;
import nl.bzk.brp.delivery.bevraging.gba.ws.model.Antwoorden;
import nl.bzk.brp.delivery.bevraging.gba.ws.model.WebserviceBericht;
import nl.bzk.brp.delivery.bevraging.gba.ws.vertaler.AntwoordBerichtResultaat;
import nl.bzk.brp.delivery.bevraging.gba.ws.vraag.Antwoord;

/**
 * Valideer dat er geen dubbel gevraagde rubrieken zijn.
 * @param <T> subtype van WebserviceBericht dat gevalideerd dient te worden
 */
public class DubbeleGevraagdeRubriekenValidator<T extends WebserviceBericht> implements Validator<T> {
    @Override
    public Optional<Antwoord> apply(final T vraag) {
        Set<Integer> rubrieken = DubbeleRubriekenValidator.bepaalDubbele(vraag.getGevraagdeRubrieken());
        return rubrieken.isEmpty()
                ? Optional.empty()
                : Optional.of(Antwoorden.foutief(
                        AntwoordBerichtResultaat.TECHNISCHE_FOUT_025,
                        rubrieken.stream().sorted().map(Object::toString).collect(Collectors.joining(", "))));
    }
}
