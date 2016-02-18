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
package t4b.controller
{

import com.teotigraphix.controller.core.AbstractApplicationController;
import com.teotigraphix.ui.IUIController;

import starling.events.Event;

import t4b.model.IApplicationModel;
import t4b.model.event.ConfigurationModelEventType;
import t4b.service.OSCService;

public class ApplicationController extends AbstractApplicationController
{
    public static const EVENT_CONNECTED:String = "ApplicationController/connected";
    
    [Inject]
    public var model:IApplicationModel;
    
    [Inject]
    public var uiController:IUIController;
    
    [Inject]
    public var oscService:OSCService;
    
    public function ApplicationController()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        addContextListener("showLoadingScreen", context_showLoadingScreenHandler);
        addContextListener(ConfigurationModelEventType.CONFIGURATION_STATE_CHANGED, 
            context_configurationStateChangedHandler);
        
        addListener(model);
        addListener(uiController);
    }
    
    private function context_configurationStateChangedHandler(event:Event):void
    {
        var connected:Boolean = oscService.connect(model.configuration.state);
        if (!connected)
        {
            model.commands.editConfiguration(model.configuration.state);
        }
        else
        {
            dispatchWith(EVENT_CONNECTED);
        }
    }
    
    private function context_showLoadingScreenHandler(event:Event):void
    {
        trace("ApplicationController.context_showLoadingScreenHandler()");
        model.screens.goToLoad();
    }
}
}
