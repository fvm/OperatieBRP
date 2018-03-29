/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at https://github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.dockertest.component;

import java.util.Map;
import nl.bzk.algemeenbrp.util.common.logging.Logger;
import nl.bzk.algemeenbrp.util.common.logging.LoggerFactory;

/**
 * SelectieComponent.
 */
@DockerInfo(
        image = "brp/selectie-verwerker",
        logischeNaam = DockerNaam.SELECTIE_VERWERKER,
        afhankelijkheden = {DockerNaam.BRPDB, DockerNaam.SELECTIE_ROUTERINGCENTRALE, DockerNaam.ROUTERINGCENTRALE},
        internePoorten = {Poorten.APPSERVER_PORT, Poorten.JMX_POORT},
        dynamicVolumes = {"/selectiebestand"}
)
final class SelectieVerwerkerDocker extends AbstractDocker implements LogfileAware, CacheSupport {
    private static final Logger LOGGER = LoggerFactory.getLogger();

    @Override
    public boolean isFunctioneelBeschikbaar() {
        return super.isFunctioneelBeschikbaar()
                && VersieUrlChecker.check(this, "selectie-verwerker");
    }

    @Override
    protected Map<String, String> getEnvironment() {
        final Map<String, String> map = super.getEnvironment();
        map.put("SELECTIEBESTAND_FOLDER", getDockerInfo().dynamicVolumes()[0]);
        map.put("SELECTIE_RESULTAAT_FOLDER", "/dummy");
        map.put("brp.selectie.lezer.batchsize", "35");
        map.put("brp.selectie.verwerker.selectietaak.blobs", "2");
        map.put("brp.selectie.lezer.selectietaak.autorisaties", "2");
        return map;
    }

    @Override
    public String getJmxDomain() {
        return "selectie-verwerker";
    }

}

