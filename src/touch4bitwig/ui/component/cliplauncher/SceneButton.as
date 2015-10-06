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

package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.Button;
import feathers.skins.IStyleProvider;

import starling.display.DisplayObject;
import starling.events.Event;

import touch4bitwig.model.state.BitwigScene;

public class SceneButton extends Button
{
    public static const INVALIDATE_FLAG_SCENE:String = "scene";

    public static const INVALIDATION_FLAG_CLIP_STATE:String = "clipState";

    public static var globalStyleProvider:IStyleProvider;

    private var _scene:BitwigScene;
    private var _idleSkin:DisplayObject;
    private var _queuedSkin:DisplayObject;
    private var _dequeuedSkin:DisplayObject;
    private var _playSkin:DisplayObject;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return SceneButton.globalStyleProvider;
    }

    public function set idleSkin(value:DisplayObject):void
    {
        _idleSkin = value;
    }

    public function set queuedSkin(value:DisplayObject):void
    {
        _queuedSkin = value;
    }

    public function set dequeuedSkin(value:DisplayObject):void
    {
        _dequeuedSkin = value;
    }

    public function set playSkin(value:DisplayObject):void
    {
        _playSkin = value;
    }

    public function get scene():BitwigScene
    {
        return _scene;
    }

    public function set scene(value:BitwigScene):void
    {
        if (value == _scene)
            return;
        _scene = value;
        invalidate(INVALIDATE_FLAG_SCENE);
    }

    public function SceneButton()
    {
        super();
    }

    override protected function initialize():void
    {
        super.initialize();

        addEventListener(Event.TRIGGERED, triggeredHandler);
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATE_FLAG_SCENE))
        {
            isEnabled = _scene != null;// && _scene.hasClips;

            if (_scene != null)
            {
                label = scene.name;
            }
            else
            {
                label = "";
                isEnabled = false;
                defaultSkin = disabledSkin;
            }
        }

        if (isInvalid(INVALIDATION_FLAG_CLIP_STATE))
        {
            if (_scene != null)
            {
            }
        }
    }

    public function stateChange():void
    {
        invalidate(INVALIDATION_FLAG_CLIP_STATE);
    }

    private function triggeredHandler(event:Event):void
    {
        dispatchEventWith(ClipLauncher.EVENT_SCENE_TAP, true, _scene);
    }
}
}
