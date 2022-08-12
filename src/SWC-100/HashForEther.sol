// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

// After 0.5.0 it is impossible to omit the visibility specifier for functions.
// The changelog: https://github.com/ethereum/solidity/blob/develop/Changelog.md#050-2018-11-13
// > Syntax Checker: Strictly require visibility specifier for functions. 

// pragma solidity <= 0.5.0;
// pragma solidity ^0.4.24;

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

    // Just imagine there are no "public" visibility specifiers here.
    // Because we can't omit the specifier after Solidity 0.5.0.

    function withdrawWinnings() public {
        // Winner if the last 8 hex characters of the address are 0.
        require(uint32(uint160(msg.sender)) == 0);
        _sendWinnings();
    }

    function _sendWinnings() public {
        payable(msg.sender).transfer(balance);
    }
}
