// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.6.0;

// importing contract simplestorage

import "./SimpleStorage.sol";
// is -> inheritance now SotrageFactory inherits from SimpleStorage
contract StorageFactory is SimpleStorage{
    
    // here we are trying to deploy SimpleStorage contract from this contract

    // making a array for storing the transactions made from SimpleStorage contract
    SimpleStorage[] public SimpleStorageArray;

    function CreateSimpleStorageContract() public{
        // making a new instance of SimpleStorage contract and storing it into the array 
        SimpleStorage SimpleStorageContract = new SimpleStorage();
        SimpleStorageArray.push(SimpleStorageContract);
    }

    //  for using the store function to store favorite num using SimpleStorage at that index
    function sfStore(uint256 SimpleStorageIndex, uint256 SimpleStorageNumber) public {
        // address
        // ABI
        SimpleStorage S1 = SimpleStorage(address(SimpleStorageArray[SimpleStorageIndex]));
        S1.store(SimpleStorageNumber);
    }

    // for retrieving the value of storageNumber stored at that index 
    function sfGet(uint256 SimpleStorageIndex) public view returns(uint256) {
        return SimpleStorage(address(SimpleStorageArray[SimpleStorageIndex])).retrieve();
    }
}

