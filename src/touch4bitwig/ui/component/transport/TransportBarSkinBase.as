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

package touch4bitwig.ui.component.transport
{

import touch4bitwig.ui.component.main.*;

import feathers.controls.LayoutGroup;

public class TransportBarSkinBase extends LayoutGroup implements ITransportBar
{
    public var owner:TransportBar;

    private var _isPlaying:Boolean;
    private var _isRecording:Boolean;
    private var _isAutowrite:Boolean;

    public function get isPlaying():Boolean
    {
        return _isPlaying;
    }

    public function set isPlaying(value:Boolean):void
    {
        _isPlaying = value;
    }

    public function get isRecording():Boolean
    {
        return _isRecording;
    }

    public function set isRecording(value:Boolean):void
    {
        _isRecording = value;
    }

    public function get isAutowrite():Boolean
    {
        return _isAutowrite;
    }

    public function set isAutowrite(value:Boolean):void
    {
        _isAutowrite = value;
    }

    public function TransportBarSkinBase()
    {
    }
}
}
