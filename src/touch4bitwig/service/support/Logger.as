/**
 * Created by Teoti on 8/11/2015.
 */
package touch4bitwig.service.support
{

import touch4bitwig.service.ILogger;

public class Logger implements ILogger
{
    public function Logger()
    {
    }

    public function log(tag:String, message:String):void
    {
        trace("{" + tag + "} " + message);
    }
}
}
