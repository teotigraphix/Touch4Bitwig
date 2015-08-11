/**
 * Created by Teoti on 4/3/2015.
 */
package touch4bitwig.service
{

import starling.events.Event;

import touch4bitwig.model.state.GlobalModel;

public interface IOSCService
{
    function send(message:String):void;

    function sendString(message:String, value:String):void;

    function sendInt(message:String, value:int):void;

    function sendBoolean(message:String, value:Boolean):void;

    function start(model:GlobalModel):void;

    function flush():void;

    ///

    function dispatchEventWith(type:String, bubbles:Boolean = false, data:Object = null):void;

    function dispatchEvent(event:Event):void;
}
}
