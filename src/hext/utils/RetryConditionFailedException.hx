package hext.utils;

import haxe.PosInfos;
import hext.utils.RetryHandlerException;

/**
 * The RetryConditionFailedException is thrown by the RetryHandler as
 * soon as the condition returns false (which means, that we should no longer
 * try to call the initial function and abort).
 *
 * Note: If you wanna give up because the max. number of retries is exceeded,
 *       use hext.utils.RetryLimitReachedException instead.
 */
class RetryConditionFailedException extends RetryHandlerException
{
    /**
     * @{inherit}
     */
    public function new(msg:Dynamic = "Retry condition failed.", ?info:PosInfos):Void
    {
        super(msg, info);
    }
}
