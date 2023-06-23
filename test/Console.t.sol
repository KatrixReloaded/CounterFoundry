// SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";

contract ConsoleTest is Test {
    function testLogSomething() public view {
        console.log("Log something here", 123);

        int x = -1;
        console.logInt(x); //console.log cannot log only int value, press F12 to find out more
    }
}