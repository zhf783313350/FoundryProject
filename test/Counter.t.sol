// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";

contract CounterTest is Test {
    Counter public counter;

    function setUp() public {
        counter = new Counter(); 
    }
    function test_GetNumber() public {
        counter.setNumber(100);
        assertEq(counter.getNumber(), 100);
    }
    function test_Cheatcode_Prank()public{
     address hacker = address(0x1337);
     vm.prank(hacker);
     counter.setNumber(999);
     assertEq(counter.getNumber(),999);
    }
    function  test_Cheatcode_Warp()public{
        vm.warp(1000);
        assertEq(block.timestamp,1000);
    }
    function testFuzz_SetNumber(uint256 x)public{
        counter.setNumber(x);
        assertEq(counter.getNumber(),x);
    }
    function test_SumTo100()public view{
        uint256 result=counter.getTotalSum(100);
        assertEq(result,5050);
    }
      function test_Transfer()public{
        address recipient=address(0x1234);
        uint256 amount=100;
        counter.transfer(recipient, amount);
         console.log("owner balance:",counter.balances(address(this)),"recipient balance:",counter.balances(recipient));
        assertEq(counter.balances(address(this)),900);
        assertEq(counter.balances(recipient),100);
    }
}
