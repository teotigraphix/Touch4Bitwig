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

package touch4bitwig.controller
{

import com.teotigraphix.controller.AbstractController;

import starling.events.Event;

import touch4bitwig.event.ApplicationModelEventType;
import touch4bitwig.event.UIModelEventType;
import touch4bitwig.model.IUIModel;
import touch4bitwig.view.MainNavigator;

public class UIController extends AbstractController
{
    [Inject]
    public var uiModel:IUIModel;

    [Inject]
    public var navigator:MainNavigator;

    public function UIController()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        addContextListener(UIModelEventType.BACK, context_backHandler);
        addContextListener(ApplicationModelEventType.FLUSH_COMPLETE, context_flushCompleteHandler);
    }

    private function context_flushCompleteHandler(event:Event):void
    {
        uiModel.refresh();
    }

    private function context_backHandler(event:Event):void
    {
        navigator.popScreen();
    }

}
}
