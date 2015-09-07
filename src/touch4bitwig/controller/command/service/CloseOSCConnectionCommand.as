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

package touch4bitwig.controller.command.service
{

import com.teotigraphix.ui.component.Toast;

import feathers.controls.Alert;
import feathers.core.PopUpManager;

import org.robotlegs.starling.mvcs.Command;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.event.ServiceCommandType;
import touch4bitwig.service.IOSCService;

public class CloseOSCConnectionCommand extends Command
{
    [Inject]
    public var event:Event;

    [Inject]
    public var oscService:IOSCService;

    private var _alert:Alert;

    override public function execute():void
    {
        // we clean up our own mess
        eventDispatcher.addEventListener(ServiceCommandType.CLOSE_OSC_CONNECTION_COMPLETE,
                                         this_closeOSCConnectionComplete);

        _alert = Alert.show("Closing connection...", "OSC Action", null, null, true, true);

        Starling.juggler.delayCall(doClose, 0.5);
    }

    private function doClose():void
    {
        // needs to be delayed because the call instantly freezes all UI until it returns
        // onComplete ServiceCommandType.CLOSE_OSC_CONNECTION_COMPLETE
        oscService.close();
    }

    private function this_closeOSCConnectionComplete(event:Event):void
    {
        eventDispatcher.removeEventListener(ServiceCommandType.CLOSE_OSC_CONNECTION_COMPLETE,
                                            this_closeOSCConnectionComplete);

        PopUpManager.removePopUp(_alert, true);

        Toast.show("Connection closed", 3000);
    }
}
}
