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

package touch4bitwig.service.support
{

import com.teotigraphix.service.IFileService;

import flash.filesystem.File;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.service.IConfigurationService;

public class ConfigurationService implements IConfigurationService
{
    [Inject]
    public var fileService:IFileService;

    public function ConfigurationService()
    {
    }

    public function load(configFile:File):ApplicationConfiguration
    {
        var data:String = fileService.readString(configFile);
        var config:ApplicationConfiguration = new ApplicationConfiguration(data);
        return config;
    }
}
}
