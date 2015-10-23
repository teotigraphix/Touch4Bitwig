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

package touch4bitwig.ui.component.track
{

import starling.events.Event;

import touch4bitwig.model.IBitwigTrack;

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.model.event.BitwigTrackEventType;
import touch4bitwig.service.IOSCService;
import touch4bitwig.ui.component.track.channel.DeviceParamGroup;
import touch4bitwig.ui.component.track.channel.TrackControlGroup;
import touch4bitwig.ui.component.track.channel.TrackVolumeGroup;
import touch4bitwig.ui.AbstractUIMediator;

public class TrackChannelBankMediator extends AbstractUIMediator
{
    private var view:TrackChannelBank;
    private var _interactionMap:Object = {};

    public function TrackChannelBankMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(BitwigTrackEventType.EXISTS_CHANGE, context_trackExistsHandler);

        addContextListener(BitwigDeviceEventType.MODE_CHANGE, context_modeChangeHandler);

        addContextListener(BitwigDeviceEventType.PARAM_NAME_CHANGE, context_paramNameChangeHandler);
        addContextListener(BitwigDeviceEventType.PARAM_VALUE_CHANGE, context_paramValueChangeHandler);
        addContextListener(BitwigDeviceEventType.PARAM_VALUE_STRING_CHANGE, context_paramValueStringChangeHandler);

        addContextListener(BitwigTrackEventType.RECORD_CHANGE, context_trackRecordHandler);
        addContextListener(BitwigTrackEventType.SOLO_CHANGE, context_trackSoloHandler);
        addContextListener(BitwigTrackEventType.MUTE_CHANGE, context_trackMuteHandler);

        addContextListener(BitwigTrackEventType.VU_CHANGE, context_trackVUHandler);
        addContextListener(BitwigTrackEventType.VOLUME_CHANGE, context_trackVolumeHandler);

        addViewListener(DeviceParamGroup.EVENT_DEVICE_VALUE_CHANGE, view_deviceValueChangeHandler);
        addViewListener(DeviceParamGroup.EVENT_DEVICE_VALUE_RESET, view_deviceValueResetHandler);
        addViewListener(DeviceParamGroup.EVENT_INTERACTION_CHANGE, view_interactionChangeHandler);

        addViewListener(TrackControlGroup.EVENT_RECARM_CHANGE, view_recordChangeHandler);
        addViewListener(TrackControlGroup.EVENT_SOLO_CHANGE, view_soloChangeHandler);
        addViewListener(TrackControlGroup.EVENT_MUTE_CHANGE, view_muteChangeHandler);

        addViewListener(TrackVolumeGroup.EVENT_VOLUME_CHANGE, view_volumeChangeHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        redrawView();

        oscService.sendInt("/device/indicate/param", 1);
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = TrackChannelBank(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function redrawView():void
    {
        for (var i:int = 1; i < 9; i++)
        {
            var track:IBitwigTrack = oscModel.trackBank.getTrack(i - 1);
            view.setExists(i, track.exists);

            view.setParamName(i, oscModel.cursorDevice.bank.params[i - 1].getName(oscModel.deviceMode));
            view.setParamValue(i, oscModel.cursorDevice.bank.params[i - 1].getValue(oscModel.deviceMode));
            view.setParamValueString(i, oscModel.cursorDevice.bank.params[i - 1].getValueString(oscModel.deviceMode));

            view.setIsRecarm(i, track.recarm);
            view.setIsSolo(i, track.solo);
            view.setIsMute(i, track.mute);

            view.setVU(i, track.vu);
            view.setVolume(i, track.volume);
        }
    }

    private function context_modeChangeHandler(event:Event, mode:String):void
    {
        redrawView();
    }

    private function context_trackExistsHandler(event:Event, data:Object):void
    {
        view.setExists(data.index, data.value);
    }

    private function context_paramNameChangeHandler(event:Event, data:Object):void
    {
        //if (_interactionMap[data.index] == "down")
        //    return;

        if (data.mode == oscModel.deviceMode)
        {
            view.setParamName(data.index, data.value);
        }
    }

    private function context_paramValueChangeHandler(event:Event, data:Object):void
    {
        if (_interactionMap[data.index - 1] == "down")
            return;

        if (data.mode == oscModel.deviceMode)
        {
            view.setParamValue(data.index, data.value);
        }
    }

    private function context_paramValueStringChangeHandler(event:Event, data:Object):void
    {
        //if (_interactionMap[data.index] == "down")
        //    return;

        if (data.mode == oscModel.deviceMode)
        {
            view.setParamValueString(data.index, data.value);
        }
    }

    private function context_trackRecordHandler(event:Event, data:Object):void
    {
        view.setIsRecarm(data.index, data.value);
    }

    private function context_trackSoloHandler(event:Event, data:Object):void
    {
        view.setIsSolo(data.index, data.value);
    }

    private function context_trackMuteHandler(event:Event, data:Object):void
    {
        view.setIsMute(data.index, data.value);
    }

    private function context_trackVUHandler(event:Event, data:Object):void
    {
        view.setVU(data.index, data.value);
    }

    //---------------------------------------

    private function context_trackVolumeHandler(event:Event, data:Object):void
    {
        view.setVolume(data.index, data.value);
    }

    private function view_deviceValueChangeHandler(event:Event, index:int):void
    {
        oscService.sendInt("/device/" + oscModel.deviceMode + "/" + (index + 1) + "/value", view.getParamValue(index));
    }

    private function view_deviceValueResetHandler(event:Event, index:int):void
    {
        oscService.send("/device/reset/" + oscModel.deviceMode + "/" + index);
    }

    private function view_interactionChangeHandler(event:Event, data:Object):void
    {
        _interactionMap[data.index] = data.mode;
    }

    private function view_recordChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/recarm", view.isRecarm(index));
    }

    private function view_soloChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/solo", view.isSolo(index));
    }

    private function view_muteChangeHandler(event:Event, index:int):void
    {
        oscService.sendBoolean("/track/" + (index + 1) + "/mute", view.isMute(index));
    }

    private function view_volumeChangeHandler(event:Event, index:int):void
    {
        oscService.sendInt("/track/" + (index + 1) + "/volume", view.getVolume(index));
    }

}
}
