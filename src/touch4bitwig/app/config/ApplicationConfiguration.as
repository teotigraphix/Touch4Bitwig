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

 src/config.xml

 <?xml version="1.0" encoding="utf-8"?>
 <configuration>
 <connection deviceMode="emulator" />
 <serverDevice port="9000" ip="192.168.0.244" />
 <clientDevice port="8000" ip="192.168.0.122" />

 <serverEmulator port="9000" ip="127.0.0.1" />
 <clientEmulator port="8000" ip="127.0.0.1" />


 </connection>
 </configuration>

 */

public class ApplicationConfiguration
{
    public var serverPort:int;
    public var clientPort:int;
    public var serverIP:String;
    public var clientIP:String;

    public function ApplicationConfiguration(data:String)
    {
        var xml:XML = new XML(data);

        if (xml.connection[0].@deviceMode == "emulator")
        {
            serverPort = xml.connection[0].serverEmulator.@port;
            serverIP = xml.connection[0].serverEmulator.@ip;
            clientPort = xml.connection[0].clientEmulator.@port;
            clientIP = xml.connection[0].clientEmulator.@ip;
        }
        else
        {
            serverPort = xml.connection[0].serverDevice.@port;
            serverIP = xml.connection[0].serverDevice.@ip;
            clientPort = xml.connection[0].clientDevice.@port;
            clientIP = xml.connection[0].clientDevice.@ip;
        }
    }
}
}
