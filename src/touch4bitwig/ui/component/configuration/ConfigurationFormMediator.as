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

import touch4bitwig.model.IConfigurationModel;

public class ConfigurationFormMediator extends AbstractMediator
{
    [Inject]
    public var view:ConfigurationForm;

    [Inject]
    public var configurationModel:IConfigurationModel;

    public function ConfigurationFormMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        view.serverIP = configurationModel.configuration.serverIP;
        view.serverPort = configurationModel.configuration.serverPort.toString();
        view.clientIP = configurationModel.configuration.clientIP;
        view.clientPort = configurationModel.configuration.clientPort.toString();
    }

    override public function onRemove():void
    {
        super.onRemove();
    }
}
}