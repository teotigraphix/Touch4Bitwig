/**
 * Created by Teoti on 8/15/2015.
 */
package touch4bitwig.service.support
{

import flash.filesystem.File;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.util.Files;

public class ConfigurationService implements IConfigurationService
{
    public function ConfigurationService()
    {
    }

    public function load(configFile:File):ApplicationConfiguration
    {
        var data:String = Files.readUTF8File(configFile);
        var config:ApplicationConfiguration = new ApplicationConfiguration(data);
        return config;
    }
}
}
