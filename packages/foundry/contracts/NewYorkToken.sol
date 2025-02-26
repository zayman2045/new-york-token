// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "forge-std/console.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract NewYorkToken is ERC20, Ownable {
    
    constructor() ERC20("NewYorkToken", "NYT") Ownable(msg.sender) {}
}
