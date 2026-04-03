// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 private number;
      event Transfer(address indexed from,
      address indexed to,
      uint256 value);
 mapping(address => uint256) public balances;
 constructor(){
    balances[msg.sender]=1000;
 }
    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
    function getTotalSum(uint256 n)public pure returns(uint256){
        uint256 sum=0;
        unchecked {
            for(uint256 i=0;i<=n){
                sum+=1;
            }
        }
        return sum;
    }
       function transfer(address to,uint256 value)public{
        require(to!=address(0),"invalid address");
        require(balances[msg.sender]>=value,"Not enough balance");
        balances[msg.sender]-=value;
         balances[to]+=value;
         emit Transfer(msg.sender,to, value);
     }
}