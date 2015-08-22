/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.state.Application;
import touch4bitwig.service.support.OSCService;

public class ApplicationListener extends AbstractOSCListener
{
    private var _model:Application;

    public function ApplicationListener(service:OSCService, model:Application)
    {
        super(service);
        _model = model;
        config();
    }

    override protected function config():void
    {
        super.config();
        _methods["/layout"] = handleLayout;
        _methods["/active"] = handleActivate;
    }

    private function handleLayout(osc:OSCMessage):void
    {
        _model.layout = osc.arguments[0];
    }

    private function handleActivate(osc:OSCMessage):void
    {
        _model.active = osc.arguments[0];
    }
}
}
