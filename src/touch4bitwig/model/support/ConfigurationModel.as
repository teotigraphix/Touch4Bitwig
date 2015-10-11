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

package touch4bitwig.model.support
{

import com.teotigraphix.model.AbstractModel;

import feathers.data.HierarchicalCollection;

import touch4bitwig.app.config.ApplicationDebugConfiguration;
import touch4bitwig.app.config.ApplicationPreferences;
import touch4bitwig.model.IConfigurationModel;
import touch4bitwig.model.event.ConfigurationModelEventType;
import touch4bitwig.service.IConfigurationService;

public class ConfigurationModel extends AbstractModel implements IConfigurationModel
{
    //--------------------------------------------------------------------------
    // Inject
    //--------------------------------------------------------------------------

    [Inject]
    public var configurationService:IConfigurationService;

    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------

    private var _isInConfig:Boolean = false;
    private var _debugConfiguration:ApplicationDebugConfiguration;
    private var _ipDataProvider:HierarchicalCollection;
    private var _applicationPreferences:ApplicationPreferences;

    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------

    /**
     * @inheritDoc
     */
    public function get isInConfig():Boolean
    {
        return _isInConfig;
    }

    /**
     * @inheritDoc
     */
    public function set isInConfig(value:Boolean):void
    {
        if (_isInConfig == value)
            return;
        _isInConfig = value;
        dispatchWith(ConfigurationModelEventType.IS_IN_CONFIG_CHANGE, false, _isInConfig);
    }

    /**
     * @inheritDoc
     */
    public function get debugConfiguration():ApplicationDebugConfiguration
    {
        return _debugConfiguration;
    }

    /**
     * @inheritDoc
     */
    public function set debugConfiguration(value:ApplicationDebugConfiguration):void
    {
        if (_debugConfiguration == value)
            return;
        _debugConfiguration = value;
        dispatchWith(ConfigurationModelEventType.DEBUG_CONFIGURATION_CHANGE, false, _debugConfiguration);
    }

    /**
     * @inheritDoc
     */
    public function get ipDataProvider():HierarchicalCollection
    {
        return _ipDataProvider;
    }

    /**
     * @inheritDoc
     */
    public function set ipDataProvider(value:HierarchicalCollection):void
    {
        if (_ipDataProvider == value)
            return;
        _ipDataProvider = value;
        dispatchWith(ConfigurationModelEventType.IP_DATA_PROVIDER_CHANGE, false, _ipDataProvider);
    }

    /**
     * @inheritDoc
     */
    public function get applicationPreferences():ApplicationPreferences
    {
        return _applicationPreferences;
    }

    /**
     * @inheritDoc
     */
    public function set applicationPreferences(value:ApplicationPreferences):void
    {
        if (_applicationPreferences == value)
            return;
        _applicationPreferences = value;
        dispatchWith(ConfigurationModelEventType.APPLICATION_PREFERENCES_CHANGE, false, _applicationPreferences);
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