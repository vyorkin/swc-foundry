// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

contract ContractTest is Test {
    Utilities internal utils;

    function setUp() public {
        utils = new Utilities();
        address payable[] memory users = utils.createUsers(2);

        deployer = users[0];
        vm.label(deployer, "Deployer");

        attacker = users[1];
        vm.label(deployer, "Attacker");
    }

    function testExample() public {
        assertTrue(true);
    }
}
