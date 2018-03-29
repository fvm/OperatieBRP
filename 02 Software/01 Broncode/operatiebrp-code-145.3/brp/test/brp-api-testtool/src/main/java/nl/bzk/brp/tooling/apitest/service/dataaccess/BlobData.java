/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.tooling.apitest.service.dataaccess;

import com.google.common.collect.Maps;
import java.util.Map;

/**
 * Hulpklasse
 */
class BlobData {

    Map<Long, AfnemerindicatiesBlobData> afnemerindicatiesBlobMap = Maps.newHashMap();
    Map<Long, PersoonBlobData> persoonBlobMap = Maps.newHashMap();

}
