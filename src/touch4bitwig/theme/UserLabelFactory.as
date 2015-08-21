/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.theme
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.LabelFactory;

import feathers.controls.Label;

import flash.text.engine.ElementFormat;

public class UserLabelFactory extends LabelFactory
{
    public var veryLargeUILightElementFormat:ElementFormat;

    public function UserLabelFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(Label, setTrackHeaderLabelStyles, "track-header-label");

        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_POSITION);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TEMPO);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TIME);
        setStyle(Label, setTransportDisplayPositionLabelStyles, StyleNames.TRANSPORT_DISPLAY_TIME_SIGNATURE);
    }

    override public function initializeFonts():void
    {
        super.initializeFonts();

        veryLargeUILightElementFormat = new ElementFormat(theme.fonts.boldFontDescription, 75, 0x3BABCC);
    }

    private function setTrackHeaderLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = theme.fonts.largeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = theme.fonts.largeUILightDisabledElementFormat;
    }

    private function setTransportDisplayPositionLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = veryLargeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = veryLargeUILightElementFormat;
    }

}
}
