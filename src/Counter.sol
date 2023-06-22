// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint public count;

    function get() public view returns(uint) {
        return count;
    }

    function inc() public {
        count++;
    }

    function dec() public {
        count--;
    }
}