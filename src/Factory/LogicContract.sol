// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

contract LogicContract {
    function doSomething(uint x, uint y) public pure returns (uint) {
        return x * y;
    }
}
