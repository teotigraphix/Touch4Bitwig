/**
 * Created by Teoti on 8/22/2015.
 */
package touch4bitwig.theme
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;

import touch4bitwig.ui.component.main.MainHeader;

public class MainFactory extends AbstractThemeFactory
{

    public function MainFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(MainHeader, setMainHeaderStyles, StyleNames.MAIN_HEADER);
    }

    private function setMainHeaderStyles(header:MainHeader):void
    {
        header.height = 100;
    }
}
}
