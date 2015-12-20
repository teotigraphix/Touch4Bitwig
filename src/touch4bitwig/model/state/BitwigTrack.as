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

import touch4bitwig.model.IBitwigTrack;
import touch4bitwig.service.IOSCService;

public class BitwigTrack extends AbstractBitwigState implements IBitwigTrack
{
    public static const TAG:String = "BitwigTrack/";

    public static const NAME:String = "name";
    public static const EXISTS:String = "exists";
    public static const CAN_HOLD_NOTES:String = "canHoldNotes";
    public static const ACTIVATED:String = "activated";
    public static const SELECTED:String = "selected";
    public static const VOLUME:String = "volume";
    public static const VOLUME_STRING:String = "volumeString";
    public static const PAN:String = "pan";
    public static const PAN_STRING:String = "panString";
    public static const MUTE:String = "mute";
    public static const SOLO:String = "solo";
    public static const RECARM:String = "recarm";
    public static const MONITOR:String = "monitor";
    public static const AUTO_MONITOR:String = "autoMonitor";
    public static const CROSS_FADE_MODE:String = "crossfadeMode";
    public static const VU:String = "vu";
    public static const COLOR:String = "color";

    // TODO /track/{1-8}/send/{1-8}/volume {0-127} BitwigTrackSend

    // TODO /track/selected/{attribute} Sends all attributes (as above) of the currently
    // selected track of the active track bank

    // TODO /master/... as above, except sends

    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _index:int;

    private var _canHoldNotes:Boolean;
    private var _exists:Boolean;
    private var _activated:Boolean;
    private var _selected:Boolean;
    private var _name:String;
    private var _volumeString:String;
    private var _volume:int;
    private var _panString:String;
    private var _pan:int;
    private var _color:int;
    private var _mute:Boolean;
    private var _solo:Boolean;
    private var _recarm:Boolean;
    private var _monitor:Boolean;
    private var _autoMonitor:Boolean;
    private var _vu:int;
    private var _crossFadeMode:String;

    private var _clips:Vector.<BitwigClip> = new Vector.<BitwigClip>(8, true);

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // index
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get index():int
    {
        return _index;
    }

