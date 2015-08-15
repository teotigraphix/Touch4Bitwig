/**
 * Created by Teoti on 4/17/2015.
 */
package touch4bitwig.model.state
{

import flash.filesystem.File;

import touch4bitwig.app.config.ApplicationConfiguration;

import touch4bitwig.model.support.AbstractModel;
import touch4bitwig.model.support.ApplicationModel;
import touch4bitwig.model.support.ConnectionInstance;
import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.model.support.FrameModel;
import touch4bitwig.model.support.TrackModel;
import touch4bitwig.model.support.TransportModel;
import touch4bitwig.service.IConfigurationService;

public class GlobalModel extends AbstractModel
{
    [Inject]
    public var configurationService:IConfigurationService;

    [Inject]
    public var connection:ConnectionInstance;

    [Inject]
    public var trackModel:TrackModel;

    [Inject]
    public var transportModel:TransportModel;

    [Inject]
    public var deviceModel:DeviceModel;

    [Inject]
    public var userInterfaceModel:FrameModel;

    [Inject]
    public var applicationModel:ApplicationModel;

    private var _configuration:ApplicationConfiguration;

    public function get configuration():ApplicationConfiguration
    {
        return _configuration;
    }

    public function set configuration(value:ApplicationConfiguration):void
    {
        _configuration = value;
    }

    public function GlobalModel()
    {
    }

    public function setup():void
    {
        var file:File = File.applicationDirectory.resolvePath("config.xml");
        // TODO this is going to need to be async
        _configuration = configurationService.load(file);
    }
}
}
