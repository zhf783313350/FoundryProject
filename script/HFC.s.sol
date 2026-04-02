// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {HFC} from "../src/HFC.sol";

contract  HFCScript is Script {
    function run()external{
        uint256 deployerPrivateKey =vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        new HFC();
       vm.stopBroadcast(); 
    }
}