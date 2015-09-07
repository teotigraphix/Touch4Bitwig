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

import touch4bitwig.model.state.Device;
import touch4bitwig.service.IOSCService;

public class DeviceListener extends AbstractOSCListener
{
    private var _model:Device;

    public function DeviceListener(service:IOSCService, model:Device)
    {
        super(service);
        _model = model;

        config();
    }

    override protected function config():void
    {
        _methods["/device/canSelectPrevious"] = canSelectPreviousHandler;
        _methods["/device/canSelectNext"] = canSelectNextHandler;

        _methods["/device/name"] = nameHandler;
        _methods["/device/bypass"] = bypassHandler;
        _methods["/device/expand"] = expandHandler;
        _methods["/device/window"] = windowHandler;
        _methods["/device/macroVisible"] = macroVisibleHandler;
        _methods["/device/paramVisible"] = paramVisibleHandler;
        _methods["/device/category"] = categoryHandler;
        _methods["/device/creator"] = creatorHandler;
        _methods["/device/preset"] = presetHandler;

        _methods["/device/param/selectedPageName"] = selectedPageNameHandler;
        _methods["/device/param/pageNames"] = pageNamesHandler;

        for (var i:int = 1; i < 9; i++)
        {
            _methods["/device/param/" + i + "/name"] = paramNameHandler;
            _methods["/device/param/" + i + "/value"] = paramValueHandler;
            _methods["/device/param/" + i + "/valueStr"] = paramValueStrHandler;

            _methods["/device/common/" + i + "/name"] = paramNameHandler;
            _methods["/device/common/" + i + "/value"] = paramValueHandler;
            _methods["/device/common/" + i + "/valueStr"] = paramValueStrHandler;

            _methods["/device/envelope/" + i + "/name"] = paramNameHandler;
            _methods["/device/envelope/" + i + "/value"] = paramValueHandler;
            _methods["/device/envelope/" + i + "/valueStr"] = paramValueStrHandler;

            _methods["/device/macro/" + i + "/name"] = paramNameHandler;
            _methods["/device/macro/" + i + "/value"] = paramValueHandler;
            _methods["/device/macro/" + i + "/valueStr"] = paramValueStrHandler;

            _methods["/device/modulation/" + i + "/name"] = paramNameHandler;
            _methods["/device/modulation/" + i + "/value"] = paramValueHandler;
            _methods["/device/modulation/" + i + "/valueStr"] = paramValueStrHandler;
        }
    }

    private function canSelectPreviousHandler(osc:OSCMessage):void
    {
        _model.canSelectPrevious = osc.arguments[0];
    }

    private function canSelectNextHandler(osc:OSCMessage):void
    {
        _model.canSelectNext = osc.arguments[0];
    }

    private function nameHandler(osc:OSCMessage):void
    {
        _model.name = osc.arguments[0];
    }

    private function bypassHandler(osc:OSCMessage):void
    {
        _model.bypass = osc.arguments[0];
    }

    private function expandHandler(osc:OSCMessage):void
    {
        _model.expanded = osc.arguments[0];
    }

    private function windowHandler(osc:OSCMessage):void
    {
        _model.windowVisible = osc.arguments[0];
    }

    private function macroVisibleHandler(osc:OSCMessage):void
    {
        _model.macroPageVisible = osc.arguments[0];
    }

    private function paramVisibleHandler(osc:OSCMessage):void
    {
        _model.paramPageVisible = osc.arguments[0];
    }

    private function selectedPageNameHandler(osc:OSCMessage):void
    {
        _model.selectedPageName = osc.arguments[0];
    }

    private function pageNamesHandler(osc:OSCMessage):void
    {
        var result:Array = osc.arguments[0].split(",");
        _model.pageNames = result;
    }

    private function categoryHandler(osc:OSCMessage):void
    {
        _model.category = osc.arguments[0];
    }

    private function creatorHandler(osc:OSCMessage):void
    {
        _model.creator = osc.arguments[0];
    }

    private function presetHandler(osc:OSCMessage):void
    {
        _model.preset = osc.arguments[0];
    }

    private function paramNameHandler(osc:OSCMessage):void
    {
        _model.bank.params[toIndex(osc)].setName(toType(osc), osc.arguments[0]);
    }

    private function paramValueHandler(osc:OSCMessage):void
    {
        _model.bank.params[toIndex(osc)].setValue(toType(osc), osc.arguments[0]);
    }

    private function paramValueStrHandler(osc:OSCMessage):void
    {
        _model.bank.params[toIndex(osc)].setValueString(toType(osc), osc.arguments[0]);
    }

    private static function toType(osc:OSCMessage):String
    {
        var split:Array = osc.address.split("/");
        return split[2];
    }

    private static function toIndex(osc:OSCMessage):int
    {
        var split:Array = osc.address.split("/");
        return int(split[3]) - 1;
    }

}
}
