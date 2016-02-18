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
package t4b.model.impl
{

import com.teotigraphix.model.core.AbstractApplicationModel;

import t4b.configuration.ApplicationSettings;
import t4b.controller.CommandLauncher;
import t4b.controller.ScreenLauncher;
import t4b.controller.UIController;
import t4b.model.ConfigurationModel;
import t4b.model.IApplicationModel;

public class ApplicationModelImpl extends AbstractApplicationModel implements IApplicationModel
{
    [Inject]
    public var _configuration:ConfigurationModel;
    
    /**
     * @inheritDoc
     */
    public function get applicationSettings():ApplicationSettings
    {
        return _applicationSettings as ApplicationSettings;
    }

    /**
     * @inheritDoc
     */
    public function get screens():ScreenLauncher
    {
        return _screens as ScreenLauncher;
    }

    /**
     * @inheritDoc
     */
    public function get commands():CommandLauncher
    {
        return _commands as CommandLauncher;
    }

    /**
     * @inheritDoc
     */
    public function get ui():UIController
    {
        return _ui as UIController;
    }
    
    /**
     * @inheritDoc
     */
    public function get configuration():ConfigurationModel
    {
        return _configuration;
    }
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    
    public function ApplicationModelImpl()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();
    }
}
}
