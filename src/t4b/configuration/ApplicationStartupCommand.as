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
        main.add(StartupCompleteStep);
    }
}
}

import com.teotigraphix.service.async.StepCommand;

import t4b.model.IApplicationModel;

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
