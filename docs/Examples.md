# Examples

> Various ready-to-use code examples showing how to use the `hext-utils`
> library.

## RetryHandler

```haxe
import hext.utils.RetryHandler;
import hext.utils.RetryHandlerException;

class Debug
{
    public static function main():Void
    {
        var fn = function(name:String):String {
            if (name != "Hans") {
                throw "Invalid name provided";
            }

            return "Hello " + name;
        };
        var args:Array<Dynamic> = ["Peter"];

        var rh = new RetryHandler<String>(fn, args);
        try {
            var ret:String = rh.effort(function(retry:Int, ex:Dynamic):Bool {
                // we get here because of the "Invalid name provided" exception
                // for our next try we change the argument's value and will succeed
                args[0] = "Hans";

                return true; // = try again
            });
            trace(ret); // "Hello Hans"
        } catch (ex:RetryHandlerException) {
            trace(ex); // not reached
        }
    }
}
```
