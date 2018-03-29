/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.delivery.afnemervoorbeeld;

/**
 * De verwerking van een kennisgevings bericht van de BRP.
 */
public interface Persister {

    /**
     * Persisteer een persoon bericht.
     * @param request het verzoek
     */
    void persistPersoonBericht(String request);

    /**
     * Persisteer een vrij bericht.
     * @param request
     */
    void persistVrijBericht(String request);

    /**
     * Persisteer een notificatiebericht.
     * @param request
     */
    void persistNotificatieBericht(String request);
}
