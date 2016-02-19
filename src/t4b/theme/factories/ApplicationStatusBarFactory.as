package t4b.theme.factories
{
import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;

import feathers.layout.HorizontalLayout;

import t4b.view.ui.main.ApplicationStatusBar;

public class ApplicationStatusBarFactory extends AbstractThemeFactory
{
    public function ApplicationStatusBarFactory(theme:AbstractTheme)
    {
        super(theme);
    }
    
    override public function initializeStyleProviders():void
    {
        setStyle(ApplicationStatusBar, setStyles);
    }
    
    private function setStyles(statusBar:ApplicationStatusBar):void
    {
        statusBar.minHeight = dp(40);
        
        var hl:HorizontalLayout = statusBar.layout as HorizontalLayout;
        hl.padding = dp(4);
        hl.gap = dp(8);
    }    
    
}
}