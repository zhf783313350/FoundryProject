// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Counter {
    uint256 private number;

    function setNumber(uint256 newNumber) public {
        number = newNumber;
    }

    function getNumber() public view returns (uint256) {
        return number;
    }
    function getTotalSum(uint256 n)public pure returns(uint256){
        uint256 sum=0;
        for(uint256 i=1;i<=n;i++){
            sum+=i;
        }
        return sum;
    }
}