/**
 * Created by Teoti on 4/4/2015.
 */
package touch4bitwig.ui.component.screen
{

import com.teotigraphix.bitwig.ui.component.screen.ClipScreenFooter;
import com.teotigraphix.bitwig.ui.component.cliplauncher.GridStack;

import feathers.controls.Header;
import feathers.controls.Screen;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

public class ClipsScreen extends Screen
{
    private var _gridStack:GridStack;
    private var _clipLauncherFooter:ClipScreenFooter;

    public function ClipsScreen()
    {
    }

    override protected function initialize():void
    {
        var vl:VerticalLayout = new VerticalLayout();
        layout = vl;

        super.initialize();

        var header:Header = new ClipsHeader();
        header.layoutData = new VerticalLayoutData(100);
        addChild(header);

        //var spacer:LayoutGroup = new LayoutGroup();
        //spacer.layoutData = new VerticalLayoutData(100, 100);
        //addChild(spacer);

        _gridStack = new GridStack();
        _gridStack.layoutData = new VerticalLayoutData(100, 100);
        addChild(_gridStack);

        _clipLauncherFooter = new ClipScreenFooter();
        _clipLauncherFooter.layoutData = new VerticalLayoutData(100);
        addChild(_clipLauncherFooter);
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
