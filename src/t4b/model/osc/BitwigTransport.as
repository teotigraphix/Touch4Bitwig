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

package t4b.model.osc
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import t4b.model.event.BitwigTransportEventType;
import t4b.service.OSCService;

public class BitwigTransport extends AbstractBitwigState
{
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------
    
    private var _tempoRaw:Number;
    private var _isClick:Boolean;
    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isRepeat:Boolean;
    private var _isPreRoll:Boolean;
    private var _isOverdubLauncher:Boolean;
    private var _isOverdub:Boolean;
    private var _crossFade:int;
    private var _isAutoWriteLauncher:Boolean;
    private var _isAutoWrite:Boolean;
    private var _automationWriteMode:String;
    private var _isPunchIn:Boolean;
    private var _isPunchOut:Boolean;
    
    private var _positionString:String;
    private var _numerator:int;
    private var _denominator:int;
    private var _isAutomationOverride:Boolean;
    
    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------
    
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
        if (_isOverdub == value)
            return;
        _isOverdub = value;
        service.sendBoolean("/overdub", value);
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
        if (_isOverdubLauncher == value)
            return;
        _isOverdubLauncher = value;
        service.sendBoolean("/overdub/launcher", value);
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
        if (_isRepeat == value)
            return;
        _isRepeat = value;
        service.sendBoolean("/repeat", value);
    }
    
    //----------------------------------
    // isPunchIn
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get isPunchIn():Boolean
    {
        return _isPunchIn;
    }
    
    //----------------------------------
    // isPunchOut
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get isPunchOut():Boolean
    {
        return _isPunchOut;
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
        if (_isClick == value)
            return;
        _isClick = value;
        service.sendBoolean("/click", _isClick);
    }
    
    //----------------------------------
    // tempoRaw
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get tempoRaw():Number
    {
        return _tempoRaw;
    }
    
    public function set tempoRaw(value:Number):void
    {
        if (_tempoRaw == value)
            return;
        _tempoRaw = value;
        service.sendFloat("/tempo/raw", _tempoRaw);
    }
    
    //----------------------------------
    // crossFade
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get crossFade():int
    {
        return _crossFade;
    }
    
    public function set crossFade(value:int):void
    {
        if (_crossFade == value)
            return;
        _crossFade = value;
        service.sendBoolean("/crossfade", _crossFade);
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
    
    //-----------
    
    //----------------------------------
    // isPreRoll
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    [ReadOnly]
    public function get isPreRoll():Boolean
    {
        return _isPreRoll;
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
        if (_automationWriteMode == value)
            return;
        _automationWriteMode = value;
        service.sendString("/automationWriteMode", _automationWriteMode);
    }
    
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
    
    // TODO
    public function set numerator(value:int):void
    {
        //if (!setProperty(NUMERATOR, value))
        //    return;
        //_numerator = value;
        //service.sendString("/numerator", value);
        //dispatchValue(BitwigTransportEventType.NUMERATOR_CHANGE, _numerator);
        //dispatchValue(BitwigTransportEventType.TIME_SIGNATURE_CHANGE, timeSignature);
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
    
    // TODO
    public function set denominator(value:int):void
    {
        //if (!setProperty(DENOMINATOR, value))
        //    return;
        //_denominator = value;
        //service.sendString("/denominator", value);
        //dispatchValue(BitwigTransportEventType.NUMERATOR_CHANGE, _denominator);
        //dispatchValue(BitwigTransportEventType.TIME_SIGNATURE_CHANGE, timeSignature);
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
    
    //----------------------------------
    // timeSignature
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get timeSignature():String
    {
        return _numerator + "/" + _denominator;
    }
    
    public function set timeSignature(value:String):void
    {
        service.sendString("timeSignature", value);
        propertyChange(BitwigTransportEventType.TIME_SIGNATURE, timeSignature);
    }
    
    //------
    
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
    
    public function BitwigTransport(service:OSCService)
    {
        super(service);
    }
    
    /**
     * @inheritDoc
     */
    override public function configure():void
    {
        _methods["/play"] = playHandler;
        _methods["/record"] = recordHandler;
        _methods["/overdub"] = isOverdubHandler;
        _methods["/overdub/launcher"] = isOverdubLauncherHandler;
        _methods["/repeat"] = repeatHandler;
        _methods["/punchIn"] = punchInHandler;
        _methods["/punchOut"] = punchOutHandler;
        _methods["/click"] = clickHandler;
        _methods["/preroll"] = isPreRollHandler;
        _methods["/tempo/raw"] = tempoRawHandler;
        _methods["/crossfade"] = crossFadeHandler;
        _methods["/autowrite"] = autoWriteHandler;
        _methods["/autowrite/launcher"] = autoWriteLauncherHandler;
        _methods["/automationWriteMode"] = automationWriteModeHandler; // {latch,touch,write}
        _methods["/position"] = positionHandler;
        
        _methods["/numerator"] = numeratorHandler;
        _methods["/denominator"] = denominatorHandler;
        _methods["/automationOverride"] = automationOverrideHandler;
    }
    
    /**
     * @inheritDoc
     */
    override public function dispose():void
    {
        _methods = [];
    }
    
    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------
    
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
    public function stop(reset:Boolean = false):void
    {
        if (!reset)
        {
            service.sendInt("/stop", 1);
        }
        else
        {
            service.send("/stop");
        }
    }
    
    /**
     * @inheritDoc
     */
    public function restart():void
    {
        service.send("/restart");
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
    public function togglePunchIn():void
    {
        service.send("/punchIn");
    }
    
    /**
     * @inheritDoc
     */
    public function togglePunchOut():void
    {
        service.send("/punchOut");
    }
    
    /**
     * @inheritDoc
     */
    public function toggleClick():void
    {
        service.send("/click");
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
    public function incTempo(value:Number = 1):void
    {
        service.sendFloat("/tempo/+", value);
    }
    
    /**
     * @inheritDoc
     */
    public function decTempo(value:Number = 1):void
    {
        service.sendFloat("/tempo/-", value);
    }
    
    /**
     * @inheritDoc
     */
    public function setPosition(value:Number):void
    {
        service.send("/position/-");
    }
    
    /**
     * @inheritDoc
     */
    public function incPosition(fine:Boolean = false):void
    {
        if (!fine)
        {
            service.send("/position/++");
        }
        else
        {
            service.send("/position/+");
        }
    }
    
    /**
     * @inheritDoc
     */
    public function decPosition(fine:Boolean = false):void
    {
        if (!fine)
        {
            service.send("/position/--");
        }
        else
        {
            service.send("/position/-");
        }
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
    public function toggleAutoWriteLauncher():void
    {
        service.send("/autowrite/launcher");
    }
    
    /**
     * @inheritDoc
     */
    public function resetAutomationOverride():void
    {
        service.send("/automationOverride");
    }
    
    /**
     * @inheritDoc
     */
    public function forward(isLarge:Boolean = false):void
    {
        service.send("/position/" + isLarge ? "++" : "+");
    }
    
    /**
     * @inheritDoc
     */
    public function rewind(isLarge:Boolean = false):void
    {
        service.send("/position/" + isLarge ? "--" : "-");
    }
    
    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    private function punchInHandler(osc:OSCMessage):void
    {
        if (_isPunchIn == osc.arguments[0])
            return;
        _isPunchIn = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_PUNCH_IN, _isPunchIn);
    }
    
    private function punchOutHandler(osc:OSCMessage):void
    {
        if (_isPunchOut == osc.arguments[0])
            return;
        _isPunchOut = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_PUNCH_OUT, _isPunchOut);
    }
    
    private function positionHandler(osc:OSCMessage):void
    {
        if (_positionString == osc.arguments[0])
            return;
        _positionString = osc.arguments[0];
        propertyChange(BitwigTransportEventType.POSITION_STRING, _positionString);
    }
    
    private function numeratorHandler(osc:OSCMessage):void
    {
        if (_numerator == osc.arguments[0])
            return;
        _numerator = osc.arguments[0];
        propertyChange(BitwigTransportEventType.TIME_SIGNATURE, timeSignature);
    }
    
    private function denominatorHandler(osc:OSCMessage):void
    {
        if (_denominator == osc.arguments[0])
            return;
        _denominator = osc.arguments[0];
        propertyChange(BitwigTransportEventType.TIME_SIGNATURE, timeSignature);
    }
    
    private function automationOverrideHandler(osc:OSCMessage):void
    {
        if (_isAutomationOverride == osc.arguments[0])
            return;
        _isAutomationOverride = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_AUTOMATION_OVERRIDE, _isAutomationOverride);
    }
    
    private function tempoRawHandler(osc:OSCMessage):void
    {
        if (_tempoRaw == osc.arguments[0])
            return;
        _tempoRaw = osc.arguments[0];
        propertyChange(BitwigTransportEventType.TEMPO_RAW, _tempoRaw);
    }
    
    private function clickHandler(osc:OSCMessage):void
    {
        if (_isClick == osc.arguments[0])
            return;
        _isClick = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_CLICK, _isClick);
    }
    
    private function playHandler(osc:OSCMessage):void
    {
        if (_isPlaying == osc.arguments[0])
            return;
        _isPlaying = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_PLAYING, _isPlaying);
    }
    
    private function recordHandler(osc:OSCMessage):void
    {
        if (_isRecording == osc.arguments[0])
            return;
        _isRecording = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_RECORDING, _isRecording);
    }
    
    private function repeatHandler(osc:OSCMessage):void
    {
        if (_isRepeat == osc.arguments[0])
            return;
        _isRepeat = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_REPEAT, _isRepeat);
    }
    
    private function isPreRollHandler(osc:OSCMessage):void
    {
        if (_isPreRoll == osc.arguments[0])
            return;
        _isPreRoll = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_PRE_ROLL, _isPreRoll);
    }
    
    private function isOverdubLauncherHandler(osc:OSCMessage):void
    {
        if (_isOverdubLauncher == osc.arguments[0])
            return;
        _isOverdubLauncher = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_OVER_DUB_LAUNCHER, _isOverdubLauncher);
    }
    
    private function isOverdubHandler(osc:OSCMessage):void
    {
        if (_isOverdub == osc.arguments[0])
            return;
        _isOverdub = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_OVER_DUB, _isOverdub);
    }
    
    private function crossFadeHandler(osc:OSCMessage):void
    {
        if (_crossFade == osc.arguments[0])
            return;
        _crossFade = osc.arguments[0];
        propertyChange(BitwigTransportEventType.CROSS_FADE, _crossFade);
    }
    
    private function autoWriteHandler(osc:OSCMessage):void
    {
        if (_isAutoWrite == osc.arguments[0])
            return;
        _isAutoWrite = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_AUTO_WRITE, _isAutoWrite);
    }
    
    //
    
    private function autoWriteLauncherHandler(osc:OSCMessage):void
    {
        if (_isAutoWriteLauncher == osc.arguments[0])
            return;
        _isAutoWriteLauncher = osc.arguments[0];
        propertyChange(BitwigTransportEventType.IS_AUTO_WRITE_LAUNCHER, _isAutoWriteLauncher);
    }
    
    private function automationWriteModeHandler(osc:OSCMessage):void
    {
        if (_automationWriteMode == osc.arguments[0])
            return;
        _automationWriteMode = osc.arguments[0];
        propertyChange(BitwigTransportEventType.AUTOMATION_WRITE_MODE, _automationWriteMode);
    }
    
    override protected function propertyChange(name:String, value:Object):void
    {
        _service.dispatchEventWith(name, false, {value:value});
    }
}
}