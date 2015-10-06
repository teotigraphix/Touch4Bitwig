////////////////////////////////////////////////////////////////////////////////
// Copyright 2015 Michael Schmalle - Teoti Graphix, LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License
//
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.state.BitwigArranger;
import touch4bitwig.model.state.BitwigMixer;
import touch4bitwig.service.IOSCService;

public class PanelListener extends AbstractOSCListener
{
    private var _arranger:BitwigArranger;
    private var _mixer:BitwigMixer;

    public function PanelListener(service:IOSCService, arranger:BitwigArranger, mixer:BitwigMixer)
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
