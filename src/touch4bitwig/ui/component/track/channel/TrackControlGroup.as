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

package touch4bitwig.ui.component.track.channel {

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.events.Event;

public class TrackControlGroup extends LayoutGroup {
    public static const EVENT_RECARM_CHANGE:String = "recarmChange";
    public static const EVENT_SOLO_CHANGE:String = "soloChange";
    public static const EVENT_MUTE_CHANGE:String = "muteChange";

    private const INVALIDATE_FLAG_RECARM:String = "recarm";
    private const INVALIDATE_FLAG_SOLO:String = "solo";
    private const INVALIDATE_FLAG_MUTE:String = "volume";

    public function TrackControlGroup() {
    }
    private var _recarmButton:UIToggleButton;
    private var _soloButton:UIToggleButton;
    private var _muteButton:UIToggleButton;

    private var _index:int = -1;

    public function get index():int {
        return _index;
    }

    public function set index(value:int):void {
        _index = value;
    }

    private var _isRecarm:Boolean;

    public function get isRecarm():Boolean {
        return _isRecarm;
    }

    public function set isRecarm(value:Boolean):void {
        if (_isRecarm == value)
            return;
        _isRecarm = value;
        invalidate(INVALIDATE_FLAG_RECARM);
    }

    private var _isSolo:Boolean;

    public function get isSolo():Boolean {
        return _isSolo;
    }

    public function set isSolo(value:Boolean):void {
        if (_isSolo == value)
            return;
        _isSolo = value;
        invalidate(INVALIDATE_FLAG_SOLO);
    }

    private var _isMute:Boolean;

    public function get isMute():Boolean {
        return _isMute;
    }

    public function set isMute(value:Boolean):void {
        if (_isMute == value)
            return;
        _isMute = value;
        invalidate(INVALIDATE_FLAG_MUTE);
    }

    override protected function initialize():void {
        var l:VerticalLayout = new VerticalLayout();
        l.padding = AssetMap.size(4);
        l.gap = AssetMap.size(4);
        layout = l;
        super.initialize();

        _recarmButton = new UIToggleButton();
        _recarmButton.styleNameList.add("track-strip-recarm-button");
        _recarmButton.layoutData = new VerticalLayoutData(100, 100);
        _recarmButton.addEventListener(Event.CHANGE, recordButton_changeHandler);

        _soloButton = new UIToggleButton();
        _soloButton.styleNameList.add("track-strip-solo-button");
        _soloButton.layoutData = new VerticalLayoutData(100, 100);
        _soloButton.addEventListener(Event.CHANGE, soloButton_changeHandler);

        _muteButton = new UIToggleButton();
        _muteButton.styleNameList.add("track-strip-mute-button");
        _muteButton.layoutData = new VerticalLayoutData(100, 100);
        _muteButton.addEventListener(Event.CHANGE, muteButton_changeHandler);

        addChild(_recarmButton);
        addChild(_soloButton);
        addChild(_muteButton);
    }

    override protected function draw():void {
        super.draw();

        if (isInvalid(INVALIDATE_FLAG_RECARM)) {
            _recarmButton.setIsSelected(_isRecarm);
        }

        if (isInvalid(INVALIDATE_FLAG_SOLO)) {
            _soloButton.setIsSelected(_isSolo);
        }

        if (isInvalid(INVALIDATE_FLAG_MUTE)) {
            _muteButton.setIsSelected(_isMute);
        }
    }

    private function recordButton_changeHandler(event:Event):void {
        _isRecarm = _recarmButton.isSelected;
        dispatchEventWith(EVENT_RECARM_CHANGE, true, _index);
    }

    private function soloButton_changeHandler(event:Event):void {
        _isSolo = _soloButton.isSelected;
        dispatchEventWith(EVENT_SOLO_CHANGE, true, _index);
    }

    private function muteButton_changeHandler(event:Event):void {
        _isMute = _muteButton.isSelected;
        dispatchEventWith(EVENT_MUTE_CHANGE, true, _index);
    }
}
}