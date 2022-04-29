// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

// importing contract simplestorage

import "./SimpleStorage.sol";

contract StorageFactory {
    
    // here we are trying to deploy SimpleStorage contract from this contract

    // making a array for storing the transactions made from SimpleStorage contract
    SimpleStorage[] public SimpleStorageArray;

    function CreateSimpleStorageContract() public{
        // making a new instance of SimpleStorage contract and storing it into the array 
        SimpleStorage SimpleStorageContract = new SimpleStorage();
        SimpleStorageArray.push(SimpleStorageContract);
    }
}

