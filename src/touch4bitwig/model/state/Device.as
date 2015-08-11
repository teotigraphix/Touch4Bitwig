/**
 * Created by Teoti on 4/15/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.event.DeviceModelEventType;
import touch4bitwig.service.IOSCService;

public class Device extends AbstractBitwigState
{
    private var _id:String;
    private var _bank:DeviceBank;

    private var _canSelectPrevious:Boolean;
    private var _canSelectNext:Boolean;
    private var _selectedPageName:String;
    private var _pageNames:Array = [];

    private var _name:String;
    private var _bypass:Boolean;
    private var _expanded:Boolean;
    private var _windowVisible:Boolean;
    private var _macroPageVisible:Boolean;
    private var _paramPageVisible:Boolean;
    private var _category:String;
    private var _creator:String;
    private var _preset:String;

    public function get bank():DeviceBank
    {
        return _bank;
    }

    public function get exists():Boolean
    {
        return _name != null && _name != "None";
    }

    public function get canSelectPrevious():Boolean
    {
        return _canSelectPrevious;
    }

    public function set canSelectPrevious(value:Boolean):void
    {
        if (isSame(_canSelectPrevious, value))
            return;
        _canSelectPrevious = value;
        dispatchValue(DeviceModelEventType.CAN_SELECT_PREVIOUS, _canSelectPrevious);
    }

    public function get canSelectNext():Boolean
    {
        return _canSelectNext;
    }

    public function set canSelectNext(value:Boolean):void
    {
        if (isSame(_canSelectNext, value))
            return;
        _canSelectNext = value;
        dispatchValue(DeviceModelEventType.CAN_SELECT_NEXT, _canSelectNext);
    }

    public function get selectedPageName():String
    {
        return _selectedPageName;
    }

    public function set selectedPageName(value:String):void
    {
        if (isSame(_selectedPageName, value))
            return;
        _selectedPageName = value;
        dispatchValue(DeviceModelEventType.SELECTED_PAGE_NAME_CHANGE, _selectedPageName);
    }

    public function get pageNames():Array
    {
        return _pageNames;
    }

    public function set pageNames(value:Array):void
    {
        if (isSame(_pageNames, value))
            return;
        _pageNames = value;
        dispatchValue(DeviceModelEventType.PARAM_PAGE_NAMES_CHANGE, _pageNames);
    }

    public function get name():String
    {
        return _name;
    }

    public function set name(value:String):void
    {
        if (isSame(_name, value))
            return;
        _name = value;
        dispatchValue(DeviceModelEventType.NAME_CHANGE, _name);
    }

    public function get bypass():Boolean
    {
        return _bypass;
    }

    public function set bypass(value:Boolean):void
    {
        if (isSame(_bypass, value))
            return;
        _bypass = value;
        dispatchValue(DeviceModelEventType.BYPASS_CHANGE, _bypass);
    }

    public function get expanded():Boolean
    {
        return _expanded;
    }

    public function set expanded(value:Boolean):void
    {
        if (isSame(_expanded, value))
            return;
        _expanded = value;
        dispatchValue(DeviceModelEventType.EXPAND_CHANGE, _expanded);
    }

    public function get windowVisible():Boolean
    {
        return _windowVisible;
    }

    public function set windowVisible(value:Boolean):void
    {
        if (isSame(_windowVisible, value))
            return;
        _windowVisible = value;
        dispatchValue(DeviceModelEventType.WINDOW_CHANGE, _windowVisible);
    }

    public function get macroPageVisible():Boolean
    {
        return _macroPageVisible;
    }

    public function set macroPageVisible(value:Boolean):void
    {
        if (isSame(_macroPageVisible, value))
            return;
        _macroPageVisible = value;
        dispatchValue(DeviceModelEventType.MACRO_PAGE_CHANGE, _macroPageVisible);
    }

    public function get paramPageVisible():Boolean
    {
        return _paramPageVisible;
    }

    public function set paramPageVisible(value:Boolean):void
    {
        if (isSame(_paramPageVisible, value))
            return;
        _paramPageVisible = value;
        dispatchValue(DeviceModelEventType.PARAM_PAGE_CHANGE, _paramPageVisible);
    }

    public function get category():String
    {
        return _category;
    }

    public function set category(value:String):void
    {
        if (isSame(_category, value))
            return;
        _category = value;
        dispatchValue(DeviceModelEventType.CATEGORY_CHANGE, _category);
    }

    public function get creator():String
    {
        return _creator;
    }

    public function set creator(value:String):void
    {
        if (isSame(_creator, value))
            return;
        _creator = value;
        dispatchValue(DeviceModelEventType.CREATOR_CHANGE, _creator);
    }

    public function get preset():String
    {
        return _preset;
    }

    public function set preset(value:String):void
    {
        if (isSame(_preset, value))
            return;
        _preset = value;
        dispatchValue(DeviceModelEventType.PRESET_CHANGE, _name);
    }

    public function Device(service:IOSCService, id:String)
    {
        super(service);
        _id = id;
        _bank = new DeviceBank(service);
    }

    public function previous():void
    {
        service.send("/" + _id + "/-");
    }

    public function next():void
    {
        service.send("/" + _id + "/+");
    }

    public function toggleBypass():void
    {
        service.send("/" + _id + "/bypass");
    }

    public function toggleExpand():void
    {
        service.send("/" + _id + "/expand");
    }

    public function toggleWindow():void
    {
        service.send("/" + _id + "/window");
    }

    public function toggleMacroVisible():void
    {
        service.send("/" + _id + "/macroVisible");
    }

    public function toggleParamVisible():void
    {
        service.send("/" + _id + "/paramVisible");
    }

}
}
