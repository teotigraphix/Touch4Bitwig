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

package touch4bitwig.ui.component.main
{

import starling.events.Event;

import touch4bitwig.model.event.BitwigApplicationEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class MainHeaderMediator extends AbstractUIMediator
{
    [Inject]
    public var view:MainHeader;

    public function MainHeaderMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addContextListener(BitwigApplicationEventType.ACTIVE_CHANGE, context_activeEngineChange);

        addViewListener(MainHeader.EVENT_ACTIVE_ENGINE_CHANGE, view_activeEngineChange);
        addViewListener(MainHeader.EVENT_SCREEN_CHANGE, view_screenChange);

        view.setActiveEngine(oscModel.application.active);
        view.setScreenDataProvider(uiModel.screenDataProvider);
        view.setScreenIndex(uiModel.screenIndex);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function context_activeEngineChange(event:Event, data:Object):void
    {
        view.setActiveEngine(data.value);
    }

    private function view_screenChange(event:Event, item:Object):void
    {
        item.action();
    }

    private function view_activeEngineChange(event:Event):void
    {
        oscService.send("/active");
    }
}
}
