/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.service.bevraging.gba.adres;

import nl.bzk.brp.service.bevraging.algemeen.AntwoordBerichtResultaat;
import nl.bzk.brp.service.bevraging.algemeen.Bevraging;
import nl.bzk.brp.service.bevraging.algemeen.BevragingResultaat;
import org.springframework.stereotype.Component;

/**
 * Implementatie voor het archiveren van AdHoc zoeken adresvraag.
 */
@Component
public class AdresvraagArchiveerBerichtServiceImpl implements Bevraging.ArchiveerBerichtService<AdresvraagVerzoek, BevragingResultaat> {

    @Override
    public void archiveer(final AdresvraagVerzoek verzoek, final BevragingResultaat berichtResultaat,
                          final AntwoordBerichtResultaat antwoordBerichtResultaat) {
        // GBA berichten worden vanuit de VOISC gearchiveerd.
    }
}
