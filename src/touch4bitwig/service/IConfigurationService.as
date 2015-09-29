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

package touch4bitwig.service
{

import com.teotigraphix.service.async.IStepCommand;

/**
 * The IConfigurationService manages ip/port connections and configuration files.
 */
public interface IConfigurationService
{
    /**
     * Loads the NetworkInterface's network list and creates a collection from the results.
     *
     * @return Command with result as a HierarchicalCollection.
     */
    function loadIPsAsync():IStepCommand;

    /**
     * Loads the debug XML configuration file into the ApplicationConfiguration.
     *
     * @return Command with result as ApplicationConfiguration if the config file exists.
     */
    function loadLastConfigurationFileAsync():IStepCommand;

    /**
     * Loads the binary config preferences file.
     *
     * @return Command with result as ApplicationPreferences.
     */
    function loadApplicationPreferencesAsync():IStepCommand;

    /**
     * Saves the ApplicationPreferences to a binary file.
     *
     * @return Command with result as ApplicationPreferences's File location saved.
     */
    function saveApplicationPreferencesAsync():IStepCommand;
}
}
