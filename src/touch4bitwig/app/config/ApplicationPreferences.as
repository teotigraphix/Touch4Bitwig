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

public class ApplicationPreferences
{
    public var dawPort:int = 8000;
    public var dawIP:String = "127.0.0.1";

    public var devicePort:int = 9000;
    public var deviceIP:String = "127.0.0.1";

    public function ApplicationPreferences()
    {
    }

    public function configure(configuration:ApplicationDebugConfiguration):void
    {
        dawPort = configuration.dawPort;
        dawIP = configuration.dawIP;
        devicePort = configuration.devicePort;
        deviceIP = configuration.deviceIP;
    }
}
}