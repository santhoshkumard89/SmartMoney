// SPDX-License-Identifier: UnDefined

pragma solidity 0.8.19;

contract SmartMoney{

    uint public contractBalance;
    
    function deposit() payable public{
        contractBalance = contractBalance + msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function withdrawAll() public{
        address payable to = payable(msg.sender);
        uint balance = getContractBalance();
        to.transfer(balance);
        contractBalance = contractBalance - balance;
    }

    function withdrawToAddress(address payable _to) public{
        uint balance = getContractBalance();
        _to.transfer(balance);
        contractBalance = contractBalance - balance;
    }

}