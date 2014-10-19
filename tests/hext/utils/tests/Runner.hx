package hext.utils.tests;

#if cpp
    import mcover.coverage.MCoverage;
    import mcover.coverage.CoverageLogger;
#end
import haxe.Timer;
import haxe.unit.TestRunner;

/**
 * TestSuite runner for classes in hext.utils package.
 */
class Runner
{
    public static function main():Void
    {
        var r = new TestRunner();

        // r.add( new hext.utils.tests.TestRetryHandler() );

        var start:Float  = Timer.stamp();
        var success:Bool = r.run();
        #if sys Sys.println("The test suite took: " + (Timer.stamp() - start) + " ms."); #end
        #if cpp MCoverage.getLogger().report(); #end

        #if sys
            Sys.exit(success ? 0 : 1);
        #end
    }
}
