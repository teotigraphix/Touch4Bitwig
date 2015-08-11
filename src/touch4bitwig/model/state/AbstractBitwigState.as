/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.service.IOSCService;

public class AbstractBitwigState
{
    private var _service:IOSCService;
    private var _flush:Boolean = false;

    public function get service():IOSCService
    {
        return _service;
    }

    public function AbstractBitwigState(service:IOSCService)
    {
        _service = service;
    }

    protected function dispatch(type:String, value:Object):void
    {
        _service.dispatchEventWith(type, false, value);
    }

    protected function dispatchValue(type:String, value:Object):void
    {
        _service.dispatchEventWith(type, false, {value: value});
    }

    protected final function isSame(current:Object, value:Object):Boolean
    {
        if (current == value || _flush)
            return true;
        return false;
    }

}
}
