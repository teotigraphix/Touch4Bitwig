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

import touch4bitwig.model.state.BitwigTransport;
import touch4bitwig.service.IOSCService;

public class TransportListener extends AbstractOSCListener
{
    private var _model:BitwigTransport;

    public function TransportListener(service:IOSCService, model:BitwigTransport)
    {
        super(service);
        _model = model;
        config();
    }

    /*

    /click {1,0}
    /play {1,0}
    /record {1,0}
    /repeat {1,0}
    /preroll
    /overdub/launcher {1,0}
    /overdub {1,0}
    /crossfade {0-127}
    /autowrite {0,1}
    /autowrite/launcher
    /automationWriteMode/{latch,touch,write}



    */

    override protected function config():void
    {
        super.config();

        _methods["/position"] = positionHandler;
        _methods["/numerator"] = numeratorHandler;
        _methods["/denominator"] = denominatorHandler;
        _methods["/automationOverride"] = automationOverrideHandler;

        _methods["/tempo/raw"] = tempoRawHandler;
        _methods["/click"] = clickHandler;
        _methods["/play"] = playHandler;
        _methods["/record"] = recordHandler;
        _methods["/repeat"] = repeatHandler;
        _methods["/preroll"] = prerollHandler;
        _methods["/overdub/launcher"] = overdubLauncherHandler;
        _methods["/overdub"] = overdubHandler;
        _methods["/crossfade"] = corssfadeHandler;
        _methods["/autowrite"] = autoWriteHandler;
        _methods["/autowrite/launcher"] = autowriteLauncherHandler;
        _methods["/automationWriteMode"] = automationWriteModeHandler; // {latch,touch,write}
    }

    private function positionHandler(osc:OSCMessage):void
    {
        _model.positionString = osc.arguments[0];
    }

    private function numeratorHandler(osc:OSCMessage):void
    {
        _model.numerator = osc.arguments[0];
    }

    private function denominatorHandler(osc:OSCMessage):void
    {
        _model.denominator = osc.arguments[0];
    }

    private function automationOverrideHandler(osc:OSCMessage):void
    {
        _model.isAutomationOverride = osc.arguments[0];
    }

    private function tempoRawHandler(osc:OSCMessage):void
    {
        _model.tempoRaw = osc.arguments[0];
    }

    private function clickHandler(osc:OSCMessage):void
    {
        _model.isClick = osc.arguments[0];
    }

    private function playHandler(osc:OSCMessage):void
    {
        _model.isPlaying = osc.arguments[0];
    }

    private function recordHandler(osc:OSCMessage):void
    {
        _model.isRecording = osc.arguments[0];
    }

    private function repeatHandler(osc:OSCMessage):void
    {
        _model.isRepeat = osc.arguments[0];
    }

    private function prerollHandler(osc:OSCMessage):void
    {
        _model.isPreroll = osc.arguments[0];
    }

    private function overdubLauncherHandler(osc:OSCMessage):void
    {
        _model.isOverdubLauncher = osc.arguments[0];
    }

    private function overdubHandler(osc:OSCMessage):void
    {
        _model.isOverdub = osc.arguments[0];
    }

    private function corssfadeHandler(osc:OSCMessage):void
    {
        _model.isCrossfade = osc.arguments[0];
    }

    private function autoWriteHandler(osc:OSCMessage):void
    {
        _model.isAutowrite = osc.arguments[0];
    }

    private function autowriteLauncherHandler(osc:OSCMessage):void
    {
        _model.isAutowriteLauncher = osc.arguments[0];
    }

    private function automationWriteModeHandler(osc:OSCMessage):void
    {
        _model.automationWriteMode = osc.arguments[0];
    }

}
}
