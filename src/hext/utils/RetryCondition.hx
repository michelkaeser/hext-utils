package hext.utils;

/**
 * The RetryCondition typedef is used as the parameter type
 * in hext.utils.RetryHandler to define the function that acts
 * as the condition to decide if another try should be started or not.
 *
 * Returning true means that another try should be started.
 * Depending on the use case, a hext.utils.RetryLimitReachedException
 * should be thrown.
 * If false is returned, the RetryHandler will throw a
 * hext.utils.RetryConditionFailedException to indicate the failure.
 *
 * Use cases:
 *   - When ever a RetryHandler is used. One can for example change an argument
 *     after failure X (e.g. switch to a different logging backend).
 *   - See docs/Examples.md
 *
 * @param Int           the number of already done retries
 * @param Null<Dynamic> the thrown exception if any
 *
 * @return Bool either to try again or not
 */
typedef RetryCondition = Int->Null<Dynamic>->Bool;
