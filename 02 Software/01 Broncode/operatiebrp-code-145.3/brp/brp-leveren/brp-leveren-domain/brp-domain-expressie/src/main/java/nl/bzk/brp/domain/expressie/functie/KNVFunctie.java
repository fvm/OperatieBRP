/**
 * This file is copyright 2017 State of the Netherlands (Ministry of Interior Affairs and Kingdom Relations).
 * It is made available under the terms of the GNU Affero General Public License, version 3 as published by the Free Software Foundation.
 * The project of which this file is part, may be found at www.github.com/MinBZK/operatieBRP.
 */

package nl.bzk.brp.domain.expressie.functie;

import java.util.List;
import nl.bzk.brp.domain.expressie.Context;
import nl.bzk.brp.domain.expressie.Expressie;
import nl.bzk.brp.domain.expressie.ExpressieType;
import nl.bzk.brp.domain.expressie.BooleanLiteral;
import nl.bzk.brp.domain.expressie.signatuur.SignatuurOptie;
import nl.bzk.brp.domain.expressie.signatuur.SimpeleSignatuur;
import org.springframework.stereotype.Component;

/**
 * Representeert de collectiefunctie KNV({}) ofwel KanNietVinden. Enkel als de collectie
 * leeg is geeft de functie {@link BooleanLiteral#WAAR waar} terug.
 * <p>
 * Voorbeelden:
 * <table>
 * <tr><th>Expressie</th><th>Resultaat</th></tr>
 * <tr><td>KNV({})</td><td>WAAR</td></tr>
 * <tr><td>KNV({100}) </td><td>ONWAAR</td></tr>
 * <tr><td>KNV({100, 200}) </td><td>ONWAAR</td></tr>
 * </table>
 * </p>
 */
@Component
@FunctieKeyword("KNV")
final class KNVFunctie extends AbstractFunctie {

    /**
     * Constructor voor de functie.
     */
    KNVFunctie() {
        super(new SignatuurOptie(
                new SimpeleSignatuur(ExpressieType.LIJST)));
    }

    @Override
    public Expressie evalueer(final List<Expressie> argumenten, final Context context) {
        return BooleanLiteral.valueOf(argumenten.get(0).alsLijst().isEmpty());
    }

    @Override
    public ExpressieType getType(final List<Expressie> argumenten, final Context context) {
        return ExpressieType.BOOLEAN;
    }
}
