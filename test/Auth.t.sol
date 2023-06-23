// SPDX-License-Identifier:MIT
pragma solidity ^0.8.17;

import "forge-std/Test.sol";
import {Wallet} from "../src/Wallet.sol";
contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }
}