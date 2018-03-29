/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.levering.lo3.format;

import org.springframework.stereotype.Component;

/**
 * Uitgaand Gv01 bericht: spontane mutatie (fallback naar Ag31).
 */
@Component
public final class Gv01Formatter extends AbstractGvFormatter {

    @Override
    protected String getBerichtType() {
        return "Gv01";
    }
}
