/**
 * Created by Teoti on 4/5/2015.
 */
package touch4bitwig.ui.component.main
{

import com.teotigraphix.ui.component.UIToggleButton;
import com.teotigraphix.ui.theme.AssetMap;

import feathers.controls.Button;
import feathers.controls.Header;

import flash.utils.Dictionary;

import starling.display.DisplayObject;
import starling.events.Event;

import touch4bitwig.model.support.UIModel;

public class MainHeader_ extends Header
{
    public static const EVENT_ACTIVE_ENGINE_CHANGE:String = "activeEngineChange";
    public static const EVENT_NAVIGATION_CHANGE:String = "navigationButtonChange";

    protected var _activeEngineButton:UIToggleButton;

    protected var _clipsButton:Button;
    protected var _deviceButton:Button;
    protected var _panelsButton:Button;
    protected var _mixerButton:Button;

    protected var _indexMap:Dictionary = new Dictionary(true);

    public function MainHeader_()
    {
        super();
    }

    override protected function initialize():void
    {
        super.initialize();

        title = "Touch 4 Bitwig";

        _activeEngineButton = new UIToggleButton();
        _activeEngineButton.defaultIcon = AssetMap.createImage("bitwig-icon-skin");
        _activeEngineButton.defaultSelectedIcon = AssetMap.createImage("bitwig-icon-selected-skin");
        _activeEngineButton.addEventListener(Event.CHANGE, settingsButton_changeHandler);

        _clipsButton = new Button();
        _clipsButton.label = "Clips";
        _clipsButton.addEventListener(Event.TRIGGERED, navigationButton_triggeredHandler);

        _deviceButton = new Button();
        _deviceButton.label = "Device";
        _deviceButton.addEventListener(Event.TRIGGERED, navigationButton_triggeredHandler);

        _panelsButton = new Button();
        _panelsButton.label = "Panels";
        _panelsButton.addEventListener(Event.TRIGGERED, navigationButton_triggeredHandler);

        _mixerButton = new Button();
        _mixerButton.label = "Mixer";
        _mixerButton.addEventListener(Event.TRIGGERED, navigationButton_triggeredHandler);

        _indexMap[_clipsButton] = UIModel.INDEX_CLIPS;
        _indexMap[_deviceButton] = UIModel.INDEX_TRANSPORT;
        _indexMap[_panelsButton] = UIModel.INDEX_PANELS;
        _indexMap[_mixerButton] = UIModel.INDEX_MIXER;

        addLeftItems();
        addRightItems();
    }

    override protected function draw():void
    {
        super.draw();
    }

    public function setActiveEngine(value:Boolean):void
    {
        _activeEngineButton.setIsSelected(value);
    }

    protected function addLeftItems():void
    {
        leftItems = new <DisplayObject>[_activeEngineButton];
    }

    protected function addRightItems():void
    {
        rightItems = new <DisplayObject>[_clipsButton, _deviceButton, _panelsButton, _mixerButton];
    }

    private function getIndex(event:Event):int
    {
        if (_indexMap[event.currentTarget] == null)
            return -1;
        return int(_indexMap[event.currentTarget]);
    }

    private function navigationButton_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_NAVIGATION_CHANGE, false, getIndex(event));
    }

    private function settingsButton_changeHandler(event:Event):void
    {
        dispatchEventWith(EVENT_ACTIVE_ENGINE_CHANGE, false, _activeEngineButton.isSelected);
    }
}
}
