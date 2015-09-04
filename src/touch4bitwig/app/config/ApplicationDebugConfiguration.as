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

package touch4bitwig.app.config
{

/*
PC[8000] 192.168.1.3
An[9000] 192.168.1.6

src/config.xml

<configuration>
    <connection enabled="false" mode="emulator">
        <emulator>
            <daw port="8000" ip="192.168.1.3"/>
            <device port="9000" ip="192.168.1.3"/>
        </emulator>
        <wifi>
            <daw port="8000" ip="192.168.1.3"/>
            <device port="9000" ip="192.168.1.6"/>
        </wifi>
    </connection>
</configuration>
 */

public class ApplicationDebugConfiguration
{
    public var dawPort:int;
    public var dawIP:String;

    public var devicePort:int;
    public var deviceIP:String;

    private var _isEnabled:Boolean;

    public function get isEnabled():Boolean
    {
        return _isEnabled;
    }

    public function ApplicationDebugConfiguration(data:String)
    {
        // TODO this only works for Android ARM not x86
        // var isDevice:Boolean = Capabilities.cpuArchitecture == "ARM";

        var xml:XML = new XML(data);
        var connection:XML = xml.connection[0];
        //var mode:String = isDevice ? "wifi" : "emulator";
        _isEnabled = connection.@enabled == "true";

        if (_isEnabled)
        {
            var mode:String = connection.@mode;
            var connectionImpl:XML = connection[mode][0];

            dawPort = connectionImpl[0].daw.@port;
            dawIP = connectionImpl[0].daw.@ip;
            devicePort = connectionImpl[0].device.@port;
            deviceIP = connectionImpl[0].device.@ip;
        }
    }
}
}
