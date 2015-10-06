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

package touch4bitwig.view.screen
{

import starling.events.Event;

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.view.screen.DeviceScreen;
import touch4bitwig.view.AbstractMediator;

public class DeviceScreenMediator extends AbstractMediator
{

    private var view:DeviceScreen;

    public function DeviceScreenMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
        addContextListener(BitwigDeviceEventType.MODE_CHANGE, context_modeChangeHandler);
        addViewListener(DeviceScreen.EVENT_DEVICE_BANK_SELECTOR_CHANGE, ssdsd);

    }

    override public function onRegister():void
    {
        super.onRegister();

    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = DeviceScreen(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function ssdsd(event:Event, mode:String):void
    {
        oscModel.deviceMode = mode;
    }

    private function context_modeChangeHandler(event:Event, mode:String):void
    {
        oscService.sendInt("/device/indicate/param", 0);
        oscService.sendInt("/device/indicate/common", 0);
        oscService.sendInt("/device/indicate/envelope", 0);
        oscService.sendInt("/device/indicate/macro", 0);
        oscService.sendInt("/device/indicate/modulation", 0);

        oscService.sendInt("/device/indicate/" + mode, 1);

        if (mode != "param")
        {

        }
        // /device/param/+
    }

}
}
