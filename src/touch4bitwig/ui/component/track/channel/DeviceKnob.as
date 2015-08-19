/**
 * Created by Teoti on 4/13/2015.
 */
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
