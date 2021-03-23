pragma experimental SMTChecker;

contract C
{
	uint[] array;
	constructor() {
		q(); q();
	}
	function q() public {
		array.push();
	}
	function f(uint x, uint p) public {
		require(p < array.length);
		require(x < 100);
		array[p] = 100;
		array[p] += array[p] + x;
		assert(array[p] < 300);
		assert(array[p] < 110);
	}
}
// ----
// Warning 6328: (295-317): CHC: Assertion violation happens here.\nCounterexample:\narray = [0, 200]\nx = 0\np = 1\n\nTransaction trace:\nC.constructor()\nState: array = [0, 0]\nC.f(0, 1)
