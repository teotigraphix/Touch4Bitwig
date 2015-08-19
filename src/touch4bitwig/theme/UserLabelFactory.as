/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.theme
{

import com.teotigraphix.ui.theme.AbstractTheme;
import com.teotigraphix.ui.theme.LabelFactory;

import feathers.controls.Label;

public class UserLabelFactory extends LabelFactory
{

    public function UserLabelFactory(theme:AbstractTheme)
    {
        super(theme);
    }

    override public function initializeStyleProviders():void
    {
        super.initializeStyleProviders();

        setStyle(Label, setTrackHeaderLabelStyles, "track-header-label");
    }

    private function setTrackHeaderLabelStyles(label:Label):void
    {
        label.textRendererProperties.elementFormat = theme.fonts.largeUILightElementFormat;
        label.textRendererProperties.disabledElementFormat = theme.fonts.largeUILightDisabledElementFormat;
    }
}
}
