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

import com.teotigraphix.app.configuration.ApplicationDescriptor;
import com.teotigraphix.app.configuration.IApplicationPermissions;

import t4b.configuration.ApplicationSettings;
import t4b.controller.CommandLauncher;
import t4b.controller.ScreenLauncher;
import t4b.controller.UIController;

public interface IApplicationModel
{
    function get applicationSettings():ApplicationSettings;
    
    function get descriptor():ApplicationDescriptor;
    
    function get permissions():IApplicationPermissions;
    
    function get screens():ScreenLauncher;

    function get commands():CommandLauncher;

    function get ui():UIController;
}
}
