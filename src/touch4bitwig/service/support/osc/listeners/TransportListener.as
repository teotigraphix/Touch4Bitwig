/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.support.TransportModel;
import touch4bitwig.service.support.OSCService;

public class TransportListener extends AbstractOSCListener
{
    private var _transportModel:TransportModel;

    public function TransportListener(service:OSCService,
                                      transportModel:TransportModel)
    {
        super(service);
        _transportModel = transportModel;
        config();
    }

    /*

    /click {1,0}
    /play {1,0}
    /record {1,0}
    /repeat {1,0}
    /preroll
    /overdub/launcher {1,0}
    /overdub {1,0}
    /crossfade {0-127}
    /autowrite {0,1}
    /autowrite/launcher
    /automationWriteMode/{latch,touch,write}

     */

    override protected function config():void
    {
        super.config();

        _methods["/click"] = clickHandler;
        _methods["/play"] = playHandler;
        _methods["/record"] = recordHandler;
        _methods["/repeat"] = repeatHandler;
        _methods["/preroll"] = prerollHandler;
        _methods["/overdub/launcher"] = overdubLauncherHandler;
        _methods["/overdub"] = overdubHandler;
        _methods["/crossfade"] = corssfadeHandler;
        _methods["/autowrite"] = autoWriteHandler;
        _methods["/autowrite/launcher"] = autowriteLauncherHandler;
        _methods["/automationWriteMode"] = automationWriteModeHandler; // {latch,touch,write}
    }

    private function clickHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isClick = osc.arguments[0];
    }

    private function playHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isPlaying = osc.arguments[0];
    }

    private function recordHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isRecording = osc.arguments[0];
    }

    private function repeatHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isRepeat = osc.arguments[0];
    }

    private function prerollHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isPreroll = osc.arguments[0];
    }

    private function overdubLauncherHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isOverdubLauncher = osc.arguments[0];
    }

    private function overdubHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isOverdub = osc.arguments[0];
    }

    private function corssfadeHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isCrossfade = osc.arguments[0];
    }

    private function autoWriteHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isAutowrite = osc.arguments[0];
    }

    private function autowriteLauncherHandler(osc:OSCMessage):void
    {
        _transportModel.transport.isAutowriteLauncher = osc.arguments[0];
    }

    private function automationWriteModeHandler(osc:OSCMessage):void
    {
        _transportModel.transport.automationWriteMode = osc.arguments[0];
    }

}
}
