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

package touch4bitwig.model.state
{

import touch4bitwig.model.event.BitwigPanelEventType;
import touch4bitwig.service.IOSCService;

public class BitwigMixer extends AbstractBitwigState
{
    private var _clipLauncherVisible:Boolean;
    private var _crossFadeVisible:Boolean;
    private var _deviceVisible:Boolean;
    private var _sendsVisible:Boolean;
    private var _ioVisible:Boolean;
    private var _meterVisible:Boolean;

    public function get clipLauncherVisible():Boolean
    {
        return _clipLauncherVisible;
    }

    public function set clipLauncherVisible(value:Boolean):void
    {
        if (isSame(_clipLauncherVisible, value))
            return;
        _clipLauncherVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_CLIP_LAUNCHER_VISIBLE_CHANGE, _clipLauncherVisible);
    }

    public function get crossFadeVisible():Boolean
    {
        return _crossFadeVisible;
    }

    public function set crossFadeVisible(value:Boolean):void
    {
        if (isSame(_crossFadeVisible, value))
            return;
        _crossFadeVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_CROSS_FADE_VISIBLE_CHANGE, _crossFadeVisible);
    }

    public function get deviceVisible():Boolean
    {
        return _deviceVisible;
    }

    public function set deviceVisible(value:Boolean):void
    {
        if (isSame(_deviceVisible, value))
            return;
        _deviceVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_DEVICE_VISIBLE_CHANGE, _deviceVisible);
    }

    public function get sendsVisible():Boolean
    {
        return _sendsVisible;
    }

    public function set sendsVisible(value:Boolean):void
    {
        if (isSame(_sendsVisible, value))
            return;
        _sendsVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_SENDS_VISIBLE_CHANGE, _sendsVisible);
    }

    public function get ioVisible():Boolean
    {
        return _ioVisible;
    }

    public function set ioVisible(value:Boolean):void
    {
        if (isSame(_ioVisible, value))
            return;
        _ioVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_IO_VISIBLE_CHANGE, _ioVisible);
    }

    public function get meterVisible():Boolean
    {
        return _meterVisible;
    }

    public function set meterVisible(value:Boolean):void
    {
        if (isSame(_meterVisible, value))
            return;
        _meterVisible = value;
        dispatchValue(BitwigPanelEventType.MIXER_METER_VISIBLE_CHANGE, _meterVisible);
    }

    public function BitwigMixer(service:IOSCService)
    {
        super(service);
    }
}
}
