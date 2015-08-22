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

package touch4bitwig.ui.component.frame
{

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.data.ListCollection;

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.model.state.Application;
import touch4bitwig.ui.AbstractUIMediator;

public class PanelLayoutGroupMediator extends AbstractUIMediator
{
    private var view:PanelLayoutGroup;

    public function PanelLayoutGroupMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
        addContextListener(ApplicationModelEventType.PANEL_LAYOUT_CHANGE, context_panelLayoutChange);
        addViewListener(PanelLayoutGroup.EVENT_LAYOUT_CHANGE, view_layoutChangeHandler);
    }

    override public function onRegister():void
    {
        super.onRegister();

        view.dataProvider = new ListCollection([
            {label: "ARRANGE"},
            {label: "MIX"},
            {label: "EDIT"}
        ]);
        view.minHeight = AssetMap.getSize(150);
        view.selectedIndex = getIndex(oscModel.application.layout);
        view.tabFactory = tabFactory;
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = PanelLayoutGroup(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function tabFactory():UIToggleButton
    {
        var button:UIToggleButton = new UIToggleButton();
        button.styleNameList.add("panels-layout-button");
        return button;
    }

    private function context_panelLayoutChange(event:Event, data:Object):void
    {
        view.selectedIndex = getIndex(data.value);
    }

    private function getIndex(layout:String):int
    {
        switch (layout)
        {
            case Application.LAYOUT_ARRANGE :
                return 0;

            case Application.LAYOUT_MIX :
                return 1;

            case Application.LAYOUT_EDIT :
                return 2;
        }
        return -1;
    }

    private function view_layoutChangeHandler(event:Event, layout:String):void
    {
        oscService.send("/layout/" + layout);
    }
}
}
