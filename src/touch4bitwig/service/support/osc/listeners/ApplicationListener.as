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

package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.state.Application;
import touch4bitwig.service.IOSCService;

public class ApplicationListener extends AbstractOSCListener
{
    private var _model:Application;

    public function ApplicationListener(service:IOSCService, model:Application)
    {
        super(service);
        _model = model;
        config();
    }

    override protected function config():void
    {
        super.config();
        _methods["/layout"] = handleLayout;
        _methods["/active"] = handleActivate;
        _methods["/flushComplete"] = handleFlushComplete;
    }

    private function handleLayout(osc:OSCMessage):void
    {
        _model.layout = osc.arguments[0];
    }

    private function handleActivate(osc:OSCMessage):void
    {
        _model.active = osc.arguments[0];
    }

    private function handleFlushComplete(osc:OSCMessage):void
    {
        _model.flushComplete();
    }

}
}
