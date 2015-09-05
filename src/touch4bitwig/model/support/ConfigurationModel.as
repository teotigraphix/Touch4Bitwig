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
import touch4bitwig.service.IConfigurationService;

public class ConfigurationModel extends AbstractModel implements IConfigurationModel
{
    [Inject]
    public var configurationService:IConfigurationService;

    private var _debugConfiguration:ApplicationDebugConfiguration;
    private var _connection:ConnectionInstance;
    private var _ipDataProvider:HierarchicalCollection;
    private var _applicationPreferences:ApplicationPreferences;

    public function get debugConfiguration():ApplicationDebugConfiguration
    {
        return _debugConfiguration;
    }

    public function set debugConfiguration(value:ApplicationDebugConfiguration):void
    {
        _debugConfiguration = value;
    }

    public function get connection():ConnectionInstance
    {
        return _connection;
    }

    public function get ipDataProvider():HierarchicalCollection
    {
        return _ipDataProvider;
    }

    public function set ipDataProvider(value:HierarchicalCollection):void
    {
        _ipDataProvider = value;
    }

    public function get applicationPreferences():ApplicationPreferences
    {
        return _applicationPreferences;
    }

    public function set applicationPreferences(value:ApplicationPreferences):void
    {
        _applicationPreferences = value;
    }

    public function ConfigurationModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _connection = new ConnectionInstance();
    }

    public function connect():Boolean
    {
        // calls _connection.close() if current connection exists
        // recreates the OSCManager
        _connection.setup(_applicationPreferences.deviceIP, _applicationPreferences.devicePort,
                          _applicationPreferences.dawIP, _applicationPreferences.dawPort);

        var bound:Boolean = _connection.connect();
        return bound;
    }
}
}