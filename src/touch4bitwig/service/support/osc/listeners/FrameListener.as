/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.state.Arranger;
import touch4bitwig.model.state.Mixer;
import touch4bitwig.service.support.OSCService;

public class FrameListener extends AbstractOSCListener
{
    private var _arranger:Arranger;
    private var _mixer:Mixer;

    public function FrameListener(service:OSCService, arranger:Arranger, mixer:Mixer)
    {
        super(service);
        _arranger = arranger;
        _mixer = mixer;

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
                _arranger.cueMarkerVisible = value;
                break;
            case "playbackFollow":
                _arranger.playbackFollowVisible = value;
                break;
            case "trackRowHeight":
                _arranger.trackRowHeightVisible = value;
                break;
            case "clipLauncherSectionVisibility":
                _arranger.clipLauncherVisible = value;
                break;
            case "timeLineVisibility":
                _arranger.timelineVisible = value;
                break;
            case "ioSectionVisibility":
                _arranger.ioVisible = value;
                break;
            case "effectTracksVisibility":
                _arranger.effectTracksVisible = value;
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
                _mixer.clipLauncherVisible = value;
                break;
            case "crossFadeSectionVisibility":
                _mixer.crossFadeVisible = value;
                break;
            case "deviceSectionVisibility":
                _mixer.deviceVisible = value;
                break;
            case "sendsSectionVisibility":
                _mixer.sendsVisible = value;
                break;
            case "ioSectionVisibility":
                _mixer.ioVisible = value;
                break;
            case "meterSectionVisibility":
                _mixer.meterVisible = value;
                break;
        }
    }
}
}
