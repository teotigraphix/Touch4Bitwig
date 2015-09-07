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

import flash.filesystem.File;

import org.robotlegs.starling.mvcs.Command;

import starling.events.Event;
import starling.events.EventDispatcher;

import touch4bitwig.controller.OSCMessageController;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.model.event.ConfigurationModelEventType;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.view.ApplicationScreens;

public class ConnectAndStartOSCService extends Command
{
    [Inject]
    public var event:Event;

    [Inject]
    public var context:EventDispatcher;

    [Inject]
    public var oscMessageController:OSCMessageController;

    [Inject]
    public var uiModel:IUIModel;

    [Inject]
    public var configurationModel:IConfigurationModel;

    [Inject]
    public var configurationService:IConfigurationService;

    override public function execute():void
    {
        var data:Object = event.data;

        var bound:Boolean = oscMessageController.reconnectAndStartup(
                data.dawIP, parseInt(data.dawPort),
                data.deviceIP, parseInt(data.devicePort));

        if (!bound)
        {
            // dispatch error
            Toast.show("Error in port/ip configuration, please enter correct values to connect.", 3000);
        }
        else
        {
            var file:File = configurationService.saveApplicationPreferences().commit();
            Toast.show("Connected to Bitwig", 3000);

            dispatchWith(ConfigurationModelEventType.START_COMPLETE);
        }
    }
}
}
