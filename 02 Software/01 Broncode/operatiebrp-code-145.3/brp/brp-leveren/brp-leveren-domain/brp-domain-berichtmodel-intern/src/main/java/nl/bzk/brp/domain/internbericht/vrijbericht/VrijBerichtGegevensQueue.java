/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.domain.internbericht.vrijbericht;

/**
 * Bericht object tbv vrije berichten, dat via JMS gecommuniceerd wordt tussen de levering componenten. JSON wordt gebruikt voor (De)serialisatie.
 */
public enum VrijBerichtGegevensQueue {

    NAAM("VrijBerichtQueue");

    private final String queueNaam;

    /**
     * @param queueNaam queueNaam
     */
    VrijBerichtGegevensQueue(final String queueNaam) {
        this.queueNaam = queueNaam;
    }

    public String getQueueNaam() {
        return queueNaam;
    }
}
