////////////////////////////////////////////////////////////////////////////////
// Copyright 2015 Michael Schmalle - Teoti Graphix, LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License
//
// Author: Michael Schmalle, Principal Architect
// mschmalle at teotigraphix dot com
////////////////////////////////////////////////////////////////////////////////

package touch4bitwig.ui.component
{

import feathers.controls.LayoutGroup;
import feathers.layout.HorizontalLayout;
import feathers.layout.HorizontalLayoutData;
import feathers.layout.VerticalLayout;
import feathers.layout.VerticalLayoutData;

public class HGroup extends LayoutGroup
{
    private var _verticalAlign:String = "top";
    private var _horizontalAlign:String = "left";

    private var _percentWidth:Number = NaN;
    private var _percentHeight:Number = NaN;

    private var _padding:Number = NaN;
    private var _paddingTop:Number = 0;
    private var _paddingRight:Number = 0;
    private var _paddingBottom:Number = 0;
    private var _paddingLeft:Number = 0;

    private var _gap:Number = 0;

    [Inspectable(type="String", enumeration="top,middle,bottom,justify")]
    public function get verticalAlign():String
    {
        return _verticalAlign;
    }

    public function set verticalAlign(value:String):void
    {
        _verticalAlign = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    [Inspectable(type="String", enumeration="left,center,right")]
    public function get horizontalAlign():String
    {
        return _horizontalAlign;
    }

    public function set horizontalAlign(value:String):void
    {
        _horizontalAlign = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get percentWidth():Number
    {
        return _percentWidth;
    }

    public function set percentWidth(value:Number):void
    {
        _percentWidth = value;
        invalidate(INVALIDATION_FLAG_SIZE);
    }

    public function get percentHeight():Number
    {
        return _percentHeight;
    }

    public function set percentHeight(value:Number):void
    {
        _percentHeight = value;
        invalidate(INVALIDATION_FLAG_SIZE);
    }

    public function get padding():Number
    {
        return _padding;
    }

    public function set padding(value:Number):void
    {
        _padding = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get paddingTop():Number
    {
        return _paddingTop;
    }

    public function set paddingTop(value:Number):void
    {
        _paddingTop = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get paddingRight():Number
    {
        return _paddingRight;
    }

    public function set paddingRight(value:Number):void
    {
        _paddingRight = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get paddingBottom():Number
    {
        return _paddingBottom;
    }

    public function set paddingBottom(value:Number):void
    {
        _paddingBottom = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get paddingLeft():Number
    {
        return _paddingLeft;
    }

    public function set paddingLeft(value:Number):void
    {
        _paddingLeft = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function get gap():Number
    {
        return _gap;
    }

    public function set gap(value:Number):void
    {
        _gap = value;
        invalidate(INVALIDATION_FLAG_LAYOUT);
    }

    public function HGroup()
    {
        layout = new HorizontalLayout();
    }

    override protected function initialize():void
    {
        super.initialize();
    }

    override protected function draw():void
    {
        super.draw();

        var l:HorizontalLayout = HorizontalLayout(layout);

        if (isInvalid(INVALIDATION_FLAG_SIZE))
        {
            if (!isNaN(_percentWidth) || !isNaN(_percentHeight))
            {
                var lg:LayoutGroup = parent as LayoutGroup;
                if (lg != null)
                {
                    if (lg.layout is VerticalLayout)
                    {
                        layoutData = new VerticalLayoutData(_percentWidth, _percentHeight);
                    }
                    else if (lg.layout is HorizontalLayout)
                    {
                        layoutData = new HorizontalLayoutData(_percentWidth, _percentHeight);
                    }
                    else
                    {
                        // something else, percentages don't apply
                    }
                }
            }
        }

        if (isInvalid(INVALIDATION_FLAG_LAYOUT))
        {
            l.verticalAlign = _verticalAlign;
            l.horizontalAlign = _horizontalAlign;

            if (!isNaN(_padding))
            {
                l.padding = _padding;
            }
            else
            {
                l.paddingTop = _paddingTop;
                l.paddingRight = _paddingRight;
                l.paddingBottom = _paddingBottom;
                l.paddingLeft = _paddingLeft;
            }

            l.gap = _gap;
        }
    }
}
}
