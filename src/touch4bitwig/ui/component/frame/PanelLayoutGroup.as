/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.ui.component.frame
{

import com.teotigraphix.bitwig.model.state.Application;

import feathers.controls.TabBar;

import starling.events.Event;

public class PanelLayoutGroup extends TabBar
{
    public static const EVENT_LAYOUT_CHANGE:String = "layoutChange";

    public function PanelLayoutGroup()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        direction = TabBar.DIRECTION_HORIZONTAL;

        addEventListener(Event.CHANGE, changeHandler);
    }

    private function changeHandler(event:Event):void
    {
        switch (selectedIndex)
        {
            case 0 :
                dispatchEventWith(EVENT_LAYOUT_CHANGE, false, Application.LAYOUT_ARRANGE);
                break;

            case 1 :
                dispatchEventWith(EVENT_LAYOUT_CHANGE, false, Application.LAYOUT_MIX);
                break;

            case 2 :
                dispatchEventWith(EVENT_LAYOUT_CHANGE, false, Application.LAYOUT_EDIT);
                break;
        }

    }
}
}
