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

import touch4bitwig.ui.component.screen.ClipScreenFooter;
import touch4bitwig.ui.component.screen.ClipsScreen;
import touch4bitwig.view.AbstractMediator;

public class ClipsScreenMediator extends AbstractMediator
{
    private var view:ClipsScreen;

    public function ClipsScreenMediator()
    {
    }

    override public function preRegister():void
    {
        super.preRegister();
    }

    override public function onRegister():void
    {
        super.onRegister();

        addViewListener(ClipScreenFooter.EVENT_DOWN_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_LEFT_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_RIGHT_TAP, view_bankNavigationTapHandler);
        addViewListener(ClipScreenFooter.EVENT_UP_TAP, view_bankNavigationTapHandler);
    }

    override public function onRemove():void
    {
        super.onRemove();
    }

    override public function setViewComponent(viewComponent:Object):void
    {
        super.setViewComponent(viewComponent);
        view = ClipsScreen(viewComponent);
    }

    override public function preRemove():void
    {
        super.preRemove();
        view = null;
    }

    private function view_bankNavigationTapHandler(event:Event, direction:String):void
    {
        switch (direction)
        {
            case ClipScreenFooter.DIRECTION_UP:
                oscService.send("/scene/-");
                break;

            case ClipScreenFooter.DIRECTION_DOWN:
                oscService.send("/scene/+");
                break;

            case ClipScreenFooter.DIRECTION_LEFT:
                oscService.send("/track/-");
                break;

            case ClipScreenFooter.DIRECTION_RIGHT:
                oscService.send("/track/+");
                break;
        }
    }
}
}