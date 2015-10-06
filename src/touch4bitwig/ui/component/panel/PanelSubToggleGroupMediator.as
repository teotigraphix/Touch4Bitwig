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

package touch4bitwig.ui.component.panel
{

import com.teotigraphix.ui.component.UIToggleButton;

import feathers.controls.Button;

import starling.events.Event;

import touch4bitwig.model.event.BitwigApplicationEventType;
import touch4bitwig.model.event.BitwigPanelEventType;
import touch4bitwig.model.state.BitwigApplication;
import touch4bitwig.ui.AbstractUIMediator;

public class PanelSubToggleGroupMediator extends AbstractUIMediator
{
    [Inject]
    public var view:PanelSubToggleGroup;

    public function PanelSubToggleGroupMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(BitwigApplicationEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);

        addContextListener(BitwigPanelEventType.ARRANGER_CLIP_LAUNCHER_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_CUE_MARKER_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_EFFECTS_TRACKS_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_IO_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_PLAYBACK_FOLLOW_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_TIME_LINE_VISIBLE_CHANGE, context_arrangerChangeHandler);
        addContextListener(BitwigPanelEventType.ARRANGER_TRACK_ROW_HEIGHT_VISIBLE_CHANGE, context_arrangerChangeHandler);

        addContextListener(BitwigPanelEventType.MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(BitwigPanelEventType.MIXER_CROSS_FADE_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(BitwigPanelEventType.MIXER_DEVICE_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(BitwigPanelEventType.MIXER_IO_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(BitwigPanelEventType.MIXER_METER_VISIBLE_CHANGE, context_mixerChangeHandler);
        addContextListener(BitwigPanelEventType.MIXER_SENDS_VISIBLE_CHANGE, context_mixerChangeHandler);

        // XXX addViewListener(Event.CHANGE, view_changeHandler);
        // Arrange; ClipLauncher, Timeline, IO, , EffectTracks, TrackHeight, ActivateTracks
        // Mix;     ClipLauncher, Meters, DeviceChain, Sends, IO, EffectTracks, ActivateTracks, Crossfade
        // Edit;    N/A

        view.buttonFactory = buttonFactory;

        context_panelLayoutChange(null, {value: oscModel.application.layout});
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_mixerChangeHandler(event:Event, data:Object):void
    {
        if (oscModel.application.layout != BitwigApplication.LAYOUT_MIX)
            return;

        var item:Object = getMixerItem(event.type);
        if (item == null)
            return;

        trace("context_mixerChangeHandler() " + event.type + ' : ' + data.value);
        item.isSelected = data.value;
        //view.dataProvider.updateItemAt(_mixDataProvider.getItemIndex(item));
        view.dataProvider = null;
        view.dataProvider = uiModel.panelsMixDataProvider;
    }

    private function context_arrangerChangeHandler(event:Event, data:Object):void
    {
        if (oscModel.application.layout != BitwigApplication.LAYOUT_ARRANGE)
            return;

        var item:Object = getArrangerItem(event.type);
        if (item == null)
            return;

        trace("context_arrangerChangeHandler() " + event.type + ' : ' + data.value);
        item.isSelected = data.value;
        //view.dataProvider.updateItemAt(_arrangeDataProvider.getItemIndex(item));
        view.dataProvider = null;
        view.dataProvider = uiModel.panelsArrangeDataProvider;
    }

    private function getMixerItem(type:String):Object
    {
        for (var i:int = 0; i < uiModel.panelsMixDataProvider.length; i++)
        {
            var item:Object = uiModel.panelsMixDataProvider.getItemAt(i);
            if (item.type == type)
                return item;
        }
        return null;
    }

    private function getArrangerItem(type:String):Object
    {
        for (var i:int = 0; i < uiModel.panelsArrangeDataProvider.length; i++)
        {
            var item:Object = uiModel.panelsArrangeDataProvider.getItemAt(i);
            if (item.type == type)
                return item;
        }
        return null;
    }//#D36E0E, gray #DADADA

    private function buttonFactory():UIToggleButton
    {
        var button:UIToggleButton = new UIToggleButton();
        button.iconPosition = Button.ICON_POSITION_TOP;
        button.styleNameList.add("panels-button");
        return button;
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        switch (data.value)
        {
            case BitwigApplication.LAYOUT_ARRANGE :
                view.dataProvider = null;
                view.dataProvider = uiModel.panelsArrangeDataProvider;
                break;

            case BitwigApplication.LAYOUT_MIX :
                view.dataProvider = null;
                view.dataProvider = uiModel.panelsMixDataProvider;
                break;

            case BitwigApplication.LAYOUT_EDIT :
                view.dataProvider = null;//_editDataProvider;
                break;
        }
    }
}
}
