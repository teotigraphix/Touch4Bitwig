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
import com.teotigraphix.service.async.IStepSequence;
import com.teotigraphix.service.async.StepSequence;
import com.teotigraphix.ui.component.Toast;

import org.as3commons.async.operation.event.OperationEvent;
import org.robotlegs.starling.mvcs.Command;

import starling.core.Starling;
import starling.events.Event;

import touch4bitwig.app.config.ApplicationDebugConfiguration;
import touch4bitwig.app.config.ApplicationPreferences;
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
    public var oscMessageController:OSCMessageController;

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

        // 1. App starts, shows loading screen.
        //  - load existing ips into collection

        // 2. Try to find a confg.xml file
        // 3. Try to find saved preferences from ip form, saved last session

        // 4. if nothing, load ip config screen

        // 5. submit values and check for exception
        // 6. if exception, go back to ip screen with status note

        // ... repeat

        // 7. send connected event

        var sequence:IStepSequence = new StepSequence();

        var command1:IStepCommand = configurationService.loadIPsAsync();
        var command2:IStepCommand = configurationService.loadLastConfigurationFileAsync();
        var command3:IStepCommand = configurationService.loadApplicationPreferences();

        command1.addCompleteListener(loadIPs_completeHandler);
        command1.addErrorListener(loadIPs_errorHandler);

        command2.addCompleteListener(loadConfig_completeHandler);
        command2.addErrorListener(loadConfig_errorHandler);

        command3.addCompleteListener(appPrefs_completeHandler);
        command3.addErrorListener(appPrefs_errorHandler);

        sequence.addCommand(command1);
        sequence.addCommand(command2);
        sequence.addCommand(command3);

        sequence.addCompleteListener(this_completeHandler);

        sequence.execute();
    }

    private function appPrefs_completeHandler(event:OperationEvent):void
    {
        configurationModel.applicationPreferences = ApplicationPreferences(event.result);
    }

    private function appPrefs_errorHandler(event:OperationEvent):void
    {

    }

    private function this_completeHandler(event:OperationEvent):void
    {
        var debugConfiguration:ApplicationDebugConfiguration = configurationModel.debugConfiguration;
        // if we have a config.xml and it's enabled
        if (debugConfiguration != null && debugConfiguration.isEnabled)
        {
            configurationModel.applicationPreferences = new ApplicationPreferences();
            configurationModel.applicationPreferences.configure(configurationModel.debugConfiguration);
        }
        else
        {
            // real app usage, need serialized prefs or show config screen
            if (configurationModel.applicationPreferences != null)
            {

            }
            else
            {
                // defaults
                configurationModel.applicationPreferences = new ApplicationPreferences();
                // show screen
                uiModel.screenID = ApplicationScreens.SCREEN_CONFIGURATION;
                return;
            }
        }

        try
        {
            var bound:Boolean = configurationModel.connect();
            if (bound)
            {
                oscMessageController.start();
                Starling.juggler.delayCall(function ():void
                                           {
                                               dispatchWith(ApplicationEventType.APPLICATION_COMPLETE);
                                           }, 1);
            }
        }
        catch (e:Error)
        {

        }
    }

    private function loadIPs_completeHandler(event:OperationEvent):void
    {
        configurationModel.ipDataProvider = event.result;

        //var config:ApplicationConfiguration = configurationService.loadLastConfigurationFile();
        //if (config != null)
        //{
        //    configurationModel.configuration = config;
        //
        //    var bound:Boolean = configurationModel.connection.connect();
        //    if (bound)
        //    {
        //        oscMessageController.start();
        //        Starling.juggler.delayCall(function ():void {
        //            dispatchWith(ApplicationEventType.APPLICATION_COMPLETE);
        //        }, 1);
        //
        //        return;
        //    }
        //}
        //
        //// if the config file does not exist OR the connection is not bound (bad IP)
        //uiModel.screenID = ApplicationScreens.SCREEN_CONFIGURATION;
    }

    private function loadIPs_errorHandler(event:OperationEvent):void
    {
        Toast.show("Error in configuration.", 1);
    }

    private function loadConfig_completeHandler(event:OperationEvent):void
    {
        configurationModel.debugConfiguration = ApplicationDebugConfiguration(event.result);
    }

    private function loadConfig_errorHandler(event:OperationEvent):void
    {

    }

}
}
