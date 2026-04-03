// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {HFC} from "../src/HFC.sol"; // 导入你要部署的合约

contract  HFCScript is Script {
    function run()external{
        uint256 deployerPrivateKey =vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
       HFC hfc= new HFC();
       console.log("HFC deployed at:", address(hfc));
       vm.stopBroadcast(); 
    }
}