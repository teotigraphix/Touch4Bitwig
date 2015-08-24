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

import feathers.controls.Button;
import feathers.controls.Label;
import feathers.controls.LayoutGroup;
import feathers.skins.IStyleProvider;

import starling.events.Event;

public class TrackNavigationControl extends LayoutGroup
{
    public static const EVENT_UP:String = "up";
    public static const EVENT_DOWN:String = "down";

    public static var globalStyleProvider:IStyleProvider;

    private var _upButton:Button;
    private var _downButton:Button;

    private var _canScrollTracksUp:Boolean;
    private var _canScrollTracksDown:Boolean;
    private var _trackName:String;
    private var _nameLabel:Label;
    private var _skin:TrackNavigationControlSkin;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return TrackNavigationControl.globalStyleProvider;
    }

    public function get canScrollTracksUp():Boolean
    {
        return _canScrollTracksUp;
    }

    public function set canScrollTracksUp(value:Boolean):void
    {
        _canScrollTracksUp = value;
        invalidate(INVALIDATION_FLAG_DATA);
    }

    public function get canScrollTracksDown():Boolean
    {
        return _canScrollTracksDown;
    }

    public function set canScrollTracksDown(value:Boolean):void
    {
        _canScrollTracksDown = value;
        invalidate(INVALIDATION_FLAG_DATA);
    }

    public function get trackName():String
    {
        return _trackName;
    }

    public function set trackName(value:String):void
    {
        _trackName = value;
        invalidate(INVALIDATION_FLAG_DATA);
    }

    public function TrackNavigationControl()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        _skin = new TrackNavigationControlSkin();
        _skin.owner = this;
        addChild(_skin);

        _skin.addEventListener(EVENT_UP, left_triggeredHandler);
        _skin.addEventListener(EVENT_DOWN, right_triggeredHandler);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(width, height);

        if (isInvalid(INVALIDATION_FLAG_DATA))
        {
            _skin.canScrollTracksDown = _canScrollTracksDown;
            _skin.canScrollTracksUp = _canScrollTracksUp;
            _skin.trackName = _trackName;
        }
    }

    private function left_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_UP);
    }

    private function right_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_DOWN);
    }
}
}
