/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.service.support.osc.OSCMessage;

public class ApplicationListener extends AbstractOSCListener
{
    private var _model:ApplicationModel;

    public function ApplicationListener(service:OSCService, model:ApplicationModel)
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
        _model.application.layout = osc.arguments[0];
    }

    private function handleActivate(osc:OSCMessage):void
    {
        _model.application.active = osc.arguments[0];
    }
}
}
