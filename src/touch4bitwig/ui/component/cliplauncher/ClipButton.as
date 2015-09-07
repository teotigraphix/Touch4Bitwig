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

import com.teotigraphix.ui.component.UIBorder;

import feathers.controls.Button;
import feathers.skins.IStyleProvider;

import starling.display.DisplayObject;

import touch4bitwig.model.state.Clip;

public class ClipButton extends Button
{
    public static const INVALIDATE_FLAG_CLIP:String = "clip";

    public static const INVALIDATION_FLAG_CLIP_STATE:String = "clipState";

    public static var globalStyleProvider:IStyleProvider;

    public var selectedOverlaySkin:DisplayObject;
    public var playIconSkin:DisplayObject;
    public var stopIconSkin:DisplayObject;
    public var queuedIconSkin:DisplayObject;
    public var idleIconSkin:DisplayObject;
    public var recordIdleIconSkin:DisplayObject;
    public var recordQueuedIconSkin:DisplayObject;
    public var recordPlayIconSkin:DisplayObject;

    private var _clip:Clip;
    //private var _idleSkin:DisplayObject;
    //private var _queuedSkin:DisplayObject;
    //private var _dequeuedSkin:DisplayObject;
    //private var _playSkin:DisplayObject;
    //private var _recordSkin:DisplayObject;
    private var _border:UIBorder;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return ClipButton.globalStyleProvider;
    }

    //
    //public function set idleSkin(value:DisplayObject):void
    //{
    //    _idleSkin = value;
    //    invalidate(INVALIDATION_FLAG_SKIN);
    //}
    //
    //public function set queuedSkin(value:DisplayObject):void
    //{
    //    _queuedSkin = value;
    //    invalidate(INVALIDATION_FLAG_SKIN);
    //}
    //
    //public function set dequeuedSkin(value:DisplayObject):void
    //{
    //    _dequeuedSkin = value;
    //    invalidate(INVALIDATION_FLAG_SKIN);
    //}
    //
    //public function set playSkin(value:DisplayObject):void
    //{
    //    _playSkin = value;
    //    invalidate(INVALIDATION_FLAG_SKIN);
    //}
    //
    //public function set recordSkin(value:DisplayObject):void
    //{
    //    _recordSkin = value;
    //    invalidate(INVALIDATION_FLAG_SKIN);
    //}

    public function get clip():Clip
    {
        return _clip;
    }

    public function set clip(value:Clip):void
    {
        if (value == _clip)
            return;
        _clip = value;
        invalidate(INVALIDATE_FLAG_CLIP);
    }

    public function ClipButton()
    {
        super();
    }

    override protected function initialize():void
    {
        super.initialize();
    }

    override protected function draw():void
    {
        super.draw();

        if (_border == null)
        {
            _border = new UIBorder();
            addChild(_border);
            if (labelTextRenderer != null)
                swapChildren(_border, DisplayObject(labelTextRenderer));
        }

        if (isInvalid(INVALIDATION_FLAG_SKIN))
        {
            refreshIcons();
        }

        if (isInvalid(INVALIDATE_FLAG_CLIP))
        {
            if (_clip != null)
            {
                isEnabled = true;
                label = clip.name;
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
            commitClipState();
        }

        var offset:int = 3;
        if (clip != null && clip.color != 0x393939)
            offset = 2;

        _border.x = offset;
        _border.y = offset;
        _border.setSize(width - (offset * 2), height - (offset * 2));
    }

    public function invalidateClipState():void
    {
        invalidate(INVALIDATION_FLAG_CLIP_STATE);
    }

    private function commitClipState():void
    {
        selectedOverlaySkin.x = 0;
        selectedOverlaySkin.y = 0;
        selectedOverlaySkin.width = actualWidth;
        selectedOverlaySkin.height = actualHeight;

        playIconSkin.x = 5;
        playIconSkin.y = 5;

        idleIconSkin.x = 5;
        idleIconSkin.y = 5;

        stopIconSkin.x = 5;
        stopIconSkin.y = 5;

        queuedIconSkin.x = 5;
        queuedIconSkin.y = 5;

        recordIdleIconSkin.x = 5;
        recordIdleIconSkin.y = 5;

        recordQueuedIconSkin.x = 5;
        recordQueuedIconSkin.y = 5;

        recordPlayIconSkin.x = 5;
        recordPlayIconSkin.y = 5;

        isEnabled = _clip != null;

        selectedOverlaySkin.visible = false;

        if (_clip != null)
        {
            var isArmed:Boolean = _clip.track.isRecArm;

            selectedOverlaySkin.visible = _clip.isSelected;
            label = clip.name;

            _border.color = clip.color;

            if (_clip.isRecording)
            {
                if (_clip.isQueued)
                {
                    playIconSkin.visible = false;
                    idleIconSkin.visible = false;
                    stopIconSkin.visible = false;
                    queuedIconSkin.visible = false;
                    recordIdleIconSkin.visible = false;
                    recordQueuedIconSkin.visible = true;
                    recordPlayIconSkin.visible = false;
                }
                else
                {
                    playIconSkin.visible = false;
                    idleIconSkin.visible = false;
                    stopIconSkin.visible = false;
                    queuedIconSkin.visible = false;
                    recordIdleIconSkin.visible = false;
                    recordQueuedIconSkin.visible = false;
                    recordPlayIconSkin.visible = true;
                }
            }
            else if (_clip.isPlaying)
            {
                if (_clip.isQueued)
                {
                    playIconSkin.visible = false;
                    idleIconSkin.visible = false;
                    stopIconSkin.visible = false;
                    queuedIconSkin.visible = true;
                    recordIdleIconSkin.visible = false;
                    recordQueuedIconSkin.visible = false;
                    recordPlayIconSkin.visible = false;
                }
                else
                {
                    playIconSkin.visible = true;
                    idleIconSkin.visible = false;
                    stopIconSkin.visible = false;
                    queuedIconSkin.visible = false;
                    recordIdleIconSkin.visible = false;
                    recordQueuedIconSkin.visible = false;
                    recordPlayIconSkin.visible = false;
                }
            }
            else if (_clip.hasContent)
            {
                playIconSkin.visible = false;
                idleIconSkin.visible = true;
                stopIconSkin.visible = false;
                queuedIconSkin.visible = false;
                recordIdleIconSkin.visible = false;
                recordQueuedIconSkin.visible = false;
                recordPlayIconSkin.visible = false;
            }
            else if (isArmed)
            {
                playIconSkin.visible = false;
                idleIconSkin.visible = false;
                stopIconSkin.visible = false;
                queuedIconSkin.visible = false;
                recordIdleIconSkin.visible = true;
                recordQueuedIconSkin.visible = false;
                recordPlayIconSkin.visible = false;
            }
            else
            {
                // no content
                playIconSkin.visible = false;
                idleIconSkin.visible = false;
                stopIconSkin.visible = true;
                queuedIconSkin.visible = false;
                recordIdleIconSkin.visible = false;
                recordQueuedIconSkin.visible = false;
                recordPlayIconSkin.visible = false;
            }

            if (!_clip.hasContent)
            {
                _border.color = 0x393939;
            }
        }
    }

    private function refreshIcons():void
    {
        selectedOverlaySkin.removeFromParent();
        playIconSkin.removeFromParent();
        idleIconSkin.removeFromParent();
        stopIconSkin.removeFromParent();
        queuedIconSkin.removeFromParent();
        recordIdleIconSkin.removeFromParent();
        recordQueuedIconSkin.removeFromParent();
        recordPlayIconSkin.removeFromParent();

        addChild(playIconSkin);
        addChild(idleIconSkin);
        addChild(stopIconSkin);
        addChild(queuedIconSkin);
        addChild(recordIdleIconSkin);
        addChild(recordQueuedIconSkin);
        addChild(recordPlayIconSkin);
        addChild(selectedOverlaySkin);

        selectedOverlaySkin.visible = false;
        playIconSkin.visible = false;
        idleIconSkin.visible = false;
        stopIconSkin.visible = true;
        queuedIconSkin.visible = false;
        recordIdleIconSkin.visible = false;
        recordQueuedIconSkin.visible = false;
        recordPlayIconSkin.visible = false;
    }
}
}
