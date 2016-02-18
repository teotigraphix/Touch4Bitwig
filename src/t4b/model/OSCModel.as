////////////////////////////////////////////////////////////////////////////////
// Copyright 2016 Michael Schmalle - Teoti Graphix, LLC
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
package t4b.model
{

import com.teotigraphix.model.AbstractModel;

import t4b.model.osc.BitwigTransport;
import t4b.service.ConfigurationService;
import t4b.service.OSCService;

public class OSCModel extends AbstractModel
{
    //--------------------------------------------------------------------------
    // Constants
    //--------------------------------------------------------------------------
    
    public static const DEVICE_MODE_PARAM:String = "param";
    public static const DEVICE_MODE_COMMON:String = "common";
    public static const DEVICE_MODE_ENVELOPE:String = "envelope";
    public static const DEVICE_MODE_MACRO:String = "macro";
    public static const DEVICE_MODE_MODULATION:String = "modulation";
    
    //--------------------------------------------------------------------------
    // Inject
    //---------------------------------------------------OSCModelImpl---------------
    
    [Inject]
    public var oscService:OSCService;
    
    [Inject]
    public var configurationService:ConfigurationService;
    
    //--------------------------------------------------------------------------
    // Private :: Variables
    //--------------------------------------------------------------------------
    
    private var _automationWriteModeMap:Object;
    //    private var _application:BitwigApplication;
    //    private var _trackBank:BitwigTrackBank;
    private var _transport:BitwigTransport;
    //    private var _cursorDevice:BitwigDevice;
    //    private var _primaryDevice:BitwigDevice;
    //    private var _device:BitwigDevice;
    //    private var _deviceMode:String = DEVICE_MODE_PARAM;
    //    private var _panes:BitwigPanes;
    //    private var _arranger:BitwigArranger;
    //    private var _mixer:BitwigMixer;
    //    private var _browser:IBitwigBrowser;
    
    //--------------------------------------------------------------------------
    // API :: Properties
    //--------------------------------------------------------------------------
    
    //----------------------------------
    // transport
    //----------------------------------
    
    /**
     * @inheritDoc
     */
    public function get transport():BitwigTransport
    {
        return _transport;
    }
    //
    //    //----------------------------------
    //    // trackBank
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get trackBank():IBitwigTrackBank
    //    {
    //        return _trackBank;
    //    }
    //
    //    //----------------------------------
    //    // application
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get application():IBitwigApplication
    //    {
    //        return _application;
    //    }
    //
    //    //----------------------------------
    //    // device
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get device():BitwigDevice
    //    {
    //        return _device;
    //    }
    //
    //    //----------------------------------
    //    // cursorDevice
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get cursorDevice():BitwigDevice
    //    {
    //        return _cursorDevice;
    //    }
    //
    //    //----------------------------------
    //    // primaryDevice
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get primaryDevice():BitwigDevice
    //    {
    //        return _primaryDevice;
    //    }
    //
    //    //----------------------------------
    //    // deviceMode
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get deviceMode():String
    //    {
    //        return _deviceMode;
    //    }
    //
    //    public function set deviceMode(value:String):void
    //    {
    //        if (_deviceMode == value)
    //            return;
    //        _deviceMode = value;
    //        dispatchWith(BitwigDeviceEventType.MODE_CHANGE, false, _deviceMode);
    //    }
    //
    //    //----------------------------------
    //    // panes
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get panes():BitwigPanes
    //    {
    //        return _panes;
    //    }
    //
    //    //----------------------------------
    //    // arranger
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get arranger():BitwigArranger
    //    {
    //        return _arranger;
    //    }
    //
    //    //----------------------------------
    //    // mixer
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get mixer():BitwigMixer
    //    {
    //        return _mixer;
    //    }
    //
    //    //----------------------------------
    //    // browser
    //    //----------------------------------
    //
    //    /**
    //     * @inheritDoc
    //     */
    //    public function get browser():IBitwigBrowser
    //    {
    //        return _browser;
    //    }
    
    //--------------------------------------------------------------------------
    // Constructor
    //--------------------------------------------------------------------------
    
    public function OSCModel()
    {
    }
    
    //--------------------------------------------------------------------------
    // Overridden :: Methods
    //--------------------------------------------------------------------------
    
    override protected function onRegister():void
    {
        super.onRegister();
        
        //        _application = new BitwigApplication(oscService);
        //        _trackBank = new BitwigTrackBank(oscService);
        _transport = new BitwigTransport(oscService);
        
        _automationWriteModeMap = {};
        _automationWriteModeMap[0] = "latch";
        _automationWriteModeMap[1] = "touch";
        _automationWriteModeMap[2] = "write";
        //
        //        _cursorDevice = new BitwigDevice(oscService, "device");
        //        _primaryDevice = new BitwigDevice(oscService, "primary");
        //        _device = _cursorDevice;
        //
        //        _panes = new BitwigPanes(oscService);
        //        _arranger = new BitwigArranger(oscService);
        //        _mixer = new BitwigMixer(oscService);
        //        _browser = new BitwigBrowser(oscService);
    }
    
    //--------------------------------------------------------------------------
    // API :: Methods
    //--------------------------------------------------------------------------
    
    /**
     * @inheritDoc
     */
    public function getAutomationWriteModeValue(index:int):String
    {
        return _automationWriteModeMap[index];
    }
}
}
