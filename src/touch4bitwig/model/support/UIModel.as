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

import feathers.data.ListCollection;

import touch4bitwig.event.UIModelEventType;
import touch4bitwig.model.IUIModel;
import touch4bitwig.view.ApplicationScreens;

public class UIModel extends AbstractModel implements IUIModel
{
    private var _screenID:String;
    private var _screenDataProvider:ListCollection;
    private var _panelsLayoutDataProvider:ListCollection;

    public function get screenID():String
    {
        return _screenID;
    }

    public function set screenID(value:String):void
    {
        if (_screenID == value)
            return;
        _screenID = value;
        dispatchWith(UIModelEventType.SCREEN_ID, false, _screenID);
    }

    public function get screenDataProvider():ListCollection
    {
        return _screenDataProvider;
    }

    // Panels

    public function get panelsLayoutDataProvider():ListCollection
    {
        return _panelsLayoutDataProvider;
    }

    public function get screenIndex():int
    {
        for each (var object:Object in screenDataProvider.data)
        {
            if (object.screen == _screenID)
                return object.index;
        }
        return -1;
    }

    public function UIModel()
    {
    }

    override protected function onRegister():void
    {
        super.onRegister();

        _screenDataProvider = new ListCollection([
            {index: 0, label: "Mixer", screen: ApplicationScreens.SCREEN_MIXER},
            {index: 1, label: "Transport", screen: ApplicationScreens.SCREEN_TRANSPORT},
            {index: 2, label: "Panels", screen: ApplicationScreens.SCREEN_PANEL}
        ]);

        _panelsLayoutDataProvider = new ListCollection([
            {label: "ARRANGE"},
            {label: "MIX"},
            {label: "EDIT"}
        ]);
    }

    public function back():void
    {
        dispatchWith(UIModelEventType.BACK);
    }
}
}
