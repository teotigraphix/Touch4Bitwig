package t4b.theme.factories
{
import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;

import t4b.theme.SkinNames;
import t4b.view.ui.main.ApplicationToolBar;

public class ApplicationToolBarFactory extends AbstractThemeFactory
{
    public function ApplicationToolBarFactory(theme:AbstractTheme)
    {
        super(theme);
    }
    
    override public function initializeStyleProviders():void
    {
        setStyle(ApplicationToolBar, setStyles);
    }
    
    private function setStyles(toolBar:ApplicationToolBar):void
    {
        toolBar.backgroundSkin = create9ScaleImage(SkinNames.SIDE_BAR_BACKGROUND_SKIN, 4, 4, 40, 40);
    }  
}
}