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

package touch4bitwig.ui.component.device
{

import starling.events.Event;

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.ui.AbstractUIMediator;

public class DeviceNavigationControlMediator extends AbstractUIMediator
{
    private var view:DeviceNavigationControl;

    public function DeviceNavigationControlMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();

        addContextListener(DeviceModelEventType.CAN_SELECT_PREVIOUS, context_canSelectPreviousChange);
        addContextListener(DeviceModelEventType.CAN_SELECT_NEXT, context_canSelectNextChange);
        addContextListener(DeviceModelEventType.NAME_CHANGE, context_nameChange);

        addViewListener(DeviceNavigationControl.EVENT_LEFT_TRIGGERED, view_leftTriggered);
        addViewListener(DeviceNavigationControl.EVENT_RIGHT_TRIGGERED, view_rightTriggered);

        view.isEnabled = oscModel.device.exists;
        view.canSelectPrevious = oscModel.cursorDevice.canSelectPrevious;
        view.canSelectNext = oscModel.cursorDevice.canSelectNext;
        view.deviceName = oscModel.cursorDevice.name;
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceNavigationControl(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
    }

    private function context_nameChange(event:Event, data:Object):void
    {
        view.deviceName = data.value;
    }

    private function context_canSelectPreviousChange(event:Event, data:Object):void
    {
        view.canSelectPrevious = data.value;
    }

    private function context_canSelectNextChange(event:Event, data:Object):void
    {
        view.canSelectNext = data.value;
    }

    private function view_leftTriggered(event:Event):void
    {
        oscModel.device.previous();
    }

    private function view_rightTriggered(event:Event):void
    {
        oscModel.device.next();
    }
}
}
