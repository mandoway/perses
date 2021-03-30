pragma experimental SMTChecker;
pragma abicoder               v2;

contract C {
	struct T {
		uint y;
		uint[] a;
	}
	struct S {
		uint x;
		T t;
		uint[] a;
		T[] ts;
	}
	function f() public pure {
		S memory s1;
		s1.x = 2;
		assert(s1.x != 2);
		s1.t.y = 3;
		assert(s1.t.y != 3);
		s1.a = new uint[](3);
		s1.a[2] = 4;
		assert(s1.a[2] != 4);
		s1.ts = new T[](6);
		s1.ts[3].y = 5;
		assert(s1.ts[3].y != 5);
		s1.ts[4].a = new uint[](6);
		s1.ts[4].a[5] = 6;
		assert(s1.ts[4].a[5] != 6);
	}
}
// ----
// Warning 6328: (228-245): CHC: Assertion violation happens here.\nCounterexample:\n\ns1 = {x: 2, t: {y: 0, a: []}, a: [], ts: []}\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (263-282): CHC: Assertion violation happens here.\nCounterexample:\n\ns1 = {x: 2, t: {y: 3, a: []}, a: [], ts: []}\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (325-345): CHC: Assertion violation happens here.\nCounterexample:\n\ns1 = {x: 2, t: {y: 3, a: []}, a: [0, 0, 4], ts: []}\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (389-412): CHC: Assertion violation happens here.\nCounterexample:\n\ns1 = {x: 2, t: {y: 3, a: []}, a: [0, 0, 4], ts: [{y: 0, a: []}, {y: 0, a: []}, {y: 0, a: []}, {y: 5, a: []}, {y: 0, a: []}, {y: 0, a: []}]}\n\nTransaction trace:\nC.constructor()\nC.f()
// Warning 6328: (467-493): CHC: Assertion violation happens here.\nCounterexample:\n\ns1 = {x: 2, t: {y: 3, a: []}, a: [0, 0, 4], ts: [{y: 0, a: []}, {y: 0, a: []}, {y: 0, a: []}, {y: 5, a: []}, {y: 0, a: [0, 0, 0, 0, 0, 6]}, {y: 0, a: []}]}\n\nTransaction trace:\nC.constructor()\nC.f()
