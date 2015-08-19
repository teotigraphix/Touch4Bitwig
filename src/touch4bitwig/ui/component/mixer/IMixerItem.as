/**
 * Created by Teoti on 8/19/2015.
 */
package touch4bitwig.ui.component.mixer
{

public interface IMixerItem
{
    function get trackName():String;

    function set trackName(value:String):void;

    function get trackColor():uint;

    function set trackColor(value:uint):void;

    function get panString():String;

    function set panString(value:String):void;

    function get panValue():Number;

    function set panValue(value:Number):void;

    function get volumeValue():Number;

    function set volumeValue(value:Number):void;

    function get volumeString():String;

    function set volumeString(value:String):void;

    function get vuValue():Number;

    function set vuValue(value:Number):void;

    function get isRecArm():Boolean;

    function set isRecArm(value:Boolean):void;

    function get isSolo():Boolean;

    function set isSolo(value:Boolean):void;

    function get isMute():Boolean;

    function set isMute(value:Boolean):void;
}
}
