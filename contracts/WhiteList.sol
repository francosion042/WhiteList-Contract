//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WhiteList {
    address owner;
    uint constant MAX_WHITELISTED = 20;
    mapping(address => bool) public whiteList;

    constructor () {
        owner = msg.sender;
    }

    modifier OnlyOwner () {
        require(msg.sender == owner, "Only the Contract Owner can call this Function");
        _;
    }

    function addManyToWhiteList (address[] memory _addressList) public  OnlyOwner {
        for (uint i = 0; i < _addressList.length; i++ ) {
            whiteList[_addressList[i]] = true;
        }

    }
    function addToWhiteList (address _address) public OnlyOwner {
        whiteList[_address] = true;
    }

    function removeFromWhiteList ( address _address) public OnlyOwner {
        delete whiteList[_address];
    }

}
