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

package touch4bitwig.ui.component.track.channel
{

import com.teotigraphix.ui.component.UIKnob;

import feathers.skins.IStyleProvider;

import starling.display.DisplayObject;

public class DeviceKnob extends UIKnob
{
    public static var globalStyleProvider:IStyleProvider;
    public var indicatorSkin:DisplayObject;
    private var _index:int = -1;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return DeviceKnob.globalStyleProvider;
    }

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function DeviceKnob()
    {
        maxWidth = maxHeight = 75;
    }

    override protected function draw():void
    {
        super.draw();

        if (indicatorSkin != null && indicatorSkin.parent == null)
        {
            addChild(indicatorSkin);
            indicatorSkin.scaleX = 0.5;
            indicatorSkin.scaleY = 0.5;
        }

        if (knobThumbSkin != null)
        {
            knobThumbSkin.visible = _isEnabled;
        }

        if (indicatorSkin != null)
        {
            indicatorSkin.x = ((actualWidth - indicatorSkin.width) / 2);
            indicatorSkin.y = ((actualWidth - indicatorSkin.width) / 2);

            indicatorSkin.visible = _isEnabled;
        }
    }
}
}
