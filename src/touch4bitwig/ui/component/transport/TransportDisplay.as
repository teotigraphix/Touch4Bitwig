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

import feathers.core.FeathersControl;
import feathers.data.ListCollection;

public class TransportDisplay extends FeathersControl
{
    public static const EVENT_TAP:String = "TransportDisplay/tap";
    public static const EVENT_TEMPO:String = "TransportDisplay/tempo";

    private var _wholeDataProvider:ListCollection;
    private var _fractionDataProvider:ListCollection;
    private var _skin:TransportDisplaySkin;

    public function get wholeDataProvider():ListCollection
    {
        return _wholeDataProvider;
    }

    public function set wholeDataProvider(value:ListCollection):void
    {
        _wholeDataProvider = value;
        _skin.wholeDataProvider = value;
    }

    public function get fractionDataProvider():ListCollection
    {
        return _fractionDataProvider;
    }

    public function set fractionDataProvider(value:ListCollection):void
    {
        _fractionDataProvider = value;
        _skin.fractionDataProvider = value;
    }

    public function TransportDisplay()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        _skin = new TransportDisplaySkin();
        _skin.owner = this;
        addChild(_skin);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(actualWidth, actualHeight);
    }

    public function setTempo(value:String):void
    {
        _skin.setTempo(value);
    }

    public function setTimeSignature(value:String):void
    {
        _skin.setTimeSignature(value);
    }

    public function setPosition(value:String):void
    {
        _skin.setPosition(value);
    }

    public function setTime(value:String):void
    {
        _skin.setTime(value);
    }
}
}
