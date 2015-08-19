/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.LayoutGroup;
import feathers.data.ListCollection;
import feathers.layout.TiledRowsLayout;

import flash.utils.Dictionary;

import starling.events.Event;

import touch4bitwig.model.state.Clip;

public class ClipLauncherGrid extends LayoutGroup
{
    public static const EVENT_CLIP_TAP:String = "clipButtonTap";

    public static const INVALIDATION_FLAG_DATA_PROVIDER:String = "dataProvider";

    private var _dataProvider:ListCollection;

    private var _map:Dictionary = new Dictionary(); // <scene, [track]>

    public function get dataProvider():ListCollection
    {
        return _dataProvider;
    }

    public function set dataProvider(value:ListCollection):void
    {
        _dataProvider = value;
        invalidate(INVALIDATION_FLAG_DATA_PROVIDER);
    }

    public function ClipLauncherGrid()
    {
        super();
    }

    override protected function initialize():void
    {
        var layout:TiledRowsLayout = new TiledRowsLayout();
        layout.verticalAlign = TiledRowsLayout.TILE_VERTICAL_ALIGN_JUSTIFY;
        layout.horizontalAlign = TiledRowsLayout.TILE_HORIZONTAL_ALIGN_JUSTIFY;
        layout.padding = 2;
        layout.requestedRowCount = 8;
        layout.requestedColumnCount = 8;
        layout.gap = 2;
        layout.useSquareTiles = false;
        this.layout = layout;

        super.initialize();

        var scene:int;
        for (scene = 0; scene < 8; scene++)
        {
            _map[scene] = new Vector.<ClipButton>(8, true);
        }

        var index:int = 0;
        for (scene = 0; scene < 8; scene++)
        {
            for (var track:int = 0; track < 8; track++)
            {
                var clipButton:ClipButton = new ClipButton();
                clipButton.addEventListener(Event.TRIGGERED, button_triggeredHandler);
                clipButton.setSize(100, 40);
                addChild(clipButton);

                _map[scene][track] = clipButton;

                index++;
            }
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

    public function clipStateChange(clip:Clip):void
    {
        var index:int = toClipIndex(clip);
        // XXX Have to calc the local scene index bases on the pattern page index
        //var button:ClipButton = _map[clip.scene.index][index];
        //button.stateChange();
    }

    public function advanceTime():void
    {
        const len:int = numChildren;
        for (var i:int = 0; i < len; i++)
        {
            ClipButton(getChildAt(i)).invalidateClipState();
        }
    }

    private function commitDataProvider():void
    {
        if (_dataProvider == null)
            return;

        var index:int = 0;
        for (var scene:int = 0; scene < 8; scene++)
        {
            for (var track:int = 0; track < 8; track++)
            {
                _map[scene][track].clip = _dataProvider.getItemAt(index) as Clip;
                index++;
            }
        }
    }

    private static function toClipIndex(clip:Clip):int
    {
        const index:int = clip.index;
        if (index < 8)
            return index;
        return index - 6; // trackpageindex
    }

    private function button_triggeredHandler(event:Event):void
    {
        dispatchEventWith(EVENT_CLIP_TAP, true, ClipButton(event.currentTarget).clip);
    }
}
}
