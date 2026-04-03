// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {HFC} from "../src/HFC.sol";
contract HFCTest is Test{
    HFC public hfc;
    address public owner;
    address public hacker;
    function setUp()public{
        owner=address(this);
        hacker=address(0x1337);
        hfc=new HFC();
    }
    function test_InitialSupply() public view {
        uint256 expectedSupply = 1000000 * 10**18;
        assertEq(hfc.totalSupply(), expectedSupply);
    }
    function test_DeployerBalance()public view{
        uint256 expectedSupply =1000000 * 10**18;
        assertEq(hfc.balanceOf(owner),expectedSupply);
    }
    function test_MintByOwner()public{
        uint256 minAmount=500 * 10**18;
        hfc.mint(owner,minAmount);
        assertEq(hfc.balanceOf(address(this)),1000500  *10**18);
        uint256 expectedBalance = 1000500 * 10**18;
        assertEq(hfc.balanceOf(address(this)),expectedBalance);
    }
    function test_MintByHackerShouldFail()public{
        vm.expectRevert();
        vm.prank(hacker);
        hfc.mint(hacker,100*10**18);
    }
}