    //----------------------------------
    // name
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        if (!setProperty(NAME, value))
            return;
        _name = value;
        service.sendString("/track/" + _index + 1 + "/name", value);
    }

    //----------------------------------
    // exists
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get exists():Boolean
    {
        return _exists;
    }

    public function set exists(value:Boolean):void
    {
        if (!setProperty(EXISTS, value))
            return;
        _exists = value;
        service.sendBoolean("/track/" + index + "/exists", value);
    }

    //----------------------------------
    // canHoldNotes
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get canHoldNotes():Boolean
    {
        return _canHoldNotes;
    }

    public function set canHoldNotes(value:Boolean):void
    {
        if (!setProperty(CAN_HOLD_NOTES, value))
            return;
        _canHoldNotes = value;
        service.sendBoolean("/track/" + index + "/canHoldNotes", value);
    }

    //----------------------------------
    // activated
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get activated():Boolean
    {
        return _activated;
    }

    public function set activated(value:Boolean):void
    {
        if (!setProperty(ACTIVATED, value))
            return;
        _activated = value;
        service.sendBoolean("/track/" + index + "/activated", value);
    }

    //----------------------------------
    // selected
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get selected():Boolean
    {
        return _selected;
    }

    public function set selected(value:Boolean):void
    {
        if (!setProperty(SELECTED, value))
            return;
        _selected = value;
        service.sendBoolean("/track/" + index + "/selected", value);
    }

    //----------------------------------
    // volume
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get volume():int
    {
        return _volume;
    }

    public function set volume(value:int):void
    {
        if (!setProperty(VOLUME, value))
            return;
        _volume = value;
        service.sendInt("/track/" + index + "/volume", value);
    }

    //----------------------------------
    // volumeString
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get volumeString():String
    {
        return _volumeString;
    }

    public function set volumeString(value:String):void
    {
        if (!setProperty(VOLUME_STRING, value))
            return;
        _volumeString = value;
        service.sendString("/track/" + index + "/volumeStr", value);
    }

    //----------------------------------
    // pan
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get pan():int
    {
        return _pan;
    }

    public function set pan(value:int):void
    {
        if (!setProperty(PAN, value))
            return;
        _pan = value;
        service.sendInt("/track/" + index + "/pan", value);
    }

    //----------------------------------
    // panString
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get panString():String
    {
        return _panString;
    }

    public function set panString(value:String):void
    {
        if (!setProperty(PAN_STRING, value))
            return;
        _panString = value;
        service.sendString("/track/" + index + "/panStr", value);
    }

    //----------------------------------
    // mute
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get mute():Boolean
    {
        return _mute;
    }

    public function set mute(value:Boolean):void
    {
        if (!setProperty(MUTE, value))
            return;
        _mute = value;
        service.sendBoolean("/track/" + index + "/mute", value);
    }

    //----------------------------------
    // solo
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get solo():Boolean
    {
        return _solo;
    }

    public function set solo(value:Boolean):void
    {
        if (!setProperty(SOLO, value))
            return;
        _solo = value;
        service.sendBoolean("/track/" + index + "/solo", value);
    }

    //----------------------------------
    // recarm
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get recarm():Boolean
    {
        return _recarm;
    }

    public function set recarm(value:Boolean):void
    {
        if (!setProperty(RECARM, value))
            return;
        _recarm = value;
        service.sendBoolean("/track/" + index + "/recarm", value);
    }

    //----------------------------------
    // monitor
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get monitor():Boolean
    {
        return _monitor;
    }

    public function set monitor(value:Boolean):void
    {
        if (!setProperty(MONITOR, value))
            return;
        _monitor = value;
        service.sendBoolean("/track/" + index + "/monitor", value);
    }

    //----------------------------------
    // autoMonitor
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get autoMonitor():Boolean
    {
        return _autoMonitor;
    }

    public function set autoMonitor(value:Boolean):void
    {
        if (!setProperty(AUTO_MONITOR, value))
            return;
        _autoMonitor = value;
        service.sendBoolean("/track/" + index + "/autoMonitor", value);
    }

    //----------------------------------
    // crossfadeMode
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get crossfadeMode():String
    {
        return _crossFadeMode;
    }

    public function set crossfadeMode(value:String):void
    {
        if (!setProperty(CROSS_FADE_MODE, value))
            return;
        _crossFadeMode = value;
        service.sendString("/track/" + index + "/crossfadeMode", value);
    }

    //----------------------------------
    // vu
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get vu():int
    {
        return _vu;
    }

    //----------------------------------
    // color
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get color():int
    {
        return _color;
    }

    public function set color(value:int):void
    {
        if (!setProperty(COLOR, value))
            return;
        _color = value;
        service.sendInt("/track/" + index + "/color", value);
    }

    //----------------------------------
    // color
    //----------------------------------

    /**
     * Used by the BitwigTrackBank handlers.
     */
    internal function get clips():Vector.<BitwigClip>
    {
        return _clips;
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function BitwigTrack(index:int, service:IOSCService)
    {
        super(service);
        _index = index;
        for (var i:int = 0; i < _clips.length; i++)
        {
            _clips[i] = new BitwigClip(i + 1, this, service);
        }
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function getClip(index:int):BitwigClip
    {
        return _clips[index];
    }

    /**
     * @inheritDoc
     */
    public function stop():void
    {
        service.send("/track/" + _index + "/clip/stop");
    }

    /**
     * @inheritDoc
     */
    public function returnToArrangement():void
    {
        service.send("/track/" + _index + "/clip/returntoarrangement");
    }

    internal function propertyChanged(name:String, value:*):Boolean
    {
        return setProperty(name, value, true);
    }

    internal function setProperty(name:String, value:*, sendChangeEvent:Boolean = false):Boolean
    {
        if (this["_" + name] == value)
            return false;

        this["_" + name] = value;

        if (sendChangeEvent)
        {
            // updates UI mediators
            dispatch(TAG + name + "Change", {index: _index, value: value});
        }

        return true;
    }
}
}
