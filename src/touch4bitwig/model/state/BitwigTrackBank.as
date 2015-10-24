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

import touch4bitwig.model.IBitwigTrack;
import touch4bitwig.model.IBitwigTrackBank;
import touch4bitwig.model.event.BitwigTrackEventType;
import touch4bitwig.service.IOSCService;

public class BitwigTrackBank extends AbstractBitwigState implements IBitwigTrackBank
{
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _tracks:Vector.<BitwigTrack> = new Vector.<BitwigTrack>(8, true);

    private var _scenes:Vector.<BitwigScene> = new Vector.<BitwigScene>(8, true);

    private var _canScrollTracksUp:Boolean;
    private var _canScrollTracksDown:Boolean;

    //----------------------------------
    // length
    //----------------------------------

    public function get length():int
    {
        return 8;
    }

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // canScrollTracksUp
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get canScrollTracksUp():Boolean
    {
        return _canScrollTracksUp;
    }

    public function set canScrollTracksUp(value:Boolean):void
    {
        if (isSame(_canScrollTracksUp, value))
            return;
        _canScrollTracksUp = value;
        dispatchValue(BitwigTrackEventType.CAN_SCROLL_TRACKS_UP, _canScrollTracksUp);
    }

    //----------------------------------
    // canScrollTracksDown
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get canScrollTracksDown():Boolean
    {
        return _canScrollTracksDown;
    }

    public function set canScrollTracksDown(value:Boolean):void
    {
        if (isSame(_canScrollTracksDown, value))
            return;
        _canScrollTracksDown = value;
        dispatchValue(BitwigTrackEventType.CAN_SCROLL_TRACKS_DOWN, _canScrollTracksDown);
    }

    //----------------------------------
    // selectedTrack
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get selectedTrack():BitwigTrack
    {
        for each (var track:BitwigTrack in _tracks)
        {
            if (track.selected)
                return track;
        }
        return null;
    }

    //----------------------------------
    // scenes
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get scenes():Vector.<BitwigScene>
    {
        return _scenes;
    }

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function BitwigTrackBank(service:IOSCService)
    {
        super(service);
        for (var i:int = 0; i < _tracks.length; i++)
        {
            _tracks[i] = new BitwigTrack(i + 1, service);
            _scenes[i] = new BitwigScene(i + 1, service);
        }
    }

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    override public function configure():void
    {
        // manages Track, Scene and Clip handlers

        _methods["/track/canScrollTracksUp"] = canScrollTracksUpHandler;
        _methods["/track/canScrollTracksDown"] = canScrollTracksDownHandler;

        for (var i:int = 1; i < 9; i++)
        {
            _methods["/track/" + i + "/canHoldNotes"] = trackCanHoldNotesHandler;
            _methods["/track/" + i + "/exists"] = trackExistsHandler;
            _methods["/track/" + i + "/selected"] = trackSelectedHandler;
            _methods["/track/" + i + "/name"] = trackNameHandler;
            _methods["/track/" + i + "/color"] = trackColorHandler;
            _methods["/track/" + i + "/recarm"] = trackRecArmHandler;
            _methods["/track/" + i + "/solo"] = trackSoloHandler;
            _methods["/track/" + i + "/mute"] = trackMuteHandler;
            _methods["/track/" + i + "/volume"] = trackVolumeHandler;
            _methods["/track/" + i + "/pan"] = trackPanHandler;
            _methods["/track/" + i + "/volumeStr"] = trackVolumeStrHandler;
            _methods["/track/" + i + "/panStr"] = trackPanStrHandler;
            _methods["/track/" + i + "/vu"] = trackVUHandler;

            for (var j:int = 1; j < 9; j++)
            {
                _methods["/track/" + i + "/clip/" + j + "/name"] = clipNameHandler;
                _methods["/track/" + i + "/clip/" + j + "/selected"] = clipIsSelectedHandler;
                _methods["/track/" + i + "/clip/" + j + "/hasContent"] = clipHasContentHandler;
                _methods["/track/" + i + "/clip/" + j + "/color"] = clipColorHandler;
                _methods["/track/" + i + "/clip/" + j + "/isPlaying"] = clipIsPlayingHandler;
                _methods["/track/" + i + "/clip/" + j + "/isRecording"] = clipIsRecordingHandler;
                _methods["/track/" + i + "/clip/" + j + "/isQueued"] = clipIsQueuedHandler;
            }
        }
    }

    override public function dispose():void
    {
        super.dispose();
    }

    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function getTrack(index:int):IBitwigTrack
    {
        return _tracks[index - 1];
    }

