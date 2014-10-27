package hext.utils;

import haxe.PosInfos;
import hext.utils.RetryHandlerException;

/**
 * The RetryLimitReachedException is meant to be used in hext.utils.RetryCondition
 * implementations to signalize that no more retries should be done.
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
