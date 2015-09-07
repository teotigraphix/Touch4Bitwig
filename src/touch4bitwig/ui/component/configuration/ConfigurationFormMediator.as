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

package touch4bitwig.ui.component.configuration
{

import com.teotigraphix.ui.mediator.AbstractMediator;

import starling.events.Event;

import touch4bitwig.controller.OSCMessageController;
import touch4bitwig.event.ServiceCommandType;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.IUIModel;

public class ConfigurationFormMediator extends AbstractMediator
{
    [Inject]
    public var view:ConfigurationForm;

    [Inject]
    public var configurationModel:IConfigurationModel;

    [Inject]
    public var oscMessageController:OSCMessageController;

    [Inject]
    public var uiModel:IUIModel;

    public function ConfigurationFormMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        resetToPreferences();

        addViewListener(ConfigurationForm.EVENT_APPLY, view_applyHandler);
        addViewListener(ConfigurationForm.EVENT_RESET, view_resetHandler);
        addViewListener(ConfigurationForm.EVENT_CLOSE, view_closeHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function resetToPreferences():void
    {
        view.dawIP = configurationModel.applicationPreferences.dawIP;
        view.dawPort = configurationModel.applicationPreferences.dawPort.toString();
        view.deviceIP = configurationModel.applicationPreferences.deviceIP;
        view.devicePort = configurationModel.applicationPreferences.devicePort.toString();
    }

    private function view_applyHandler(event:Event):void
    {
        var data:Object = {
            dawIP: view.dawIP,
            dawPort: view.dawPort,
            deviceIP: view.deviceIP,
            devicePort: view.devicePort
        };
        dispatchWith(ServiceCommandType.CONNECT_AND_START, false, data);
    }

    private function view_resetHandler(event:Event):void
    {
        resetToPreferences();
    }

    private function view_closeHandler(event:Event):void
    {
        oscMessageController.close();
    }
}
}
