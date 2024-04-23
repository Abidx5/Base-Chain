// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;

contract ErrorTriageExercise {
    uint[] arr;

    /**
     * Finds the difference between each uint with its neighbor (a to b, b to c, etc.)
     * and returns a uint array with the absolute integer difference of each pairing.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (uint[] memory) {
        uint[] memory results = new uint[](3);

        results[0] = absDiff(_a, _b);
        results[1] = absDiff(_b, _c);
        results[2] = absDiff(_c, _d);

        return results;
    }
    
    /**
     * Internal function to calculate the absolute difference between two numbers.
     */
    function absDiff(uint _x, uint _y) internal pure returns (uint) {
        return (_x > _y) ? (_x - _y) : (_y - _x);
    }

    /**
     * Changes the _base by the value of _modifier.  Base is always >= 1000.  Modifiers can be
     * between positive and negative 100;
     */
    function applyModifier(
        uint _base,
        int _modifier
    ) public pure returns (uint) {
        require(_base >= 1000, "Base must be >= 1000");

        if (_modifier >= 0) {
            require(_base + uint(_modifier) >= _base, "Addition would result in overflow");
        } else {
            require(_base >= uint(-_modifier), "Subtraction would result in underflow");
        }

        return uint(int(_base) + _modifier);
    }

    /**
     * Pop the last element from the supplied array, and return the popped
     * value (unlike the built-in function)
     */
    function popWithReturn() public returns (uint) {
        require(arr.length > 0, "Array is empty");

        uint index = arr.length - 1;
        uint poppedValue = arr[index];
        arr.pop(); // Use pop() function to remove the last element
        return poppedValue;
    }

    // The utility functions below are working as expected
    function addToArr(uint _num) public {
        arr.push(_num);
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function resetArr() public {
        delete arr;
    }
}
