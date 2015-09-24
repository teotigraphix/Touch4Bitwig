/**
 * Created by Teoti on 8/24/2015.
 */
package touch4bitwig.theme
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.AbstractThemeFactory;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.controls.Label;

import flash.text.engine.ElementFormat;

public class TrackNavigationControlFactory extends AbstractThemeFactory
{
    private var veryLargeUILightElementFormat:ElementFormat;

    public function TrackNavigationControlFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(Button, setUpButtonStyles, StyleNames.TRACK_NAVIGATION_CONTROL_UP_BUTTON);
        setStyle(Button, setDownButtonStyles, StyleNames.TRACK_NAVIGATION_CONTROL_DOWN_BUTTON);

        setStyle(Label, setNameLabelStyles, StyleNames.TRACK_NAVIGATION_CONTROL_NAME_LABEL);
    }

    override public function initializeFonts():void
    {
        super.initializeFonts();

        veryLargeUILightElementFormat = new ElementFormat(theme.fonts.boldFontDescription, 30,
                                                          StyleNames.FONT_COLOR_BITWIG_BLUE);
    }

    private function setUpButtonStyles(button:Button):void
    {
        theme.button.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("track-navigation-up-icon-skin");
    }

    private function setDownButtonStyles(button:Button):void
    {
        theme.button.setButtonStyles(button);
        button.defaultIcon = AssetMap.createImage("track-navigation-down-icon-skin");
    }

    private function setNameLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = veryLargeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = veryLargeUILightElementFormat;
    }
}
}