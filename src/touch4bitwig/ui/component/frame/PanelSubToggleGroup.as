/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.ui.component.frame
{

import feathers.controls.Button;
import feathers.controls.ButtonGroup;

import starling.events.Event;

public class PanelSubToggleGroup extends ButtonGroup
{
    public function PanelSubToggleGroup()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        direction = ButtonGroup.DIRECTION_HORIZONTAL;
    }

    override protected function defaultButtonEventsListener(event:Event):void
    {
        var button:Button = Button(event.currentTarget);
        var index:int = this.activeButtons.indexOf(button);
        var item:Object = this._dataProvider.getItemAt(index);
        if (item == null)
            return; // buttons are being created and properties set
        var field:String = event.type;
        if (item.hasOwnProperty(field))
        {
            var listener:Function = item[field] as Function;
            if (listener == null)
            {
                return;
            }
            var argCount:int = listener.length;
            if (argCount == 1)
            {
                listener(event);
            }
            else if (argCount == 2)
            {
                listener(event, item);
            }
            else
            {
                listener();
            }
        }
    }
}
}
