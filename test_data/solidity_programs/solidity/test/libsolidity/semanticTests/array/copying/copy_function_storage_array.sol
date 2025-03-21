contract C {
    function() internal returns (uint)[] x;
    function() internal returns (uint)[] y;

    function test() public returns (uint256) {
        x = new function() internal returns (uint)[](10);
        x[9] = a;
        y = x;
        return y[9]();
    }

    function a() public returns (uint256) {
        return 7;
    }
}

// ====
// compileViaYul: also
// ----
// test() -> 7
// gas irOptimized: 134260
// gas legacy: 211296
// gas legacyOptimized: 211087
