/**
 * Created by Teoti on 3/11/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.LayoutGroup;
import feathers.layout.AnchorLayout;
import feathers.layout.AnchorLayoutData;

public class GridStack extends LayoutGroup
{
    private var _clipLauncher:ClipLauncher;
    //private var _sceneLauncher:SceneLauncher;

    private var _selectedIndex:int = -1;

    public function get selectedIndex():int
    {
        return _selectedIndex;
    }

    public function set selectedIndex(value:int):void
    {
        _selectedIndex = value;

        if (_selectedIndex == 0)
        {
            _clipLauncher.visible = false;
            //_sceneLauncher.visible = true;
        }
        else if (_selectedIndex == 1)
        {
            _clipLauncher.visible = true;
            //_sceneLauncher.visible = false;
        }
    }

    public function get clipLauncher():ClipLauncher
    {
        return _clipLauncher;
    }

    //public function get sceneLauncher():SceneLauncher
    //{
    //    return _sceneLauncher;
    //}

    public function GridStack()
    {
        super();
    }

    override protected function initialize():void
    {
        var al:AnchorLayout = new AnchorLayout();
        layout = al;

        super.initialize();

        _clipLauncher = new ClipLauncher();
        _clipLauncher.layoutData = new AnchorLayoutData(0, 0, 0, 0);
        addChild(_clipLauncher);

        //_sceneLauncher = new SceneLauncher();
        //_sceneLauncher.layoutData = new AnchorLayoutData(0, 0, 0, 0);
        //addChild(_sceneLauncher);

        //_clipLauncher.visible = false;
        //_sceneLauncher.visible = false;
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
