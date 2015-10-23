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
    //public static const CAN_SCROLL_TRACKS_UP:String = "canScrollTracksUp";
    //public static const CAN_SCROLL_TRACKS_DOWN:String = "canScrollTracksDown";

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

    /**
     * The key value pairs of the OSC message results
     */
    private var _properties:Object = {};

    private var _index:int;

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
        return _properties[NAME];
    }

    public function set name(value:String):void
    {
        if (!setProperty(NAME, value))
            return;

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
        return _properties[EXISTS];
    }

    public function set exists(value:Boolean):void
    {
        if (!setProperty(EXISTS, value))
            return;

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
        return _properties[CAN_HOLD_NOTES];
    }

    public function set canHoldNotes(value:Boolean):void
    {
        if (!setProperty(CAN_HOLD_NOTES, value))
            return;

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
        return _properties[ACTIVATED];
    }

    public function set activated(value:Boolean):void
    {
        if (!setProperty(ACTIVATED, value))
            return;

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
        return _properties[SELECTED];
    }

    public function set selected(value:Boolean):void
    {
        if (!setProperty(SELECTED, value))
            return;

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
        return _properties[VOLUME];
    }

    public function set volume(value:int):void
    {
        if (!setProperty(VOLUME, value))
            return;

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
        return _properties[VOLUME_STRING];
    }

    public function set volumeString(value:String):void
    {
        if (!setProperty(VOLUME_STRING, value))
            return;

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
        return _properties[PAN];
    }

    public function set pan(value:int):void
    {
        if (!setProperty(PAN, value))
            return;

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
        return _properties[PAN_STRING];
    }

    public function set panString(value:String):void
    {
        if (!setProperty(PAN_STRING, value))
            return;

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
        return _properties[MUTE];
    }

    public function set mute(value:Boolean):void
    {
        if (!setProperty(MUTE, value))
            return;

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
        return _properties[SOLO];
    }

    public function set solo(value:Boolean):void
    {
        if (!setProperty(SOLO, value))
            return;

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
        return _properties[RECARM];
    }

    public function set recarm(value:Boolean):void
    {
        if (!setProperty(RECARM, value))
            return;

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
        return _properties[MONITOR];
    }

    public function set monitor(value:Boolean):void
    {
        if (!setProperty(MONITOR, value))
            return;

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
        return _properties[AUTO_MONITOR];
    }

    public function set autoMonitor(value:Boolean):void
    {
        if (!setProperty(AUTO_MONITOR, value))
            return;

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
        return _properties[CROSS_FADE_MODE];
    }

    public function set crossfadeMode(value:String):void
    {
        if (!setProperty(CROSS_FADE_MODE, value))
            return;

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
        return _properties[VU];
    }

    //----------------------------------
    // color
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get color():int
    {
        return _properties[COLOR];
    }

    public function set color(value:int):void
    {
        if (!setProperty(COLOR, value))
            return;

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

    internal function propertyChanged(name:String, value:*):Boolean
    {
        return setProperty(name, value, true);
    }

    internal function setProperty(name:String, value:*, sendChangeEvent:Boolean = true):Boolean
    {
        if (_properties[name] == value)
            return false;

        _properties[name] = value;

        if (sendChangeEvent)
        {
            // updates UI mediators
            dispatch(name + "Change", {index: _index, value: value});
        }

        return true;
    }
}
}
