/**
 * Created by Teoti on 3/10/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.Button;
import feathers.skins.IStyleProvider;

import starling.display.DisplayObject;
import starling.events.Event;

import touch4bitwig.model.state.Scene;

public class SceneButton extends Button
{
    public static const INVALIDATE_FLAG_SCENE:String = "scene";

    public static const INVALIDATION_FLAG_CLIP_STATE:String = "clipState";

    public static var globalStyleProvider:IStyleProvider;

    private var _scene:Scene;
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

    public function get scene():Scene
    {
        return _scene;
    }

    public function set scene(value:Scene):void
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
