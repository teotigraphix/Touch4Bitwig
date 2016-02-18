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
package t4b.controller.command.ui
{
import com.teotigraphix.controller.command.core.AbstractCommand;

public class $_EditConfigurationCommand extends AbstractCommand
{
    public static const ID:String = "$_EditConfigurationCommand";
    
    override public function execute():void
    {
        sequence(new Result(event.data)).
            add(ShowConfigurationDialogStep).
            execute();
    }
}
}
import com.teotigraphix.ui.component.event.FrameworkEventType;

import starling.events.Event;

import t4b.controller.command.core._Step;
import t4b.model.state.ConfigurationState;
import t4b.view.ui.dialog.ConfigurationDialog;
import t4b.view.ui.dialog.ConfigurationForm;

final class Result
{
    public var state:ConfigurationState;
    
    public var dialog:ConfigurationDialog;
    
    public function Result(data:Object)
    {
        this.state = data.state;
    }
}

class __Step extends _Step
{
    public function get o():Result 
    {
        return data as Result;
    }
}

//--------------------------------------------------------------------------
// Commands
//--------------------------------------------------------------------------

//----------------------------------
// ShowConfigurationDialogStep
//----------------------------------

final class ShowConfigurationDialogStep extends __Step
{
    override public function execute():*
    {
        o.dialog = ConfigurationDialog.show("OSC Configuration", o.state, model.configuration.ipDataProvider);
        o.dialog.addEventListener(ConfigurationForm.EVENT_IS_VALID, form_isValidHandler);
        o.dialog.addEventListener(FrameworkEventType.OK, form_okHandler);
        return super.execute();
    }
    
    private function form_isValidHandler(event:Event):void
    {
        o.dialog.isYesEnabled = true;
    }
    
    private function form_okHandler(event:Event):void
    {
        // try connecting
        model.configuration.state = o.state;
        // setting this fires an event that will try and connect, if connection fails
        // this command will be called again
        complete();
    }
}