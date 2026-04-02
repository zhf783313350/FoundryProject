// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// 导入 OpenZeppelin 的标准代币模板
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
contract HFC is ERC20 {
    // 构造函数，初始化代币名称和符号
    constructor() ERC20("HFC Token", "HFC") {
        // 初始发行 1000 个代币给部署者
        _mint(msg.sender, 1000000  * 10 ** decimals());
    }
}