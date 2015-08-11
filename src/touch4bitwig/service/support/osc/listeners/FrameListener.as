/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import touch4bitwig.model.support.FrameModel;
import touch4bitwig.service.support.OSCService;
import touch4bitwig.service.support.osc.OSCMessage;

public class FrameListener extends AbstractOSCListener
{
    private var _model:FrameModel;

    public function FrameListener(service:OSCService, model:FrameModel)
    {
        super(service);
        _model = model;
        config();
    }

    override protected function config():void
    {
        super.config();

        _methods["/arranger/cueMarkerVisibility"] = handleArranger;
        _methods["/arranger/playbackFollow"] = handleArranger;
        _methods["/arranger/trackRowHeight"] = handleArranger;
        _methods["/arranger/clipLauncherSectionVisibility"] = handleArranger;
        _methods["/arranger/timeLineVisibility"] = handleArranger;
        _methods["/arranger/ioSectionVisibility"] = handleArranger;
        _methods["/arranger/effectTracksVisibility"] = handleArranger;

        _methods["/mixer/clipLauncherSectionVisibility"] = handleMixer;
        _methods["/mixer/crossFadeSectionVisibility"] = handleMixer;
        _methods["/mixer/deviceSectionVisibility"] = handleMixer;
        _methods["/mixer/sendsSectionVisibility"] = handleMixer;
        _methods["/mixer/ioSectionVisibility"] = handleMixer;
        _methods["/mixer/meterSectionVisibility"] = handleMixer;
    }

    private function handleArranger(osc:OSCMessage):void
    {
        var split:Array = osc.address.split("/");
        split.shift();
        var value:* = osc.arguments[0];
        switch (split[1])
        {
            case "cueMarkerVisibility":
                _model.arranger.cueMarkerVisible = value;
                break;
            case "playbackFollow":
                _model.arranger.playbackFollowVisible = value;
                break;
            case "trackRowHeight":
                _model.arranger.trackRowHeightVisible = value;
                break;
            case "clipLauncherSectionVisibility":
                _model.arranger.clipLauncherVisible = value;
                break;
            case "timeLineVisibility":
                _model.arranger.timelineVisible = value;
                break;
            case "ioSectionVisibility":
                _model.arranger.ioVisible = value;
                break;
            case "effectTracksVisibility":
                _model.arranger.effectTracksVisible = value;
                break;
        }
    }

    private function handleMixer(osc:OSCMessage):void
    {
        var split:Array = osc.address.split("/");
        split.shift();
        var value:* = osc.arguments[0];
        switch (split[1])
        {
            case "clipLauncherSectionVisibility":
                _model.mixer.clipLauncherVisible = value;
                break;
            case "crossFadeSectionVisibility":
                _model.mixer.crossFadeVisible = value;
                break;
            case "deviceSectionVisibility":
                _model.mixer.deviceVisible = value;
                break;
            case "sendsSectionVisibility":
                _model.mixer.sendsVisible = value;
                break;
            case "ioSectionVisibility":
                _model.mixer.ioVisible = value;
                break;
            case "meterSectionVisibility":
                _model.mixer.meterVisible = value;
                break;
        }
    }
}
}
