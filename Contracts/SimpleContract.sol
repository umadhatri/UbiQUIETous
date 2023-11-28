// SimpleContract.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    uint public data;

    function setData(uint _data) public {
        data = _data;
    }
}