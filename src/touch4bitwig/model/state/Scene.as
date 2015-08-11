/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.model.state
{

import touch4bitwig.service.IOSCService;

public class Scene extends AbstractBitwigState
{
    private var _index:int;
    private var _name:String;

    public function get index():int
    {
        return _index;
    }

    public function set index(value:int):void
    {
        _index = value;
    }

    public function get name():String
    {
        return "Scene " + _index; //_name;
    }

    public function set name(value:String):void
    {
        _name = value;
    }

    public function Scene(index:int, service:IOSCService)
    {
        super(service);
        _index = index;
    }

    public function launch():void
    {
        service.send("/scene/" + index + "/launch");
    }
}
}
