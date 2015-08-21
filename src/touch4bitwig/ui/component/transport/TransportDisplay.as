/**
 * Created by Teoti on 8/21/2015.
 */
package touch4bitwig.ui.component.transport
{

import feathers.core.FeathersControl;

public class TransportDisplay extends FeathersControl
{
    private var _skin:TransportDisplaySkin;

    public function setTempo(value:String):void
    {
        _skin.setTempo(value);
    }

    public function setTimeSignature(value:String):void
    {
        _skin.setTimeSignature(value);
    }

    public function setPosition(value:String):void
    {
        _skin.setPosition(value);
    }

    public function setTime(value:String):void
    {
        _skin.setTime(value);
    }

    public function TransportDisplay()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        _skin = new TransportDisplaySkin();
        _skin.owner = this;
        addChild(_skin);
    }

    override protected function draw():void
    {
        super.draw();

        _skin.move(0, 0);
        _skin.setSize(actualWidth, actualHeight);
    }
}
}
