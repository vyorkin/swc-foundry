// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

/*
 * @source: https://github.com/sigp/solidity-security-blog#visibility
 * @author: SigmaPrime
 * Modified by Gerhard Wagner
 */

contract HashForEther {
    uint256 public balance;

    constructor() payable {
      balance = msg.value;
    }

    function withdrawWinnings() {
        // Winner if the last 8 hex characters of the address are 0.
        require(uint32(uint160(msg.sender)) == 0);
        _sendWinnings();
    }

    function _sendWinnings() {
        payable(msg.sender).transfer(balance);
    }
}
