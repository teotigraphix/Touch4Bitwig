package touch4bitwig.model.support
{

import flash.filesystem.File;

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.state.Application;
import touch4bitwig.model.state.Arranger;
import touch4bitwig.model.state.Device;
import touch4bitwig.model.state.Mixer;
import touch4bitwig.model.state.Panes;
import touch4bitwig.model.state.TrackBank;
import touch4bitwig.model.state.Transport;
import touch4bitwig.service.IConfigurationService;
import touch4bitwig.service.IOSCService;

public class OSCModel extends AbstractModel implements IOSCModel
{
    public static const DEVICE_MODE_PARAM:String = "param";
    public static const DEVICE_MODE_COMMON:String = "common";
    public static const DEVICE_MODE_ENVELOPE:String = "envelope";
    public static const DEVICE_MODE_MACRO:String = "macro";
    public static const DEVICE_MODE_MODULATION:String = "modulation";

    [Inject]
    public var oscService:IOSCService;

    [Inject]
    public var configurationService:IConfigurationService;

    //
    private var _connection:ConnectionInstance;
    private var _automationWriteModeMap:Object;
    private var _application:Application;
    private var _trackBank:TrackBank;
    private var _transport:Transport;
    private var _cursorDevice:Device;
    private var _primaryDevice:Device;
    private var _device:Device;
    private var _deviceMode:String = DEVICE_MODE_PARAM;
    private var _panes:Panes;
    private var _arranger:Arranger;
    private var _mixer:Mixer;
    private var _configuration:ApplicationConfiguration;

    [Inject]
    public function get connection():ConnectionInstance
    {
        return _connection;
    }

    public function set connection(value:ConnectionInstance):void
    {
        _connection = value;
    }

    public function get transport():Transport
    {
        return _transport;
    }

    public function get trackBank():TrackBank
    {
        return _trackBank;
    }

    public function get application():Application
    {
        return _application;
    }

    public function get device():Device
    {
        return _device;
    }

    public function get cursorDevice():Device
    {
        return _cursorDevice;
    }

    public function get primaryDevice():Device
    {
        return _primaryDevice;
    }

    public function get deviceMode():String
    {
        return _deviceMode;
    }

    public function set deviceMode(value:String):void
    {
        if (_deviceMode == value)
            return;
        _deviceMode = value;
        dispatchWith(DeviceModelEventType.MODE_CHANGE, false, _deviceMode);
    }

    public function get panes():Panes
    {
        return _panes;
    }

    public function get arranger():Arranger
    {
        return _arranger;
    }

    public function get mixer():Mixer
    {
        return _mixer;
    }

    public function get configuration():ApplicationConfiguration
    {
        return _configuration;
    }

    public function set configuration(value:ApplicationConfiguration):void
    {
        _configuration = value;
    }

    public function OSCModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _application = new Application(oscService);
        _trackBank = new TrackBank(oscService);
        _transport = new Transport(oscService);

        _automationWriteModeMap = {};
        _automationWriteModeMap[0] = "latch";
        _automationWriteModeMap[1] = "touch";
        _automationWriteModeMap[2] = "write";

        _cursorDevice = new Device(oscService, "device");
        _primaryDevice = new Device(oscService, "primary");
        _device = _cursorDevice;

        _panes = new Panes(oscService);
        _arranger = new Arranger(oscService);
        _mixer = new Mixer(oscService);
    }

    public function setup():void
    {
        var file:File = File.applicationDirectory.resolvePath("config.xml");
        // TODO this is going to need to be async
        _configuration = configurationService.load(file);
    }

    public function getAutomationWriteModeValue(index:int):String
    {
        return _automationWriteModeMap[index];
    }
}
}
