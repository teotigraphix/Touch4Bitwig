/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.event.UIModelEventType;
import touch4bitwig.model.IUIModel;

public class UIModel extends AbstractModel implements IUIModel
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
