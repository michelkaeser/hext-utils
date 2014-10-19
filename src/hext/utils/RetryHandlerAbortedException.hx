package hext.utils;

import haxe.PosInfos;
import hext.utils.RetryHandlerException;

/**
 * Exception thrown by hext.utils.RetryHandler when effort() doesn't successfully
 * return before the abort() method is called.
 */
class RetryHandlerAbortedException extends RetryHandlerException
{
    /**
     * @{inherit}
     */
    public function new(msg:Dynamic = "Retry handler has been aborted.", ?info:PosInfos):Void
    {
        super(msg, info);
    }
}
