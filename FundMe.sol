// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;
// in this we are trying to make payment from one address to another
contract FundMe {

    mapping(address => uint256) public AddressToAmountFunded;
    // payable functions for making payment
    function fund() public payable {
        AddressToAmountFunded[msg.sender] += msg.value; 
        // msg.value => amt to be tranferred
        // msg.sender => address of the account to be transferred (reciever)
    }
}