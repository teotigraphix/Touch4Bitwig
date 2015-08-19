/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.screen
{

import feathers.controls.Header;
import feathers.controls.LayoutGroup;
import feathers.controls.Screen;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import touch4bitwig.ui.component.main.MainHeader_;
import touch4bitwig.ui.component.mixer.MixerBank;

public class MixerScreen_ extends Screen
{
    public function MixerScreen_()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        layout = vl;

        super.initialize();

        var header:Header = new MainHeader_();
        header.layoutData = new VerticalLayoutData(100);
        addChild(header);

        var spacer:LayoutGroup = new LayoutGroup();
        spacer.layoutData = new VerticalLayoutData(100, 100);
        addChild(spacer);

        var mixerBank:MixerBank = new MixerBank();
        mixerBank.layoutData = new VerticalLayoutData(100);

        addChild(mixerBank);
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
