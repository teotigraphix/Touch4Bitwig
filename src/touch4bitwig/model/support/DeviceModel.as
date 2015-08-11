/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.model.support
{

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.model.state.Device;
import touch4bitwig.service.IOSCService;

public class DeviceModel extends AbstractModel
{
    public static const MODE_PARAM:String = "param";
    public static const MODE_COMMON:String = "common";
    public static const MODE_ENVELOPE:String = "envelope";
    public static const MODE_MACRO:String = "macro";
    public static const MODE_MODULATION:String = "modulation";

    [Inject]
    public var oscService:IOSCService;

    private var _cursorDevice:Device;
    private var _primaryDevice:Device;
    private var _device:Device;

    private var _mode:String = MODE_PARAM;

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

    public function get mode():String
    {
        return _mode;
    }

    public function set mode(value:String):void
    {
        if (_mode == value)
            return;
        _mode = value;
        dispatchWith(DeviceModelEventType.MODE_CHANGE, false, _mode);
    }

    public function DeviceModel()
    {
    }

    override protected function onRegister():void
    {
        _cursorDevice = new Device(oscService, "device");
        _primaryDevice = new Device(oscService, "primary");

        _device = _cursorDevice;
    }

    public function indicateParam(enabled:Boolean):void
    {

    }

}
}
