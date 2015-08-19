/**
 * Created by Teoti on 4/14/2015.
 */
package touch4bitwig.ui.component.frame
{

import feathers.controls.ButtonGroup;

public class PanelToggleGroup extends ButtonGroup
{
    public function PanelToggleGroup()
    {
    }

    override protected function initialize():void
    {
        super.initialize();

        direction = ButtonGroup.DIRECTION_HORIZONTAL;
    }
}
}
