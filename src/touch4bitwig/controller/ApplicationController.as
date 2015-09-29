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

package touch4bitwig.controller
{

import com.teotigraphix.controller.AbstractController;

import starling.events.Event;

import touch4bitwig.event.ApplicationEventType;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.service.IOSCService;

/**
 * Mediates application level context events.
 */
public class ApplicationController extends AbstractController
{
    //--------------------------------------------------------------------------
    // Constants
    //--------------------------------------------------------------------------

    private static const TAG:String = "ApplicationController";

    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    [Inject]
    public var configurationModel:IConfigurationModel;

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var uiController:UIController;

    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function ApplicationController()
    {
    }

    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------

    override protected function onRegister():void
    {
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_COMPLETE, applicationCompleteHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_ACTIVATE, applicationActivateHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_DEACTIVATE, applicationDeactivateHandler);
        eventDispatcher.addEventListener(ApplicationEventType.APPLICATION_EXIT, applicationExitHandler);
    }

    //--------------------------------------------------------------------------
    // Private :: Handlers
    //--------------------------------------------------------------------------

    private function applicationCompleteHandler(event:Event):void
    {
        logger.log(TAG, "applicationCompleteHandler()");
    }

    private function applicationActivateHandler(event:Event):void
    {

    }

    private function applicationDeactivateHandler(event:Event):void
    {

    }

    private function applicationExitHandler(event:Event):void
    {
        oscService.close();
    }
}
}
