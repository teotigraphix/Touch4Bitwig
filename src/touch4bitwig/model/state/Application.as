/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.service.IOSCService;

public class Application extends AbstractBitwigState
{
    public static const LAYOUT_ARRANGE:String = "arrange";
    public static const LAYOUT_MIX:String = "mix";
    public static const LAYOUT_EDIT:String = "edit";

    private var _layout:String = null;
    private var _active:Boolean;

    public function get layout():String
    {
        return _layout;
    }

    public function set layout(value:String):void
    {
        if (isSame(_layout, value))
            return;
        _layout = value;
        dispatchValue(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, _layout);
    }

    public function get active():Boolean
    {
        return _active;
    }

    public function set active(value:Boolean):void
    {
        if (isSame(_active, value))
            return;
        _active = value;
        dispatchValue(ApplicationModelEventType.ACTIVE_CHANGE, _active);
    }

    public function Application(service:IOSCService)
    {
        super(service);
    }
}
}
