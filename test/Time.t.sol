// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {Auction} from "../src/Time.sol";

contract TimeTest is Test {
    Auction public auction;
    uint256 private startAt;

    function setUp() public {
        auction = new Auction();
        startAt = block.timestamp;
    }

    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("cannot bid"));
        auction.bid();
    }

    function testBid() public {
        vm.warp(startAt + 1 days); //set block.timestamp to future timestamp
        auction.bid();
    }
    
    function testBidFailsAfterEndTime() public {
        vm.expectRevert(bytes("cannot bid"));
        vm.warp(startAt + 2 days); 
        auction.bid();
    }

    function testTimestamp() public {
        uint t = block.timestamp;
        skip(100); //increment current timestamp
        assertEq(block.timestamp, t+100);

        rewind(10); //decrement current timestamp
        assertEq(block.timestamp, t+100-10);
    }
}