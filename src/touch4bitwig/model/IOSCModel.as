package touch4bitwig.model
{

import touch4bitwig.app.config.ApplicationConfiguration;
import touch4bitwig.model.state.Application;
import touch4bitwig.model.state.Arranger;
import touch4bitwig.model.state.Device;
import touch4bitwig.model.state.Mixer;
import touch4bitwig.model.state.Panes;
import touch4bitwig.model.state.TrackBank;
import touch4bitwig.model.state.Transport;
import touch4bitwig.model.support.ConnectionInstance;

public interface IOSCModel
{
    function get connection():ConnectionInstance;

    function get application():Application;

    function get trackBank():TrackBank;

    function get transport():Transport;

    function get device():Device;

    function get cursorDevice():Device;

    function get primaryDevice():Device;

    function get deviceMode():String;

    function set deviceMode(value:String):void;

    function get panes():Panes;

    function get arranger():Arranger;

    function get mixer():Mixer;

    function get configuration():ApplicationConfiguration;

    function setup():void;

    //
    function getAutomationWriteModeValue(index:int):String;

}
}
