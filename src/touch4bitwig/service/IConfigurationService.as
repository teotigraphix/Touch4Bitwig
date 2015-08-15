/**
 * Created by Teoti on 8/15/2015.
 */
package touch4bitwig.service
{

import flash.filesystem.File;

import touch4bitwig.app.config.ApplicationConfiguration;

public interface IConfigurationService
{
    function load(configFile:File):ApplicationConfiguration;
}
}