    /**
     * @inheritDoc
     */
    public function selectChildren(index:int):void
    {
        service.send("/track/" + index + "/enter");
    }

    /**
     * @inheritDoc
     */
    public function select(index:int):void
    {
        service.send("/track/" + index + "/select");
    }

    /**
     * @inheritDoc
     */
    public function selectParent():void
    {
        service.send("/track/parent");
    }

    /**
     * @inheritDoc
     */
    public function scrollTracksUp():void
    {
        service.send("/track/bank/-");
    }

    /**
     * @inheritDoc
     */
    public function scrollTracksDown():void
    {
        service.send("/track/bank/+");
    }

    /**
     * @inheritDoc
     */
    public function scrollTracksPageUp():void
    {
        service.send("/track/-");
    }

    /**
     * @inheritDoc
     */
    public function scrollTracksPageDown():void
    {
        service.send("/track/+");
    }

    /**
     * @inheritDoc
     */
    public function scrollScenesUp():void
    {
        service.send("/scene/-");
    }

    /**
     * @inheritDoc
     */
    public function scrollScenesDown():void
    {
        service.send("/scene/+");
    }

    //

    public function scrollTrackUp():void
    {
    }

    public function scrollTrackDown():void
    {
    }

    public function enableVUs(enabled:Boolean):void
    {
    }

    public function toggleBank():void
    {
    }

    public function addAudioTrack():void
    {
    }

    public function addInstrumentTrack():void
    {
    }

    public function addEffectTrack():void
    {
    }

    /**
     * @inheritDoc
     */
    public function stop():void
    {
        service.send("/track/stop");
    }

    /**
     * @inheritDoc
     */
    public function returnToArrangement():void
    {
        service.send("/track/returntoarrangement");
    }

    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    // TODO Belongs in BitwigTrack ?
    private function canScrollTracksUpHandler(osc:OSCMessage):void
    {
        canScrollTracksUp = osc.arguments[0];
    }

    // TODO Belongs in BitwigTrack ?
    private function canScrollTracksDownHandler(osc:OSCMessage):void
    {
        canScrollTracksDown = osc.arguments[0];
        //tracks[toIndex(osc)].propertyChanged(BitwigTrack.CAN_SCROLL_TRACKS_DOWN, osc.arguments[0]);
    }

    private function trackCanHoldNotesHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.CAN_HOLD_NOTES, osc.arguments[0]);
    }

    private function trackExistsHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.EXISTS, osc.arguments[0]);
    }

    private function trackSelectedHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.SELECTED, osc.arguments[0]);
    }

    private function trackNameHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.NAME, osc.arguments[0]);
    }

    private function trackColorHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.COLOR, toColor(osc));
    }

    private function trackRecArmHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.RECARM, osc.arguments[0]);
    }

    private function trackSoloHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.SOLO, osc.arguments[0]);
    }

    private function trackMuteHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.MUTE, osc.arguments[0]);
    }

    private function trackVolumeHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.VOLUME, osc.arguments[0]);
    }

    private function trackVolumeStrHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.VOLUME_STRING, osc.arguments[0]);
    }

    private function trackPanHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.PAN, osc.arguments[0]);
    }

    private function trackPanStrHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.PAN_STRING, osc.arguments[0]);
    }

    private function trackVUHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].propertyChanged(BitwigTrack.VU, osc.arguments[0]);
    }

    //----------------------------------
    // Clips
    //----------------------------------

    private function clipNameHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].name = osc.arguments[0];
    }

    private function clipIsSelectedHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].isSelected = osc.arguments[0];
    }

    private function clipHasContentHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].hasContent = osc.arguments[0];
    }

    private function clipColorHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].color = toColor(osc);
    }

    private function clipIsPlayingHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].isPlaying = osc.arguments[0];
    }

    private function clipIsRecordingHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].isRecording = osc.arguments[0];
    }

    private function clipIsQueuedHandler(osc:OSCMessage):void
    {
        _tracks[toIndex(osc)].clips[toClipIndex(osc)].isQueued = osc.arguments[0];
    }

    public static function toColor(osc:OSCMessage):uint
    {
        // RGB(1,0.34117648005485535,0.0235294122248888)"
        var value:String = osc.arguments[0];
        value = value.substring(4, value.length - 1);
        var colors:Array = value.split(",");
        var rgb:uint = (((255 * Number(colors[0])) & 0x0ff) << 16) |
                (((255 * Number(colors[1])) & 0x0ff) << 8) |
                ((255 * Number(colors[2])) & 0x0ff);
        return rgb;
    }

    private static function toIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[2]) - 1;
    }

    private static function toClipIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[4]) - 1;
    }
}
}
