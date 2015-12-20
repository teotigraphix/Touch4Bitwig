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
    public static const IS_PUNCH_IN:String = "isPunchIn";
    public static const IS_PUNCH_OUT:String = "isPunchOut";
    public static const POSITION_STRING:String = "positionString";

    public static const NUMERATOR:String = "numerator";
    public static const DENOMINATOR:String = "denominator";
    public static const TIME_SIGNATURE:String = "timeSignature";

    public static const IS_AUTOMATION_OVERRIDE:String = "isAutomationOverride";
    public static const TEMPO_RAW:String = "tempoRaw";
    public static const IS_CLICK:String = "isClick";
    public static const IS_PLAYING:String = "isPlaying";
    public static const IS_RECORDING:String = "isRecording";

    public static const IS_REPEAT:String = "isRepeat";
    public static const IS_PRE_ROLL:String = "isPreRoll";
    public static const IS_OVER_DUB_LAUNCHER:String = "isOverdubLauncher";
    public static const IS_OVER_DUB:String = "isOverdub";
    public static const CROSS_FADE:String = "crossFade";
    public static const IS_AUTO_WRITE:String = "isAutoWrite";
    public static const IS_AUTO_WRITE_LAUNCHER:String = "isAutoWriteLauncher";
    public static const AUTOMATION_WRITE_MODE:String = "automationWriteMode";

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
        if (!setProperty(IS_OVER_DUB, value))
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
        if (!setProperty(IS_OVER_DUB_LAUNCHER, value))
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
        if (!setProperty(IS_REPEAT, value))
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
        if (!setProperty(IS_CLICK, value))
            return;
        _isClick = value;
        service.sendBoolean("/click", value);
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
        if (!setProperty(TEMPO_RAW, value))
            return;
        _tempoRaw = value;
        service.sendFloat("/tempo/raw", value);
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
        if (!setProperty(CROSS_FADE, value))
            return;
        _crossFade = value;
        service.sendBoolean("/crossfade", value);
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
        if (!setProperty(AUTOMATION_WRITE_MODE, value))
            return;
        _automationWriteMode = value;
        service.sendString("/automationWriteMode", value);
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
        dispatchValue(BitwigTransportEventType.TIME_SIGNATURE_CHANGE, timeSignature);
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

    public function BitwigTransport(service:IOSCService)
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

    internal function propertyChanged(name:String, value:*):Boolean
    {
        return setProperty(name, value, true);
    }

    internal function setProperty(name:String, value:*, sendChangeEvent:Boolean = true):Boolean
    {
        if (this["_" + name] == value)
            return false;

        this["_" + name] = value;

        if (sendChangeEvent)
        {
            // updates UI mediators
            dispatchValue(name + "Change", value);
        }

        return true;
    }

    private function punchInHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_PUNCH_IN, osc.arguments[0]);
    }

    private function punchOutHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_PUNCH_OUT, osc.arguments[0]);
    }

    private function positionHandler(osc:OSCMessage):void
    {
        propertyChanged(POSITION_STRING, osc.arguments[0]);
    }

    private function numeratorHandler(osc:OSCMessage):void
    {
        propertyChanged(NUMERATOR, osc.arguments[0]);
        dispatchValue(BitwigTransportEventType.TIME_SIGNATURE_CHANGE, timeSignature);
    }

    private function denominatorHandler(osc:OSCMessage):void
    {
        propertyChanged(DENOMINATOR, osc.arguments[0]);
        dispatchValue(BitwigTransportEventType.TIME_SIGNATURE_CHANGE, timeSignature);
    }

    private function automationOverrideHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_AUTOMATION_OVERRIDE, osc.arguments[0]);
    }

    private function tempoRawHandler(osc:OSCMessage):void
    {
        propertyChanged(TEMPO_RAW, osc.arguments[0]);
    }

    private function clickHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_CLICK, osc.arguments[0]);
    }

    private function playHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_PLAYING, osc.arguments[0]);
    }

    private function recordHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_RECORDING, osc.arguments[0]);
    }

    private function repeatHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_REPEAT, osc.arguments[0]);
    }

    private function isPreRollHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_PRE_ROLL, osc.arguments[0]);
    }

    private function isOverdubLauncherHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_OVER_DUB_LAUNCHER, osc.arguments[0]);
    }

    private function isOverdubHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_OVER_DUB, osc.arguments[0]);
    }

    private function crossFadeHandler(osc:OSCMessage):void
    {
        propertyChanged(CROSS_FADE, osc.arguments[0]);
    }

    private function autoWriteHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_AUTO_WRITE, osc.arguments[0]);
    }

    //

    private function autoWriteLauncherHandler(osc:OSCMessage):void
    {
        propertyChanged(IS_AUTO_WRITE_LAUNCHER, osc.arguments[0]);
    }

    private function automationWriteModeHandler(osc:OSCMessage):void
    {
        propertyChanged(AUTOMATION_WRITE_MODE, osc.arguments[0]);
    }
}
}