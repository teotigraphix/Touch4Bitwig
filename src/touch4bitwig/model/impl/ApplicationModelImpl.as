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
package touch4bitwig.model.impl
{

import com.teotigraphix.app.config.ApplicationDescriptor;
import com.teotigraphix.controller.ICommandLauncher;
import com.teotigraphix.model.AbstractModel;
import com.teotigraphix.model.IDeviceModel;
import com.teotigraphix.ui.screen.IScreenLauncher;

import touch4bitwig.controller.CommandLauncher;
import touch4bitwig.controller.ScreenLauncher;
import touch4bitwig.model.IApplicationModel;
import touch4bitwig.model.IOSCModel;

public class ApplicationModelImpl extends AbstractModel implements IApplicationModel
{
    [Inject]
    public var _descriptor:ApplicationDescriptor;

    [Inject]
    public var _deviceModel:IDeviceModel;

    [Inject]
    public var _commands:ICommandLauncher;

    [Inject]
    public var _screens:IScreenLauncher;

    [Inject]
    public var _osc:IOSCModel;

    //----------------------------------
    // descriptor
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get descriptor():ApplicationDescriptor
    {
        return ApplicationDescriptor(_descriptor);
    }

    //----------------------------------
    // commands
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get commands():CommandLauncher
    {
        return CommandLauncher(_commands);
    }

    //----------------------------------
    // deviceModel
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get deviceModel():IDeviceModel
    {
        return IDeviceModel(_deviceModel);
    }

    //----------------------------------
    // screens
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get screens():ScreenLauncher
    {
        return ScreenLauncher(_screens);
    }

    //----------------------------------
    // osc
    //----------------------------------

    /**
     * @inheritDoc
     */
    public function get osc():IOSCModel
    {
        return _osc;
    }

    public function ApplicationModelImpl()
    {
        super();
    }
}
}
