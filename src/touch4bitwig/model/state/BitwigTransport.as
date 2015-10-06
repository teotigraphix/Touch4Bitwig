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

package touch4bitwig.model.state
{

import touch4bitwig.model.event.BitwigTransportEventType;
import touch4bitwig.service.IOSCService;

public class BitwigTransport extends AbstractBitwigState
{
    private var _positionString:String;
    private var _numerator:int;
    private var _denominator:int;
    private var _isAutomationOverride:Boolean;

    private var _tempoRaw:String;
    private var _isClick:Boolean;
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isRepeat:Boolean;
    private var _isPreroll:Boolean;
    private var _isOverdubLauncher:Boolean;
    private var _isOverdub:Boolean;
    private var _isCrossfade:Boolean;
    private var _isAutowriteLauncher:Boolean;
    private var _isAutowrite:Boolean;
    private var _automationWriteMode:String;

    public function get positionString():String
    {
        return _positionString;
    }

    public function set positionString(value:String):void
    {
        if (isSame(_positionString, value))
            return;
        _positionString = value;
        dispatchValue(BitwigTransportEventType.POSITION_STRING_CHANGE, _positionString);
    }

    public function get numerator():int
    {
        return _numerator;
    }

    public function set numerator(value:int):void
    {
        if (isSame(_numerator, value))
            return;
        _numerator = value;
        dispatchValue(BitwigTransportEventType.NUMERATOR_CHANGE, _numerator);
    }

    public function get denominator():int
    {
        return _denominator;
    }

    public function set denominator(value:int):void
    {
        if (isSame(_denominator, value))
            return;
        _denominator = value;
        dispatchValue(BitwigTransportEventType.DENOMINATOR_CHANGE, _denominator);
    }

    public function get isAutomationOverride():Boolean
    {
        return _isAutomationOverride;
    }

    public function set isAutomationOverride(value:Boolean):void
    {
        if (isSame(_isAutomationOverride, value))
            return;
        _isAutomationOverride = value;
        dispatchValue(BitwigTransportEventType.IS_AUTOMATION_OVERRIDE_CHANGE, _isAutomationOverride);
    }

    public function get tempoRaw():String
    {
        return _tempoRaw;
    }

    public function set tempoRaw(value:String):void
    {
        if (isSame(_tempoRaw, value))
            return;
        _tempoRaw = value;
        dispatchValue(BitwigTransportEventType.TEMPO_RAW_CHANGE, _tempoRaw);
    }

    public function get isClick():Boolean
    {
        return _isClick;
    }

    public function set isClick(value:Boolean):void
    {
        if (isSame(_isClick, value))
            return;
        _isClick = value;
        dispatchValue(BitwigTransportEventType.IS_CLICK_CHANGE, _isClick);
    }

    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        if (isSame(_isPlaying, value))
            return;
        _isPlaying = value;
        dispatchValue(BitwigTransportEventType.IS_PLAYING_CHANGE, _isPlaying);
    }

    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        if (isSame(_isRecording, value))
            return;
        _isRecording = value;
        dispatchValue(BitwigTransportEventType.IS_RECORDING_CHANGE, _isRecording);
    }

    public function get isRepeat():Boolean
    {
        return _isRepeat;
    }

    public function set isRepeat(value:Boolean):void
    {
        if (isSame(_isRepeat, value))
            return;
        _isRepeat = value;
        dispatchValue(BitwigTransportEventType.IS_REPEAT_CHANGE, _isRepeat);
    }

    public function get isPreroll():Boolean
    {
        return _isPreroll;
    }

    public function set isPreroll(value:Boolean):void
    {
        if (isSame(_isPreroll, value))
            return;
        _isPreroll = value;
        dispatchValue(BitwigTransportEventType.IS_PRE_ROLL_CHANGE, _isPreroll);
    }

    public function get isOverdubLauncher():Boolean
    {
        return _isOverdubLauncher;
    }

    public function set isOverdubLauncher(value:Boolean):void
    {
        if (isSame(_isOverdubLauncher, value))
            return;
        _isOverdubLauncher = value;
        dispatchValue(BitwigTransportEventType.IS_OVERDUB_LAUNCHER_CHANGE, _isOverdubLauncher);
    }

    public function get isOverdub():Boolean
    {
        return _isOverdub;
    }

    public function set isOverdub(value:Boolean):void
    {
        if (isSame(_isOverdub, value))
            return;
        _isOverdub = value;
        dispatchValue(BitwigTransportEventType.IS_OVERDUB_CHANGE, _isOverdub);
    }

    public function get isCrossfade():Boolean
    {
        return _isCrossfade;
    }

    public function set isCrossfade(value:Boolean):void
    {
        if (isSame(_isCrossfade, value))
            return;
        _isCrossfade = value;
        dispatchValue(BitwigTransportEventType.IS_CROSSFADE_CHANGE, _isCrossfade);
    }

    public function get isAutowriteLauncher():Boolean
    {
        return _isAutowriteLauncher;
    }

    public function set isAutowriteLauncher(value:Boolean):void
    {
        if (isSame(_isAutowriteLauncher, value))
            return;
        _isAutowriteLauncher = value;
        dispatchValue(BitwigTransportEventType.IS_AUTOWRITE_LAUNCHER_CHANGE, _isAutowriteLauncher);
    }

    public function get isAutowrite():Boolean
    {
        return _isAutowrite;
    }

    public function set isAutowrite(value:Boolean):void
    {
        if (isSame(_isAutowrite, value))
            return;
        _isAutowrite = value;
        dispatchValue(BitwigTransportEventType.IS_AUTOWRITE_CHANGE, _isAutowrite);
    }

    public function get automationWriteMode():String
    {
        return _automationWriteMode;
    }

    public function set automationWriteMode(value:String):void
    {
        if (isSame(_automationWriteMode, value))
            return;
        _automationWriteMode = value;
        dispatchValue(BitwigTransportEventType.AUTOMATION_WRITE_MODE_CHANGE, _automationWriteMode);
    }

    public function get automationWriteModeIndex():int
    {
        switch (_automationWriteMode)
        {
            case "latch":
                return 0;
            case "touch":
                return 1;
            case "write":
                return 2;
        }
        return -1;
    }

    public function BitwigTransport(service:IOSCService)
    {
        super(service);
    }

    public function tapTempo():void
    {
        service.send("/tempo/tap");
    }

    public function setTempoRaw(tempo:Number):void
    {
        service.sendFloat("/tempo/raw", tempo);
    }

}
}
