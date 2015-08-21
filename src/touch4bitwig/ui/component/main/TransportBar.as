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

package touch4bitwig.ui.component.main
{

import feathers.controls.LayoutGroup;

import starling.events.Event;

public class TransportBar extends LayoutGroup implements ITransportBar
{
    private static const INVALIDATE_FLAG_PLAYING:String = "playing";
    private static const INVALIDATE_FLAG_RECORDING:String = "recording";
    private static const INVALIDATE_FLAG_AUTOMATING:String = "automating";

    public static const EVENT_STOP_TRIGGERED:String = "stopTriggered";
    public static const EVENT_PLAY_CHANGE:String = "playChange";
    public static const EVENT_RECORD_CHANGE:String = "recordChange";
    public static const EVENT_AUTOMATION_CHANGE:String = "automationChange";
    public static const EVENT_POPUP_TRIGGERED:String = "popupTriggered";

    private var _skin:TransportBarSkinBase;

    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isAutomating:Boolean;

    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        _skin.isPlaying = value;
    }

    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        if (_isRecording == value)
            return;
        _isRecording = value;
        invalidate(INVALIDATE_FLAG_RECORDING);
    }

    public function get isAutomating():Boolean
    {
        return _isAutomating;
    }

    public function set isAutomating(value:Boolean):void
    {
        if (_isAutomating == value)
            return;
        _isAutomating = value;
        invalidate(INVALIDATE_FLAG_AUTOMATING);
    }

    public function TransportBar()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        _skin = new TransportBarSkin();
        _skin.owner = this;
        addChild(_skin);

        _skin.addEventListener(EVENT_STOP_TRIGGERED, view_stopTriggeredHandler);
        _skin.addEventListener(EVENT_PLAY_CHANGE, view_playChangeHandler);
        _skin.addEventListener(EVENT_RECORD_CHANGE, view_recordChangeHandler);
        _skin.addEventListener(EVENT_AUTOMATION_CHANGE, view_automationChangeHandler);
        _skin.addEventListener(EVENT_POPUP_TRIGGERED, view_popupTriggeredHandler);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(actualWidth, actualHeight);

        if (isInvalid(INVALIDATE_FLAG_RECORDING))
        {
            _skin.isRecording = _isRecording;
        }

        if (isInvalid(INVALIDATE_FLAG_AUTOMATING))
        {
            _skin.isAutomating = _isAutomating;
        }
    }

    private function view_playChangeHandler(event:Event, selected:Boolean):void
    {
        dispatchEventWith(EVENT_PLAY_CHANGE, false, selected);
    }

    private function view_recordChangeHandler(event:Event, selected:Boolean):void
    {
        dispatchEventWith(EVENT_RECORD_CHANGE, false, selected);
    }

    private function view_automationChangeHandler(event:Event, selected:Boolean):void
    {
        dispatchEventWith(EVENT_AUTOMATION_CHANGE, false, selected);
    }

    private function view_stopTriggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_STOP_TRIGGERED);
    }

    private function view_popupTriggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_POPUP_TRIGGERED);
    }

}
}
