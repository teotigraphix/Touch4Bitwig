/**
 * Created by Teoti on 4/13/2015.
 */
package touch4bitwig.service.support.osc.listeners
{

import com.teotigraphix.frameworks.osc.OSCMessage;

import touch4bitwig.model.support.DeviceModel;
import touch4bitwig.service.support.OSCService;

public class DeviceListener
{
    private var _methods:Array = [];

    private var _service:OSCService;
    private var _model:DeviceModel;

    public function DeviceListener(service:OSCService, model:DeviceModel)
    {
        _service = service;
        _model = model;

        config();
    }

    public final function isHandled(osc:OSCMessage):Boolean
    {
        return _methods[osc.address] != null;
    }

    public final function handle(osc:OSCMessage):void
    {
        _methods[osc.address](osc);
    }

    private function config():void
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
            _methods["/device/param/" + i + "/values"] = paramValuesHandler;
            _methods["/device/common/" + i + "/values"] = paramValuesHandler;
            _methods["/device/envelope/" + i + "/values"] = paramValuesHandler;
            _methods["/device/macro/" + i + "/values"] = paramValuesHandler;
            _methods["/device/modulation/" + i + "/values"] = paramValuesHandler;

            //_methods["/device/param/" + i + "/name"] = paramNameHandler;
            //_methods["/device/param/" + i + "/value"] = paramValueHandler;
            //_methods["/device/param/" + i + "/valueStr"] = paramValueStrHandler;

            //_methods["/device/common/" + i + "/name"] = paramNameHandler;
            //_methods["/device/common/" + i + "/value"] = paramValueHandler;
            //_methods["/device/common/" + i + "/valueStr"] = paramValueStrHandler;
            //
            //_methods["/device/envelope/" + i + "/name"] = paramNameHandler;
            //_methods["/device/envelope/" + i + "/value"] = paramValueHandler;
            //_methods["/device/envelope/" + i + "/valueStr"] = paramValueStrHandler;
            //
            //_methods["/device/macro/" + i + "/name"] = paramNameHandler;
            //_methods["/device/macro/" + i + "/value"] = paramValueHandler;
            //_methods["/device/macro/" + i + "/valueStr"] = paramValueStrHandler;
            //
            //_methods["/device/modulation/" + i + "/name"] = paramNameHandler;
            //_methods["/device/modulation/" + i + "/value"] = paramValueHandler;
            //_methods["/device/modulation/" + i + "/valueStr"] = paramValueStrHandler;
        }
    }

    private function canSelectPreviousHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.canSelectPrevious = osc.arguments[0];
    }

    private function canSelectNextHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.canSelectNext = osc.arguments[0];
    }

    private function nameHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.name = osc.arguments[0];
    }

    private function bypassHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.bypass = osc.arguments[0];
    }

    private function expandHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.expanded = osc.arguments[0];
    }

    private function windowHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.windowVisible = osc.arguments[0];
    }

    private function macroVisibleHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.macroPageVisible = osc.arguments[0];
    }

    private function paramVisibleHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.paramPageVisible = osc.arguments[0];
    }

    private function selectedPageNameHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.selectedPageName = osc.arguments[0];
    }

    private function pageNamesHandler(osc:OSCMessage):void
    {
        var result:Array = osc.arguments[0].split(",");
        _model.cursorDevice.pageNames = result;
    }

    private function categoryHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.category = osc.arguments[0];
    }

    private function creatorHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.creator = osc.arguments[0];
    }

    private function presetHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.preset = osc.arguments[0];
    }

    private function paramValuesHandler(osc:OSCMessage):void
    {
        var index:int = toIndex(osc);
        var type:String = toType(osc);
        var valuesSerialized:String = osc.arguments[0];
        var split:Array = valuesSerialized.split("|");

        _model.cursorDevice.bank.params[index].setName(type, split[0]);
        _model.cursorDevice.bank.params[index].setValueString(type, split[1]);
        _model.cursorDevice.bank.params[index].setValue(type, split[2]);
    }

    private function paramNameHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.bank.params[toIndex(osc)].setName(toType(osc), osc.arguments[0]);
    }

    private function paramValueHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.bank.params[toIndex(osc)].setValue(toType(osc), osc.arguments[0]);
    }

    private function paramValueStrHandler(osc:OSCMessage):void
    {
        _model.cursorDevice.bank.params[toIndex(osc)].setValueString(toType(osc), osc.arguments[0]);
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
