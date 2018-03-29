/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.service.algemeen.stamgegevens;

import nl.bzk.brp.domain.algemeen.StamtabelGegevens;

/**
 * StamTabelService. Service voor stam tabel interactie.
 */
@FunctionalInterface
public interface StamTabelService {

    /**
     * @param stamgegeven een stamgegeven
     * @return lijst met alle records behorende bij een stamgegeven
     */
    StamtabelGegevens geefStamgegevens(String stamgegeven);
}
