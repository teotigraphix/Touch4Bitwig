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

import com.teotigraphix.ui.theme.AssetMap;

import starling.events.Event;

import touch4bitwig.model.event.BitwigApplicationEventType;
import touch4bitwig.model.state.BitwigApplication;
import touch4bitwig.ui.AbstractUIMediator;

public class PanelLayoutGroupMediator extends AbstractUIMediator
{
    [Inject]
    public var view:PanelLayoutGroup;

    public function PanelLayoutGroupMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        view.dataProvider = uiModel.panelsLayoutDataProvider;

        // TODO put in theme
        view.minHeight = AssetMap.getSize(150);

        view.selectedIndex = getIndex(oscModel.application.layout);

        addContextListener(BitwigApplicationEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);

        addViewListener(PanelLayoutGroup.EVENT_LAYOUT_CHANGE, view_layoutChangeHandler);
        addViewListener(PanelLayoutGroup.EVENT_INSPECTOR_TRIGGERED, view_inspectorTriggeredHandler);
        addViewListener(PanelLayoutGroup.EVENT_BROWSER_TRIGGERED, view_browserTriggeredHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        view.selectedIndex = getIndex(data.value);
    }

    private function view_layoutChangeHandler(event:Event, layout:String):void
    {
       oscModel.application.setActiveLayout(layout);
    }

    // TODO either make this util or some type of getter with map on model
    private static function getIndex(layout:String):int
    {
        switch (layout)
        {
            case BitwigApplication.LAYOUT_ARRANGE :
                return 0;

            case BitwigApplication.LAYOUT_MIX :
                return 1;

            case BitwigApplication.LAYOUT_EDIT :
                return 2;
        }
        return -1;
    }

    private function view_inspectorTriggeredHandler(event:Event):void
    {
        oscModel.application.toggleInspector();
    }

    private function view_browserTriggeredHandler(event:Event):void
    {
        oscModel.application.toggleBrowser();
    }
}
}
