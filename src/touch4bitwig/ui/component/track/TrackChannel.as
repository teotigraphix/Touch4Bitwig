/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.ui.component.track
{

import com.teotigraphix.bitwig.ui.component.track.channel.DeviceParamGroup;
import com.teotigraphix.bitwig.ui.component.track.channel.TrackControlGroup;
import com.teotigraphix.bitwig.ui.component.track.channel.TrackVolumeGroup;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

public class TrackChannel extends LayoutGroup
{
    private var _deviceParamGroup:DeviceParamGroup;
    private var _trackControlGroup:TrackControlGroup;
    private var _trackVolumeGroup:TrackVolumeGroup;

    private var _index:int = -1;

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get deviceParamGroup():DeviceParamGroup
    {
        return _deviceParamGroup;
    }

    public function get trackControlGroup():TrackControlGroup
    {
        return _trackControlGroup;
    }

    public function get trackVolumeGroup():TrackVolumeGroup
    {
        return _trackVolumeGroup;
    }

    public function TrackChannel()
    {
    }

    override protected function initialize():void
    {
        var l:VerticalLayout = new VerticalLayout();
        l.padding = AssetMap.getSize(8);
        l.gap = AssetMap.getSize(4);
        layout = l;
        super.initialize();

        _deviceParamGroup = new DeviceParamGroup();
        _deviceParamGroup.layoutData = new VerticalLayoutData(100);
        _deviceParamGroup.index = _index;
        addChild(_deviceParamGroup);

        _trackVolumeGroup = new TrackVolumeGroup();
        _trackVolumeGroup.layoutData = new VerticalLayoutData(100, 100);
        _trackVolumeGroup.index = _index;
        addChild(_trackVolumeGroup);

        _trackControlGroup = new TrackControlGroup();
        _trackControlGroup.layoutData = new VerticalLayoutData(100);
        _trackControlGroup.index = _index;
        addChild(_trackControlGroup);
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
