// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "forge-std/Test.sol";

contract SignTest is Test {
    function testSignature() public {
        uint256 privateKey = 123;
        address pubKey = vm.addr(privateKey);
        bytes32 messageHash = keccak256("Secret message");
        (uint8 v, bytes32 r, bytes32 s) = vm.sign(privateKey, messageHash);
        address signer = ecrecover(messageHash, v, r, s);
        assertEq(signer, pubKey);

        bytes32 invalidMsgHash = keccak256("Invalid message");
        signer = ecrecover(invalidMsgHash, v, r, s);
        assertTrue(signer != pubKey);
    }
}