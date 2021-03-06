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
package t4b.configuration
{

import com.teotigraphix.model.impl.AbstractApplicationSettings;

import t4b.model.state.ConfigurationState;

public class ApplicationSettings extends AbstractApplicationSettings
{
    public static const CONFIGURATION_STATE:String = "configurationState";
    
    //----------------------------------
    // configurationState
    //----------------------------------
    
    public function get configurationState():ConfigurationState
    {
        return getObject(CONFIGURATION_STATE, null);
    }
    
    public function set configurationState(value:ConfigurationState):void
    {
        put(CONFIGURATION_STATE, value);
    }
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------

    public function ApplicationSettings()
    {
    }

    override public function startup():void
    {
        super.startup();
    }
}
}
