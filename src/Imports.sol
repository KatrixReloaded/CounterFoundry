// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import "../lib/solmate/src/tokens/ERC20.sol";

contract Token is ERC20("name", "symbol", 18) {}

import "@openzeppelin/contracts/access/Ownable.sol"; //remappings.txt provides directions

contract TestOz is Ownable {}
