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

package touch4bitwig.view.screen
{

import starling.events.Event;

import touch4bitwig.view.AbstractMediator;

import touch4bitwig.view.screen.TestScreen;

public class TestScreenMediator extends AbstractMediator
{
    [Inject]
    public var screen:TestScreen;

    public function TestScreenMediator()
    {
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener("changed", view_changeHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    private function view_changeHandler(event:Event, selected:Boolean):void
    {
        //transportModel.transport.isPlaying = selected;

        if (selected)
            oscService.send("/play");
        else
            oscService.sendInt("/stop", 1);
    }
}
}
