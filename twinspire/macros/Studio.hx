package twinspire.macros;
#if macro

import haxe.macro.Context;
import haxe.macro.Expr;

class Studio
{

    public static function build():Array<Field>
    {
        var fields = Context.getBuildFields();

        var initDone = false;
        var eventsDone = false;
        var renderDone = false;

        for (f in fields)
        {
            var isInitFunction = false;
            var isEventsFunction = false;
            var isRenderFunction = false;

            if (f.meta != null)
            {
                for (m in f.meta)
                {
                    if (m.name == ":editorInit")
                    {
                        isInitFunction = true;
                        break;
                    }
                    else if (m.name == ":editorEvents")
                    {
                        isEventsFunction = true;
                        break;
                    }
                    else if (m.name == ":editorRender")
                    {
                        isRenderFunction = true;
                        break;
                    }
                }
            }

            if (isInitFunction || isEventsFunction || isRenderFunction)
            {
                switch (f.kind)
                {
                    case FFun(f):
                    {
                        if (isInitFunction)
                        {
                            var temp = f.expr;
                            
                        }
                    }
                    default:
                }
            }
        }

        return fields;
    }

    static function generateInitCode()
    {
        
    }

}
#end