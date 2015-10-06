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

package touch4bitwig.model.support
{

import com.teotigraphix.model.AbstractModel;

import touch4bitwig.model.event.BitwigDeviceEventType;
import touch4bitwig.model.IOSCModel;
import touch4bitwig.model.state.BitwigApplication;
import touch4bitwig.model.state.BitwigArranger;
import touch4bitwig.model.state.BitwigDevice;
import touch4bitwig.model.state.BitwigMixer;
import touch4bitwig.model.state.BitwigPanes;
import touch4bitwig.model.state.BitwigTrackBank;
import touch4bitwig.model.state.BitwigTransport;
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
    private var _automationWriteModeMap:Object;
    private var _application:BitwigApplication;
    private var _trackBank:BitwigTrackBank;
    private var _transport:BitwigTransport;
    private var _cursorDevice:BitwigDevice;
    private var _primaryDevice:BitwigDevice;
    private var _device:BitwigDevice;
    private var _deviceMode:String = DEVICE_MODE_PARAM;
    private var _panes:BitwigPanes;
    private var _arranger:BitwigArranger;
    private var _mixer:BitwigMixer;

    public function get transport():BitwigTransport
    {
        return _transport;
    }

    public function get trackBank():BitwigTrackBank
    {
        return _trackBank;
    }

    public function get application():BitwigApplication
    {
        return _application;
    }

    public function get device():BitwigDevice
    {
        return _device;
    }

    public function get cursorDevice():BitwigDevice
    {
        return _cursorDevice;
    }

    public function get primaryDevice():BitwigDevice
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
        dispatchWith(BitwigDeviceEventType.MODE_CHANGE, false, _deviceMode);
    }

    public function get panes():BitwigPanes
    {
        return _panes;
    }

    public function get arranger():BitwigArranger
    {
        return _arranger;
    }

    public function get mixer():BitwigMixer
    {
        return _mixer;
    }

    public function OSCModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _application = new BitwigApplication(oscService);
        _trackBank = new BitwigTrackBank(oscService);
        _transport = new BitwigTransport(oscService);

        _automationWriteModeMap = {};
        _automationWriteModeMap[0] = "latch";
        _automationWriteModeMap[1] = "touch";
        _automationWriteModeMap[2] = "write";

        _cursorDevice = new BitwigDevice(oscService, "device");
        _primaryDevice = new BitwigDevice(oscService, "primary");
        _device = _cursorDevice;

        _panes = new BitwigPanes(oscService);
        _arranger = new BitwigArranger(oscService);
        _mixer = new BitwigMixer(oscService);
    }

    public function getAutomationWriteModeValue(index:int):String
    {
        return _automationWriteModeMap[index];
    }
}
}
