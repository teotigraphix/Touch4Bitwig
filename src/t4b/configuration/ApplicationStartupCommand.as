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
package t4b.configuration
{

import com.teotigraphix.app.command.AbstractStartupCommand;
import com.teotigraphix.service.async.IStepSequence;

import t4b.controller.ApplicationController;

[ExcludeClass]
public class ApplicationStartupCommand extends AbstractStartupCommand
{
    [Inject]
    public var applicationController:ApplicationController;

    override protected function addSteps(main:IStepSequence):void
    {
        super.addSteps(main);
        main.add(FindIPsStep);
        main.add(ConfigureIPAndPortStep);
        main.add(StartupCompleteStep);
    }
}
}

import com.teotigraphix.service.async.IStepCommand;
import com.teotigraphix.service.async.StepCommand;

import feathers.data.HierarchicalCollection;

import org.as3commons.async.operation.event.OperationEvent;

import starling.events.Event;

import t4b.controller.ApplicationController;
import t4b.model.IApplicationModel;
import t4b.model.state.ConfigurationState;
import t4b.service.ConfigurationService;

final class FindIPsStep extends StepCommand
{
    [Inject]
    public var model:IApplicationModel;
    
    [Inject]
    public var configurationService:ConfigurationService;
    
    override public function execute():*
    {
        logger.log("ApplicationStartupCommand.FindIPsStep", "execute()");
        
        var command:IStepCommand = configurationService.loadIPsAsync();
        command.addCompleteListener(this_completeHandler);
        command.addErrorListener(this_errorHandler);
        command.execute();
        
        return super.execute();
    }
    
    private function this_completeHandler(event:OperationEvent):void
    {
        var collection:HierarchicalCollection = event.result as HierarchicalCollection;
        model.configuration.ipDataProvider = collection;
        complete();
    }
    
    private function this_errorHandler(event:OperationEvent):void
    {
        complete();
    }
}

final class ConfigureIPAndPortStep extends StepCommand
{
    [Inject]
    public var model:IApplicationModel;
    
    override public function execute():*
    {
        logger.log("ApplicationStartupCommand.ConfigureIPAndPortStep", "execute()");
        
        eventDispatcher.addEventListener(ApplicationController.EVENT_CONNECTED, controller_connectedEvent);
        
        var state:ConfigurationState = model.applicationSettings.configurationState;
        if (state == null)
        {
            state = new ConfigurationState();
            model.commands.editConfiguration(state);
        }
        else
        {
            model.configuration.state = state;
        }
        
        return super.execute();
    }
    
    private function controller_connectedEvent(event:Event):void
    {
        logger.log("ApplicationStartupCommand.ConfigureIPAndPortStep", "Connection complete");
        eventDispatcher.removeEventListener(ApplicationController.EVENT_CONNECTED, controller_connectedEvent);
        complete();
    }
}

final class StartupCompleteStep extends StepCommand
{
    [Inject]
    public var model:IApplicationModel;
    
    override public function execute():*
    {
        logger.log("ApplicationStartupCommand.StartupCompleteStep", "execute()");

        complete();
        return super.execute();
    }
}
