/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.dockertest.component;

import org.junit.Test;

/**
 */
public class CacheDockerIT {

    @Test
    public void test() throws InterruptedException {
        final BrpOmgeving omgeving = new OmgevingBuilder().metTopLevelDockers(
                DockerNaam.ONDERHOUDAFNEMERINDICATIES,
                DockerNaam.AH_PUBLICATIE,
                DockerNaam.MUTATIELEVERING,
                DockerNaam.SYNCHRONISATIE,
                DockerNaam.VERZENDING,
                DockerNaam.BIJHOUDING,
                DockerNaam.BEVRAGING
        ).build();
        omgeving.start();
        for (int i = 0; i < 50; i++) {
            omgeving.cache().refresh();
        }
        omgeving.stop();

    }
}
