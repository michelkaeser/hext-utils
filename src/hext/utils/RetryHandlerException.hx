package hext.utils;

import haxe.PosInfos;
import hext.Exception;

/**
 * Abstract base exception for the hext.utils.RetryHandler class.
 *
 * @abstract
 */
class RetryHandlerException extends Exception
{
    /**
     * @{inherit}
     */
    private function new(msg:Dynamic = "Uncaught RetryHandler exception.", ?info:PosInfos):Void
    {
        super(msg, info);
    }
}
