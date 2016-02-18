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
package t4b.model
{

import com.teotigraphix.model.AbstractModel;
import com.teotigraphix.model.IApplicationSettings;

import feathers.data.HierarchicalCollection;

import t4b.configuration.ApplicationSettings;
import t4b.model.event.ConfigurationModelEventType;
import t4b.model.state.ConfigurationState;

public class ConfigurationModel extends AbstractModel
{
    [Inject]
    public var applicationSettings:IApplicationSettings;
    
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _ipDataProvider:HierarchicalCollection;
    private var _state:ConfigurationState;

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // ipDataProvider
    //----------------------------------
    
    public function get ipDataProvider():HierarchicalCollection
    {
        return _ipDataProvider;
    }

    public function set ipDataProvider(value:HierarchicalCollection):void
    {
        if (_ipDataProvider == value)
            return;
        _ipDataProvider = value;
        dispatchWith(ConfigurationModelEventType.IP_DATA_PROVIDER_CHANGED, false, _ipDataProvider);
    }
    
    //----------------------------------
    // configurationState
    //----------------------------------
    
    public function get state():ConfigurationState
    {
        return _state;
    }
    
    public function set state(value:ConfigurationState):void
    {
        _state = value;
        ApplicationSettings(applicationSettings).configurationState = _state;
        dispatchWith(ConfigurationModelEventType.CONFIGURATION_STATE_CHANGED, false, _state);
    }
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function ConfigurationModel()
    {
    }

    /**
     * @inheritDoc
     */
    override protected function onRegister():void
    {
        super.onRegister();
    }
}
}