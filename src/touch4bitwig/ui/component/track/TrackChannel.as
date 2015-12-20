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

import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.LayoutGroup;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import touch4bitwig.ui.component.track.channel.DeviceParamGroup;
import touch4bitwig.ui.component.track.channel.TrackControlGroup;
import touch4bitwig.ui.component.track.channel.TrackVolumeGroup;

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
        l.padding = AssetMap.size(8);
        l.gap = AssetMap.size(4);
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
