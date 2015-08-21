/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.event.UIModelEventType;

public class UIModel extends AbstractModel
{
    private var _screenID:String;

    public function get screenID():String
    {
        return _screenID;
    }

    public function set screenID(value:String):void
    {
        if (_screenID == value)
            return;
        _screenID = value;
        dispatchWith(UIModelEventType.SCREEN_ID_CHANGE, false, _screenID);
    }

    public function UIModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();
    }
}
}
