/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.beheer.webapp.configuratie.jpa;

import com.fasterxml.jackson.annotation.JsonProperty;

/**
 * Interface die aangeeft dat er een waarschuwing in het Page object zit.
 */
public interface PageWarning {

    /**
     * Geef de waarschuwing.
     * @return waarschuwing
     */
    @JsonProperty
    String getWarning();

}
