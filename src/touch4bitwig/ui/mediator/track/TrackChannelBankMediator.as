/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.ui.mediator.track
{

import com.teotigraphix.bitwig.event.DeviceModelEventType;
import com.teotigraphix.bitwig.event.TrackModelEventType;
import com.teotigraphix.bitwig.model.DeviceModel;
import com.teotigraphix.bitwig.model.TrackModel;
import com.teotigraphix.bitwig.service.IOSCService;
import com.teotigraphix.bitwig.ui.component.track.TrackChannelBank;
import com.teotigraphix.bitwig.ui.component.track.channel.DeviceParamGroup;
import com.teotigraphix.bitwig.ui.component.track.channel.TrackControlGroup;
import com.teotigraphix.bitwig.ui.component.track.channel.TrackVolumeGroup;
import com.teotigraphix.bitwig.ui.mediator.BitwigTouchMediator;

import starling.events.Event;

public class TrackChannelBankMediator extends BitwigTouchMediator
{
    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var trackModel:TrackModel;

    [Inject]
    public var deviceModel:DeviceModel;

    private var view:TrackChannelBank;
    private var _interactionMap:Object = {};

    public function TrackChannelBankMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(TrackModelEventType.EXISTS_CHANGE, context_trackExistsHandler);

        addContextListener(DeviceModelEventType.MODE_CHANGE, context_modeChangeHandler);

        addContextListener(DeviceModelEventType.PARAM_NAME_CHANGE, context_paramNameChangeHandler);
        addContextListener(DeviceModelEventType.PARAM_VALUE_CHANGE, context_paramValueChangeHandler);
        addContextListener(DeviceModelEventType.PARAM_VALUE_STRING_CHANGE, context_paramValueStringChangeHandler);

        addContextListener(TrackModelEventType.RECORD_CHANGE, context_trackRecordHandler);
        addContextListener(TrackModelEventType.SOLO_CHANGE, context_trackSoloHandler);
        addContextListener(TrackModelEventType.MUTE_CHANGE, context_trackMuteHandler);

        addContextListener(TrackModelEventType.VU_CHANGE, context_trackVUHandler);
        addContextListener(TrackModelEventType.VOLUME_CHANGE, context_trackVolumeHandler);

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
            view.setExists(i, trackModel.bank.tracks[i - 1].exists);

            view.setParamName(i, deviceModel.cursorDevice.bank.params[i - 1].getName(deviceModel.mode));
            view.setParamValue(i, deviceModel.cursorDevice.bank.params[i - 1].getValue(deviceModel.mode));
            view.setParamValueString(i, deviceModel.cursorDevice.bank.params[i - 1].getValueString(deviceModel.mode));

            view.setIsRecarm(i, trackModel.bank.tracks[i - 1].isRecArm);
            view.setIsSolo(i, trackModel.bank.tracks[i - 1].isSolo);
            view.setIsMute(i, trackModel.bank.tracks[i - 1].isMute);

            view.setVU(i, trackModel.bank.tracks[i - 1].vu);
            view.setVolume(i, trackModel.bank.tracks[i - 1].volume);
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

        if (data.mode == deviceModel.mode)
        {
            view.setParamName(data.index, data.value);
        }
    }

    private function context_paramValueChangeHandler(event:Event, data:Object):void
    {
        if (_interactionMap[data.index - 1] == "down")
            return;

        if (data.mode == deviceModel.mode)
        {
            view.setParamValue(data.index, data.value);
        }
    }

    private function context_paramValueStringChangeHandler(event:Event, data:Object):void
    {
        //if (_interactionMap[data.index] == "down")
        //    return;

        if (data.mode == deviceModel.mode)
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
        oscService.sendInt("/device/" + deviceModel.mode + "/" + (index + 1) + "/value", view.getParamValue(index));
    }

    private function view_deviceValueResetHandler(event:Event, index:int):void
    {
        oscService.send("/device/reset/" + deviceModel.mode + "/" + index);
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
