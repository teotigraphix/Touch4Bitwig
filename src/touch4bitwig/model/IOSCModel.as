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

import touch4bitwig.model.state.BitwigApplication;
import touch4bitwig.model.state.BitwigArranger;
import touch4bitwig.model.state.BitwigDevice;
import touch4bitwig.model.state.BitwigMixer;
import touch4bitwig.model.state.BitwigPanes;
import touch4bitwig.model.state.BitwigTrackBank;
import touch4bitwig.model.state.BitwigTransport;

public interface IOSCModel
{
    function get application():BitwigApplication;

    function get trackBank():BitwigTrackBank;

    function get transport():BitwigTransport;

    function get device():BitwigDevice;

    function get cursorDevice():BitwigDevice;

    function get primaryDevice():BitwigDevice;

    function get deviceMode():String;

    function set deviceMode(value:String):void;

    function get panes():BitwigPanes;

    function get arranger():BitwigArranger;

    function get mixer():BitwigMixer;

    //
    function getAutomationWriteModeValue(index:int):String;

}
}
