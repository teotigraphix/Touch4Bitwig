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

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.model.state.Application;
import touch4bitwig.model.state.Arranger;
import touch4bitwig.model.state.Device;
import touch4bitwig.model.state.Mixer;
import touch4bitwig.model.state.Panes;
import touch4bitwig.model.state.TrackBank;
import touch4bitwig.model.state.Transport;
import touch4bitwig.model.support.ConnectionInstance;

public interface IOSCModel
{
    function get connection():ConnectionInstance;

    function get application():Application;

    function get trackBank():TrackBank;

    function get transport():Transport;

    function get device():Device;

    function get cursorDevice():Device;

    function get primaryDevice():Device;

    function get deviceMode():String;

    function set deviceMode(value:String):void;

    function get panes():Panes;

    function get arranger():Arranger;

    function get mixer():Mixer;

    function get configuration():ApplicationConfiguration;

    function setup():void;

    //
    function getAutomationWriteModeValue(index:int):String;

}
}
