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

/**
 * The IConfigurationModel API gives access to the IP/Port data provider, debug configuration
 * and application preferences.
 */
public interface IConfigurationModel
{
    //--------------------------------------------------------------------------
    // Properties
    //--------------------------------------------------------------------------

    //----------------------------------
    // isInConfig
    //----------------------------------

    /**
     * Whether the app is in explicit configuration form.
     *
     * @see touch4bitwig.model.event.ConfigurationModelEventType.IS_IN_CONFIG_CHANGE
     */
    function get isInConfig():Boolean;

    function set isInConfig(value:Boolean):void;

    //----------------------------------
    // ipDataProvider
    //----------------------------------

    /**
     * The IP/Port data provider with a structure of;
     *
     * <pre>
     * [{
     *     header: {text: displayName},
     *     children: [
     *          {text: address},
     *          ...
     *     ],
     * ...
     * }]
     * </pre>
     *
     * @see touch4bitwig.model.event.ConfigurationModelEventType.IP_DATA_PROVIDER_CHANGE
     */
    function get ipDataProvider():HierarchicalCollection;

    function set ipDataProvider(value:HierarchicalCollection):void;

    //----------------------------------
    // debugConfiguration
    //----------------------------------

    /**
     * The application's debug configuration created from a loaded XML file.
     *
     * @see touch4bitwig.model.event.ConfigurationModelEventType.DEBUG_CONFIGURATION_CHANGE
     */
    function get debugConfiguration():ApplicationDebugConfiguration;

    function set debugConfiguration(configuration:ApplicationDebugConfiguration):void;

    //----------------------------------
    // applicationPreferences
    //----------------------------------

    /**
     * The application's serialized preferences.
     *
     * @see touch4bitwig.model.event.ConfigurationModelEventType.APPLICATION_PREFERENCES_CHANGE
     */
    function get applicationPreferences():ApplicationPreferences;

    function set applicationPreferences(value:ApplicationPreferences):void;

}
}
