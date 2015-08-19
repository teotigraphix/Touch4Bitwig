/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.ui.component.track.channel
{

import com.teotigraphix.ui.component.UISlider;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.LayoutGroup;
import feathers.controls.ProgressBar;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.skins.IStyleProvider;

import starling.events.Event;

public class TrackVolumeGroup extends LayoutGroup
{
    public static const EVENT_VOLUME_CHANGE:String = "volumeChange";

    private const INVALIDATE_FLAG_VOLUME:String = "volume";
    private const INVALIDATE_FLAG_VU:String = "vu";

    public static var globalStyleProvider:IStyleProvider;

    private var _vuBar:ProgressBar;
    private var _volumeSlider:UISlider;

    private var _index:int = -1;
    private var _volume:Number;
    private var _volumeString:String = " ";
    private var _vu:int;

    override protected function get defaultStyleProvider():IStyleProvider
    {
        return TrackVolumeGroup.globalStyleProvider;
    }

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get volume():Number
    {
        return _volume;
    }

    public function set volume(value:Number):void
    {
        if (_volume == value)
            return;
        _volume = value;
        invalidate(INVALIDATE_FLAG_VOLUME);
    }

    public function get volumeString():String
    {
        return _volumeString;
    }

    public function set volumeString(value:String):void
    {
        if (_volumeString == value)
            return;
        _volumeString = value;
        invalidate(INVALIDATE_FLAG_VOLUME);
    }

    public function get vu():int
    {
        return _vu;
    }

    public function set vu(value:int):void
    {
        if (_vu == value)
            return;
        _vu = value;
        invalidate(INVALIDATE_FLAG_VU);
    }

    public function TrackVolumeGroup()
    {
    }

    override protected function initialize():void
    {
        var l:HorizontalLayout = new HorizontalLayout();
        layout = l;

        super.initialize();

        _vuBar = new ProgressBar();
        _vuBar.layoutData = new HorizontalLayoutData(NaN, 100);
        _vuBar.styleNameList.add("track-strip-vu-bar");

        _volumeSlider = new UISlider();
        _volumeSlider.layoutData = new HorizontalLayoutData(100, 100);
        _volumeSlider.styleNameList.add("track-strip-volume-slider");
        _volumeSlider.addEventListener(Event.CHANGE, volumeSlider_changeHandler);

        addChild(_vuBar);
        addChild(_volumeSlider);
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATE_FLAG_VU))
        {
            _vuBar.value = _vu;
        }

        if (isInvalid(INVALIDATE_FLAG_VOLUME))
        {
            _volumeSlider.setValue(_volume);
        }
    }

    private function volumeSlider_changeHandler(event:Event):void
    {
        _volume = _volumeSlider.value;
        dispatchEventWith(EVENT_VOLUME_CHANGE, true, _index);
    }
}
}