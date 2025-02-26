// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {NewYorkToken} from "../contracts/NewYorkToken.sol";

contract NewYorkTokenTest is Test {
    NewYorkToken public newYorkToken;

    function setUp() public {
        newYorkToken = new NewYorkToken();
    }
}
