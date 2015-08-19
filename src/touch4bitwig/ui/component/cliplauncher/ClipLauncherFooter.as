/**
 * Created by Teoti on 4/6/2015.
 */
package touch4bitwig.ui.component.cliplauncher
{

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;

public class ClipLauncherFooter extends LayoutGroup
{
    public function ClipLauncherFooter()
    {
    }

    override protected function initialize():void
    {
        var hl:HorizontalLayout = new HorizontalLayout();
        hl.gap = 2;
        hl.paddingLeft = 2;
        layout = hl;
        super.initialize();

        for (var i:int = 0; i < 9; i++)
        {
            var item:ClipLauncherFooterItem = new ClipLauncherFooterItem();
            item.index = i + 1;
            item.width = 100;
            addChild(item);
        }
    }

    override protected function draw():void
    {
        super.draw();
    }
}
}
