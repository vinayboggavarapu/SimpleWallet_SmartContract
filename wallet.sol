//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Wallet{
    uint public Asset; //Total Assets traded
    function Deposit()public payable{
        Asset+=msg.value;
    }
    function WalletBalance()public view returns(uint){
        return address(this).balance;

    }
    function WithdrawAll()public{
        payable(msg.sender).transfer(WalletBalance());
    }
    function PayotherAll(address payable to)public{
        to.transfer(WalletBalance());
    }
}
