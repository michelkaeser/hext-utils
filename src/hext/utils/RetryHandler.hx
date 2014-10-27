package hext.utils;

import haxe.Constraints.Function;
import hext.threading.Atomic;
import hext.utils.RetryConditionFailedException;
import hext.utils.RetryHandlerAbortedException;

/**
 * Generic wrapper that can be placed around functions throwing Exceptions to
 * auto-retry several times before giving up.
 *
 * Use cases:
 *   - Trying to communicate with an external server. It might have problems right now,
 *     but before notifiying the user about that, we just try some more times as the failure
 *     might be temporary.
 *
 * @link https://github.com/kimoto/retry-handler
 *
 * @generic T the functions return type
 */
class RetryHandler<T>
{
    /**
     * Stores if 'effort' should stop after the current retry.
     *
     * @var hext.threading.Atomic<Bool>
     */
    private var aborted:Atomic<Bool>;

    /**
     * Stores the arguments to pass when calling the function.
     *
     * @var Array<Dynamic>
     */
    private var args:Array<Dynamic>;

    /**
     * Stores the function to be called.
     *
     * @var haxe.Constraints.Function
     */
    private var fn:Function;


    /**
     * Constructor to initialize a new RetryHandler.
     *
     * @param haxe.Constraints.Function fn   the function to call
     * @param Null<Array<Dynamic>>      args the args with which the fn should be called
     */
    public function new(fn:Function, ?args:Array<Dynamic>):Void
    {
        this.aborted = false;
        this.fn      = fn;
        if (args == null) {
            args = new Array<Dynamic>();
        }
        this.args = args;
    }

    /**
     * Tells the 'effort' function to abort after the current retry.
     */
    public function abort():Void
    {
        this.aborted.val = true;
    }

    /**
     * Calls the wrapped function until it either returns successfully or
     * the handler is aborted or interrupted.
     *
     * Note: The 'timeout' argument is ignored on non-Sys targets.
     *
     * @param hext.utils.RetryCondition condition the condition function to call after
     *                                  a failure
     * @param Float                     timeout the time to wait between two tries
     *
     * @return T the function's return value
     */
    public function effort(condition:RetryCondition, timeout:Float = 0.0):T
    {
        this.aborted.val = false;
        var i:Int        = 0;
        var ex:Dynamic   = null;
        do {
            #if sys
                if (i != 0 && timeout > 0.0) {
                    Sys.sleep(timeout);
                }
            #end
            try {
                return Reflect.callMethod(this, this.fn, this.args);
            } catch (err:Dynamic) {
                ex = err;
                ++i;
            }
        } while (!this.aborted.val && condition(i, ex) /* might throw exceptions */);

        if (this.aborted.val) {
            throw new RetryHandlerAbortedException();
        } else {
            throw new RetryConditionFailedException();
        }
    }
}
