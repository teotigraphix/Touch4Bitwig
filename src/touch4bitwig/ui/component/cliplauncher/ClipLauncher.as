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

import com.teotigraphix.ui.component.UIToggleButton;

import feathers.controls.LayoutGroup;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.events.Event;

import touch4bitwig.model.state.Track;
import touch4bitwig.ui.component.main.TrackNameHeaderItem;

public class ClipLauncher extends LayoutGroup
{
    /**
     * data - index
     */
    public static const EVENT_PATTERN_PAGE_CHANGE:String = "patternPageChange";

    /**
     *
     */
    public static const EVENT_TRACK_LEFT_CHANGE:String = "trackLeftChange";

    /**
     *
     */
    public static const EVENT_TRACK_RIGHT_CHANGE:String = "trackRightChange";

    /**
     * data Scene
     */
    public static const EVENT_SCENE_TAP:String = "sceneTap";

    /**
     * data Scene
     */
    public static const EVENT_SCENE_LONG_PRESS:String = "sceneLongPress";

    /**
     * data Clip
     */
    public static const EVENT_CLIP_TAP:String = "clipTap";

    public static const EVENT_AUTOMATION_CHANGE:String = "automationChange";
    public static const EVENT_OVERDUB_CHANGE:String = "overdubChange";

    private var _clipLauncherGrid:ClipLauncherGrid;
    private var _sceneList:SceneList;
    private var _headerItems:Vector.<TrackNameHeaderItem> = new <TrackNameHeaderItem>[];
    private var _automationButton:UIToggleButton;
    private var _overdubButton:UIToggleButton;

    public function get clipLauncherGrid():ClipLauncherGrid
    {
        return _clipLauncherGrid;
    }

    public function get sceneList():SceneList
    {
        return _sceneList;
    }

    public function ClipLauncher()
    {
        super();
    }

    override protected function initialize():void
    {
        layout = new AnchorLayout();

        super.initialize();

        var mainContent:LayoutGroup = new LayoutGroup();
        mainContent.layout = new VerticalLayout();
        mainContent.layoutData = new AnchorLayoutData(NaN, NaN, NaN, NaN, 0, 0);

        createHeader(mainContent);
        createContent(mainContent);
        createFooter(mainContent);

        addChild(mainContent);
    }

    override protected function draw():void
    {
        super.draw();
    }

    public function updateTrack(track:Track):void
    {
        var item:TrackNameHeaderItem = _headerItems[track.index - 1];
        item.visible = track.name != "";
        item.trackColor = track.color;
        item.trackName = track.name;
        item.selected = track.isSelected;
    }

    public function setLauncherAutowrite(value:Boolean):void
    {
        _automationButton.setIsSelected(value);
    }

    public function setLauncherOverdub(value:Boolean):void
    {
        _overdubButton.setIsSelected(value);
    }

    private function createHeader(parent:LayoutGroup):void
    {
        var header:LayoutGroup = new LayoutGroup();
        var hl:HorizontalLayout = new HorizontalLayout();
        hl.gap = 2;
        hl.paddingLeft = 2;
        header.layout = hl;
        header.height = 50;
        header.layoutData = new VerticalLayoutData(100, NaN);

        for (var i:int = 0; i < 8; i++)
        {
            var item:TrackNameHeaderItem = new TrackNameHeaderItem();
            item.index = i;
            item.width = 100;
            item.height = 50;
            header.addChild(item);
            _headerItems.push(item);
        }

        _automationButton = new UIToggleButton();
        _automationButton.styleNameList.add("automation-button");
        _automationButton.width = 50;
        _automationButton.height = 50;
        _automationButton.addEventListener(Event.CHANGE, automation_changedHandler);
        header.addChild(_automationButton);

        _overdubButton = new UIToggleButton();
        _overdubButton.styleNameList.add("overdub-button");
        _overdubButton.addEventListener(Event.CHANGE, overdub_changedHandler);
        header.addChild(_overdubButton);

        parent.addChild(header);

    }

    private function createContent(parent:LayoutGroup):void
    {
        var content:LayoutGroup = new LayoutGroup();
        content.layout = new HorizontalLayout();

        parent.addChild(content);

        _clipLauncherGrid = new ClipLauncherGrid();
        content.addChild(_clipLauncherGrid);

        _sceneList = new SceneList();
        _sceneList.width = 100;
        _sceneList.layoutData = new HorizontalLayoutData(NaN, 100);
        content.addChild(_sceneList);

    }

    private function createFooter(parent:LayoutGroup):void
    {
        var footer:ClipLauncherFooter = new ClipLauncherFooter();
        footer.height = 30;
        footer.layoutData = new VerticalLayoutData(100, NaN);
        parent.addChild(footer);

    }

    private function automation_changedHandler(event:Event):void
    {
        dispatchEventWith(EVENT_AUTOMATION_CHANGE, true);

    }

    private function overdub_changedHandler(event:Event):void
    {
        dispatchEventWith(EVENT_OVERDUB_CHANGE, true);
    }
}
}
