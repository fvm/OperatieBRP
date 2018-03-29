/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.test.common.jbehave;

import org.jbehave.core.annotations.AsParameters;
import org.jbehave.core.annotations.Parameter;

/**
 * Klasse voor vertaling van {@link org.jbehave.core.model.ExamplesTable} met voorkomen / attribuut aanduiding.
 */
@AsParameters
public final class VoorkomenAttribuutRegel {
    /**
     * Groep parameter.
     */
    @Parameter(name = "groep")
    private String  groep;
    /**
     * Nummer parameter
     */
    @Parameter(name = "nummer")
    private Integer nummer;
    /**
     * Attribuut parameter
     */
    @Parameter(name = "attribuut")
    private String attribuut;
    /**
     * verwachteWaarde parameter
     */
    @Parameter(name = "verwachteWaarde")
    private String verwachteWaarde;

    public String getGroep() {
        return groep;
    }

    public Integer getNummer() {
        return nummer;
    }

    public String getAttribuut() {
        return attribuut;
    }

    public String getVerwachteWaarde() {
        return verwachteWaarde;
    }
}
