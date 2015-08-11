/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import touch4bitwig.service.support.OSCService;
import touch4bitwig.service.support.osc.OSCMessage;

public class AbstractOSCListener
{
    protected var _methods:Array = [];

    private var _service:OSCService;

    public function AbstractOSCListener(service:OSCService)
    {
        _service = service;
    }

    public final function isHandled(osc:OSCMessage):Boolean
    {
        return _methods[osc.address] != null;
    }

    public final function handle(osc:OSCMessage):void
    {
        _methods[osc.address](osc);
    }

    protected function config():void
    {
    }
}
}
