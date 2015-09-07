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

package touch4bitwig.model
{

import feathers.data.HierarchicalCollection;

import touch4bitwig.app.config.ApplicationDebugConfiguration;
import touch4bitwig.app.config.ApplicationPreferences;

public interface IConfigurationModel
{
    /**
     * Whether the app is in explicit configuration form.
     *
     * @event ConfigurationModelEventType IS_IN_CONFIG
     */
    function get isInConfig():Boolean;

    function set isInConfig(value:Boolean):void;

    function get ipDataProvider():HierarchicalCollection;

    function set ipDataProvider(value:HierarchicalCollection):void;

    function get debugConfiguration():ApplicationDebugConfiguration;

    function set debugConfiguration(configuration:ApplicationDebugConfiguration):void;

    function get applicationPreferences():ApplicationPreferences;

    function set applicationPreferences(value:ApplicationPreferences):void;

}
}
