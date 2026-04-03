// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {HFC} from "../src/HFC.sol";

contract HFCTest is Test{
    HFC public hfc;
    address public deployer;
    function setUp()public{
        deployer=address(this);
        hfc=new HFC();
    }
    function test_InitialSupply() public view {
        uint256 expectedSupply = 1000000 * 10**18;
        assertEq(hfc.totalSupply(), expectedSupply);
    }
    function test_DeployerBalance()public view{
        uint256 expectedSupply =1000000 * 10**18;
        assertEq(hfc.balanceOf(deployer),expectedSupply);
    }
    function test_MintByOwner()public{
        hfc.mint(deployer,500*10**18);
        assertEq(hfc.balanceOf(deployer),1000500  *10**18);
    }
    function test_MintByHackerShouldFail()public{
        address hacker=address(0xdeadbeef);
        vm.prank(hacker);
        vm.expectRevert(); 
        hfc.mint(hacker, 1000 * 10**18);
    }
}