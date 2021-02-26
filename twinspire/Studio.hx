/*

Table of Contents

  1. Local Variables
  2. Global Functions


*/

package twinspire;

import twinspire.events.Event;
import twinspire.events.EventType;

import kha.graphics2.Graphics;
import kha.input.KeyCode;
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
    var mouseX:Int;
    var mouseY:Int;
    var mouseDown:Bool;
    var mouseReleased:Bool;
    var keysUp:Array<Bool>;
    var keysDown:Array<Bool>;

    var font:Font;

    var showingEditor:Bool;

    //
    // 2. Global Functions
    //

    @:global
    function init(font:Font)
    {
        keysUp = [ for (i in 0...255) false ];
        keysDown = [ for (i in 0...255) false ];

        Studio.font = font;
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
        if (keysDown[KeyCode.Control] && keysUp[KeyCode.E])
            showingEditor = !showingEditor;

        if (showingEditor)
        {
            g2.color = Color.Black;
            g2.font = font;
            g2.fontSize = 20;
            g2.drawString("Twinspire Studio (0.0.1-alpha)", 5, System.windowHeight() - g2.font.height(g2.fontSize) - 5);
        }

        mouseReleased = false;
        keysUp = [ for (i in 0...255) false ];
    }

}