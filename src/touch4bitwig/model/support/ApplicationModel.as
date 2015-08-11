/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.model.state.Application;
import touch4bitwig.service.IOSCService;

public class ApplicationModel extends AbstractModel
{
    [Inject]
    public var oscService:IOSCService;

    private var _application:Application;

    public function get application():Application
    {
        return _application;
    }

    public function ApplicationModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _application = new Application(oscService);
    }
}
}
