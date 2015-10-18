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

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.IBitwigTransport;
import touch4bitwig.model.event.BitwigTransportEventType;
import touch4bitwig.service.IOSCService;

public class BitwigTransport extends AbstractBitwigState implements IBitwigTransport
{
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _positionString:String;
    private var _numerator:int;
    private var _denominator:int;
    private var _isAutomationOverride:Boolean;

    private var _tempoRaw:String;
    private var _isClick:Boolean;
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isRepeat:Boolean;
    private var _isPreRoll:Boolean;
    private var _isOverdubLauncher:Boolean;
    private var _isOverdub:Boolean;
    private var _isCrossFade:Boolean;
    private var _isAutoWriteLauncher:Boolean;
    private var _isAutoWrite:Boolean;
    private var _automationWriteMode:String;

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // positionString
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // numerator
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // denominator
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isAutomationOverride
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // tempoRaw
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isClick
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isPlaying
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isRecording
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isRepeat
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isPreRoll
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isPreRoll():Boolean
    {
        return _isPreRoll;
    }

    public function set isPreRoll(value:Boolean):void
    {
        if (isSame(_isPreRoll, value))
            return;
        _isPreRoll = value;
        dispatchValue(BitwigTransportEventType.IS_PRE_ROLL_CHANGE, _isPreRoll);
    }

    //----------------------------------
    // isOverdubLauncher
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isOverdub
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // isCrossFade
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isCrossFade():Boolean
    {
        return _isCrossFade;
    }

    public function set isCrossFade(value:Boolean):void
    {
        if (isSame(_isCrossFade, value))
            return;
        _isCrossFade = value;
        dispatchValue(BitwigTransportEventType.IS_CROSSFADE_CHANGE, _isCrossFade);
    }

    //----------------------------------
    // isAutoWriteLauncher
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isAutoWriteLauncher():Boolean
    {
        return _isAutoWriteLauncher;
    }

    public function set isAutoWriteLauncher(value:Boolean):void
    {
        if (isSame(_isAutoWriteLauncher, value))
            return;
        _isAutoWriteLauncher = value;
        dispatchValue(BitwigTransportEventType.IS_AUTOWRITE_LAUNCHER_CHANGE, _isAutoWriteLauncher);
    }

    //----------------------------------
    // isAutoWrite
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get isAutoWrite():Boolean
    {
        return _isAutoWrite;
    }

    public function set isAutoWrite(value:Boolean):void
    {
        if (isSame(_isAutoWrite, value))
            return;
        _isAutoWrite = value;
        dispatchValue(BitwigTransportEventType.IS_AUTOWRITE_CHANGE, _isAutoWrite);
    }

    //----------------------------------
    // automationWriteMode
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //----------------------------------
    // automationWriteModeIndex
    //----------------------------------

    /**
     * @inheritDoc
     */
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

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function BitwigTransport(service:IOSCService)
    {
        super(service);
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    override public function configure():void
    {
        _methods["/position"] = positionHandler;
        _methods["/numerator"] = numeratorHandler;
        _methods["/denominator"] = denominatorHandler;
        _methods["/automationOverride"] = automationOverrideHandler;

        _methods["/tempo/raw"] = tempoRawHandler;
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

    /**
     * @inheritDoc
     */
    override public function dispose():void
    {
        _methods = [];
    }

    /**
     * @inheritDoc
     */
    public function tapTempo():void
    {
        service.send("/tempo/tap");
    }

    /**
     * @inheritDoc
     */
    public function setTempoRaw(tempo:Number):void
    {
        service.sendFloat("/tempo/raw", tempo);
    }

    /**
     * @inheritDoc
     */
    public function togglePlay():void
    {
        service.send("/play");
    }

    /**
     * @inheritDoc
     */
    public function toggleAutoWrite():void
    {
        service.send("/autowrite");
    }

    /**
     * @inheritDoc
     */
    public function toggleRecord():void
    {
        service.send("/record");
    }

    /**
     * @inheritDoc
     */
    public function stop():void
    {
        service.sendInt("/stop", 1);
    }

    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    private function positionHandler(osc:OSCMessage):void
    {
        positionString = osc.arguments[0];
    }

    private function numeratorHandler(osc:OSCMessage):void
    {
        numerator = osc.arguments[0];
    }

    private function denominatorHandler(osc:OSCMessage):void
    {
        denominator = osc.arguments[0];
    }

    private function automationOverrideHandler(osc:OSCMessage):void
    {
        isAutomationOverride = osc.arguments[0];
    }

    private function tempoRawHandler(osc:OSCMessage):void
    {
        tempoRaw = osc.arguments[0];
    }

    private function clickHandler(osc:OSCMessage):void
    {
        isClick = osc.arguments[0];
    }

    private function playHandler(osc:OSCMessage):void
    {
        isPlaying = osc.arguments[0];
    }

    private function recordHandler(osc:OSCMessage):void
    {
        isRecording = osc.arguments[0];
    }

    private function repeatHandler(osc:OSCMessage):void
    {
        isRepeat = osc.arguments[0];
    }

    private function prerollHandler(osc:OSCMessage):void
    {
        isPreRoll = osc.arguments[0];
    }

    private function overdubLauncherHandler(osc:OSCMessage):void
    {
        isOverdubLauncher = osc.arguments[0];
    }

    private function overdubHandler(osc:OSCMessage):void
    {
        isOverdub = osc.arguments[0];
    }

    private function corssfadeHandler(osc:OSCMessage):void
    {
        isCrossFade = osc.arguments[0];
    }

    private function autoWriteHandler(osc:OSCMessage):void
    {
        isAutoWrite = osc.arguments[0];
    }

    private function autowriteLauncherHandler(osc:OSCMessage):void
    {
        isAutoWriteLauncher = osc.arguments[0];
    }

    private function automationWriteModeHandler(osc:OSCMessage):void
    {
        automationWriteMode = osc.arguments[0];
    }
}
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