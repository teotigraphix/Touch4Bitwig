/**
 * Created by Teoti on 3/10/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.LayoutGroup;
import feathers.data.ListCollection;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

import starling.events.Event;

import touch4bitwig.model.state.Scene;

public class SceneList extends LayoutGroup
{
    public static const EVENT_SCENE_TAP:String = "sceneButtonTap";

    public static const INVALIDATION_FLAG_DATA_PROVIDER:String = "dataProvider";

    private var _dataProvider:ListCollection;

    public function get dataProvider():ListCollection
    {
        return _dataProvider;
    }

    public function set dataProvider(value:ListCollection):void
    {
        _dataProvider = value;
        invalidate(INVALIDATION_FLAG_DATA_PROVIDER);
    }

    public function SceneList()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        vl.gap = 4;
        vl.paddingBottom = 4;
        vl.paddingTop = 4;

        layout = vl;

        super.initialize();

        for (var i:int = 0; i < 8; i++)
        {
            var button:SceneButton = new SceneButton();
            button.layoutData = new VerticalLayoutData(100, 100);
            button.addEventListener(Event.TRIGGERED, button_triggeredHandler);
            addChild(button);
        }
    }

    override protected function draw():void
    {
        super.draw();

        if (isInvalid(INVALIDATION_FLAG_DATA_PROVIDER))
        {
            commitDataProvider();
        }
    }

    public function sceneStateChange(scene:Scene):void
    {
        var button:SceneButton = getButton(scene);
        // XXX when you only create scenes that have clips, remove this
        // Right now all 64 scenes are being sent in here.
        if (button != null)
            button.stateChange();
    }

    public function advanceTime():void
    {
        const len:int = numChildren;
        for (var i:int = 0; i < len; i++)
        {
            SceneButton(getChildAt(i)).stateChange();
        }
    }

    private function getButton(scene:Scene):SceneButton
    {
        for (var i:int = 0; i < 8; i++)
        {
            var button:SceneButton = SceneButton(getChildAt(i));
            if (button.scene == scene)
                return button;
        }
        return null;
    }

    private function commitDataProvider():void
    {
        if (_dataProvider == null)
            return;

        for (var i:int = 0; i < 8; i++)
        {
            var button:SceneButton = getChildAt(i) as SceneButton;
            button.scene = _dataProvider.getItemAt(i) as Scene;
        }
    }

    private function button_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_SCENE_TAP, true, SceneButton(event.currentTarget).scene);
    }
}
}
