package hext.utils;

import haxe.PosInfos;
import hext.utils.RetryHandlerException;

/**
 * Exception thrown by hext.utils.RetryHandler when effort() doesn't successfully
 * return before the passed limit is reached.
 */
class RetryLimitReachedException extends RetryHandlerException
{
    /**
     * @{inherit}
     */
    public function new(msg:Dynamic = "Maximum number of retries reached.", ?info:PosInfos):Void
    {
        super(msg, info);
    }
}
