// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {Event} from "../src/Event.sol";

contract EventTest is Test {
    Event public e;

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function setUp() public {
        e = new Event();
    }

    function testEmitTransferEvent() public {
        //Tell foundry which data to check
        vm.expectEmit(true, true, false, true); 
        //function expectEmit(bool checkTopic1, bool checkTopic2, bool checkTopic3, bool checkData) external;

        //Emit the expected event
        emit Transfer(address(this), address(123), 456);

        //Call the function that should emit the event
        e.transfer(address(this), address(123), 456);

        //Check index 1
        vm.expectEmit(true, false, false, false); 
        emit Transfer(address(this), address(123), 456);
        e.transfer(address(this), address(124), 456);
    }

    function testEmitManyTransferEvent() public {
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint256[] memory amounts = new uint256[](2);
        amounts[0]=777;
        amounts[1] = 888;

        for(uint i; i<to.length; i++) {
            vm.expectEmit(true, true, false, true);
            emit Transfer(address(this), to[i], amounts[i]);
        }
        e.transferMany(address(this), to, amounts);
    }
}