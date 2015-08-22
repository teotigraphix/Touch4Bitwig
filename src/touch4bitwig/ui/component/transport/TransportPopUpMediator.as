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

package touch4bitwig.ui.component.transport
{

import starling.events.Event;

import touch4bitwig.ui.AbstractUIMediator;

public class TransportPopUpMediator extends AbstractUIMediator
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

        view.autowriteIndex = oscModel.transport.automationWriteModeIndex;
    }

    private function view_automationWriteModeChangeHandler(event:Event, index:int):void
    {
        if (index == -1)
            return;
        oscService.send("/automationWriteMode/" + oscModel.getAutomationWriteModeValue(index));
    }
}
}
