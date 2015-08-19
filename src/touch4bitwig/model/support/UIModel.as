/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.event.UIModelEventType;

public class UIModel extends AbstractModel
{
    //public static const INDEX_MAIN:int = 0;
    public static const INDEX_CLIPS:int = 0;
    public static const INDEX_TRANSPORT:int = 1;
    public static const INDEX_MIXER:int = 2;
    public static const INDEX_PANELS:int = 3;

    private var _mainScreenIndex:int = 0;

    public function get mainScreenIndex():int
    {
        return _mainScreenIndex;
    }

    public function set mainScreenIndex(value:int):void
    {
        if (_mainScreenIndex == value)
            return;
        _mainScreenIndex = value;
        dispatchWith(UIModelEventType.MAIN_SCREEN_INDEX_CHANGE, false, _mainScreenIndex);
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
