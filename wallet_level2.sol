//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
contract Wallet{
    mapping(address=>uint) public user;
    uint price=1 ether;
    address owner;
    
    constructor(){   
        owner=msg.sender;
        user[owner]=100;
    }
    modifier isOwner{
        require(msg.sender==owner,"You are not the owner");
        _;
    }
    function tokensIncrease()public isOwner{
        user[owner]++;
    }
    function burnTokens()public isOwner(){
        user[owner]--;
    }
    function deposit()public payable{
        require(user[owner]>0,"No sufficent tokens");
        user[owner]-=msg.value/price;
        user[msg.sender]+=msg.value/price;
    }
    function withdraw(address payable _to,uint tokenAmount)public{
        require(user[msg.sender]>0,"No sufficent tokens");
        user[msg.sender]-=tokenAmount;
        _to.transfer(tokenAmount);

    }
}
