////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.view.ui.transport._mediators
{

import starling.events.Event;

import t4b.view.core.AbstractMediator;
import t4b.view.ui.transport.TransportPopUp;

public class TransportPopUpMediator extends AbstractMediator
{
    [Inject]
    public var view:TransportPopUp;

    public function TransportPopUpMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(TransportPopUp.EVENT_AUTOMATION_WRITE_MODE_CHANGE, view_automationWriteModeChangeHandler);

        view.autowriteIndex = model.osc.transport.automationWriteModeIndex;
    }

    private function view_automationWriteModeChangeHandler(event:Event, index:int):void
    {
        if (index == -1)
            return;
        //oscService.send("/automationWriteMode/" + model.osc.getAutomationWriteModeValue(index));
        //model.osc.transport.automationWriteMode = 
    }
}
}
