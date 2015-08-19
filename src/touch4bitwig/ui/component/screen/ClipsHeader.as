/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.component.screen
{

import com.teotigraphix.bitwig.ui.component.main.MainHeader;
import com.teotigraphix.bitwig.ui.component.main.TransportBar;

import starling.display.DisplayObject;

public class ClipsHeader extends MainHeader
{
    public function ClipsHeader()
    {
    }

    private var _transportBar:TransportBar;

    override protected function initialize():void
    {
        _transportBar = new TransportBar();

        super.initialize();

        title = "Clips";

    }

    override protected function draw():void
    {
        super.draw();
    }

    override protected function addLeftItems():void
    {
        leftItems = new <DisplayObject>[_activeEngineButton, _transportBar];
    }

    override protected function addRightItems():void
    {
        rightItems = new <DisplayObject>[_clipsButton, _deviceButton, _panelsButton, _mixerButton];
    }
}
}
