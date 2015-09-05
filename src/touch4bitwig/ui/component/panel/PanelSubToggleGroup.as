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

package touch4bitwig.ui.component.panel
{

import feathers.controls.Button;
import feathers.controls.ButtonGroup;

import starling.events.Event;

public class PanelSubToggleGroup extends ButtonGroup
{
    public function PanelSubToggleGroup()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        direction = ButtonGroup.DIRECTION_HORIZONTAL;
    }

    override protected function defaultButtonEventsListener(event:Event):void
    {
        var button:Button = Button(event.currentTarget);
        var index:int = this.activeButtons.indexOf(button);
        var item:Object = this._dataProvider.getItemAt(index);
        if (item == null)
            return; // buttons are being created and properties set
        var field:String = event.type;
        if (item.hasOwnProperty(field))
        {
            var listener:Function = item[field] as Function;
            if (listener == null)
            {
                return;
            }
            var argCount:int = listener.length;
            if (argCount == 1)
            {
                listener(event);
            }
            else if (argCount == 2)
            {
                listener(event, item);
            }
            else
            {
                listener();
            }
        }
    }
}
}
