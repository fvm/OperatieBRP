/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.beheer.webapp.repository.stamgegevens.kern;

import nl.bzk.algemeenbrp.dal.domein.brp.enums.Regel;
import nl.bzk.brp.beheer.webapp.repository.stamgegevens.EnumReadonlyRepository;

import org.springframework.stereotype.Repository;

/**
 * Regel repository.
 */
@Repository
public class RegelRepository extends EnumReadonlyRepository<Regel> {

    /**
     * Constructor.
     */
    public RegelRepository() {
        super(Regel.class);
    }
}
