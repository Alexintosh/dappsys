import 'dappsys/test/test.sol';
import 'dappsys/sig_helper.sol';

contract SigHelperTest is Test {
    SigHelper s;
    function setUp() {
        s = new SigHelper();
    }
    function testCheckSigs() {
        s.assets("TEST");
        assertEq4(0x73b4fbd7, s.last_sig(), "wrong sig!!");
    }
    function testGetSig() {
        log_bytes4( s.get_my_sig() );
        log_bytes4( s.last_sig() );
    }
    function testFallbackStaticSig() {
        s.call(0x1);
        assertEq4( 0x0, s.last_sig(), "fallback sig != 0x0" );
    }
}
