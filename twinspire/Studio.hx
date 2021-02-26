/*

Table of Contents

  1. Local Variables
  2. Global Functions
  3. Rendering
    3.1 Main Menu

*/

package twinspire;

import twinspire.events.Event;
import twinspire.events.EventType;

import kha.graphics2.Graphics;
import kha.input.KeyCode;
import kha.math.FastVector2 in FV2;
import kha.Font;
import kha.System;
import kha.Color;

@:build(twinspire.macros.StaticBuilder.build())
class Studio
{

    //
    // 1. Local Variables
    //

    @:local
    var g2:Graphics;

    var mouseX:Int;
    var mouseY:Int;
    var mouseDown:Bool;
    var mouseReleased:Bool;
    var keysUp:Array<Bool>;
    var keysDown:Array<Bool>;

    var font:Font;

    var showingEditor:Bool;
    var currentPos:FV2;
    var currentSize:FV2;

    //
    // 2. Global Functions
    //

    @:global
    function init(font:Font)
    {
        keysUp = [ for (i in 0...255) false ];
        keysDown = [ for (i in 0...255) false ];

        Studio.font = font;

        currentPos = new FV2(5, 5);
        currentSize = new FV2(0, 0);
    }

    function handleEvent(e:Event)
    {
        if (e.type == EVENT_MOUSE_MOVE)
        {
            mouseX = e.mouseX;
            mouseY = e.mouseY;
        }
        else if (e.type == EVENT_MOUSE_DOWN)
            mouseDown = true;
        else if (e.type == EVENT_MOUSE_UP)
        {
            mouseDown = false;
            mouseReleased = true;
        }
        else if (e.type == EVENT_KEY_DOWN)
            keysDown[e.key] = true;
        else if (e.type == EVENT_KEY_UP)
        {
            keysDown[e.key] = false;
            keysUp[e.key] = true;
        }

        return showingEditor;
    }

    function render(g2:Graphics)
    {
        Studio.g2 = g2;

        if (keysDown[KeyCode.Control] && keysUp[KeyCode.E])
            showingEditor = !showingEditor;

        if (showingEditor)
        {
            currentPos = new FV2(5, 5);
            currentSize = new FV2(0, 0);

            g2.color = Color.Black;
            g2.font = font;
            g2.fontSize = 20;
            g2.drawString("Twinspire Studio (0.0.1-alpha)", 5, System.windowHeight() - g2.font.height(g2.fontSize) - 5);

            renderMainMenu();
        }

        mouseReleased = false;
        keysUp = [ for (i in 0...255) false ];
    }

    //
    // 3. Rendering
    //

    //
    // 3.1 Main Menu
    // 

    @:local
    function renderMainMenu()
    {
        if (menuButton("Scenes"))
        {

        }

        flowRight();

        if (menuButton("Settings"))
        {

        }
    }

    //
    // 4. UI
    //

    function menuButton(text:String)
    {
        g2.fontSize = 20;

        var textWidth = g2.font.width(g2.fontSize, text);
        var textHeight = g2.font.height(g2.fontSize);
        var tbPadding = 8;
        var lrPadding = 15;
        
        var buttonWidth = textWidth + (lrPadding * 2);
        var buttonHeight = textHeight + (tbPadding * 2);

        var active = isMouseOver(cast currentPos.x, cast currentPos.y, cast buttonWidth, cast buttonHeight);
        var fontColor = Color.fromFloats(.4, .4, .4);
        if (active && mouseDown)
        {
            fontColor = Color.fromFloats(.22, .22, .22);
        }
        else if (active)
        {
            fontColor = Color.fromFloats(.65, .65, .65);
        }

        g2.color = fontColor;
        g2.drawString(text, currentPos.x + lrPadding, currentPos.y + tbPadding);

        currentSize = new FV2(buttonWidth, buttonHeight);

        return (active && mouseReleased);
    }

    function flowRight(value:Float = 0.0)
    {
        currentPos.x += currentSize.x + value;
    }

    //
    // 5. Utils
    //

    function isMouseOver(x:Int, y:Int, w:Int, h:Int)
    {
        var result = (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h);
        return result;
    }

}