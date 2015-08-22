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

package touch4bitwig.controller.command
{

import com.teotigraphix.service.async.IStepCommand;
import com.teotigraphix.ui.component.Toast;

import org.as3commons.async.operation.event.OperationEvent;
import org.robotlegs.starling.mvcs.Command;

import starling.events.Event;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.controller.*;
import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.IUIModel;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.IOSCService;
import touch4bitwig.view.ApplicationScreens;

public class ApplicationStartupCommand extends Command
{
    [Inject]
    public var applicationController:ApplicationController;

    [Inject]
    public var event:Event;

    [Inject]
    public var configurationModel:IConfigurationModel;

    [Inject]
    public var configurationService:IConfigurationService;

    [Inject]
    public var oscModel:IOSCModel;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var uiModel:IUIModel;

    override public function execute():void
    {
        trace("StartupCommand.execute()");

        var command:IStepCommand = configurationService.loadIPsAsync();
        command.addCompleteListener(loadIPsCompleteHandler);
        command.addErrorListener(loadIPsErrorHandler);
        command.execute();
    }

    private function loadIPsCompleteHandler(event:OperationEvent):void
    {
        configurationModel.ipDataProvider = event.result;

        var config:ApplicationConfiguration = configurationService.loadLastConfigurationFile();
        if (config != null)
        {
            configurationModel.configuration = config;

            var bound:Boolean = configurationModel.connection.connect();
            if (bound)
            {
                oscService.start(oscModel);
                oscService.refresh();
                dispatchWith(ApplicationEventType.APPLICATION_COMPLETE);
                return;
            }
        }

        // if the config file does not exist OR the connection is not bound (bad IP)
        uiModel.screenID = ApplicationScreens.SCREEN_CONFIGURATION;
    }

    private function loadIPsErrorHandler(event:OperationEvent):void
    {
        Toast.show("Error in configuration.", 1);
    }
}
}
