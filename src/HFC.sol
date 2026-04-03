// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
// 导入 OpenZeppelin 的标准代币模板
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";
import {ERC20} from "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract HFC is ERC20, Ownable {
    // 构造函数，初始化代币名称和符号
    constructor() ERC20("HFC Token", "HFC") Ownable(msg.sender) {
        // 初始发行 1000 个代币给部署者
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
