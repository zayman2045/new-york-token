// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {NewYorkToken} from "../contracts/NewYorkToken.sol";

contract NewYorkTokenTest is Test {
    NewYorkToken public newYorkToken;

    function setUp() public {
        newYorkToken = new NewYorkToken();
    }

    function testNameIsInitializedCorrectly() public view {
        string memory expectedName = "NewYorkToken";
        string memory actualName = newYorkToken.name();

        require(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

     function testSymbolIsInitializedCorrectly() public view {
        string memory expectedSymbol = "NYT";
        string memory actualSymbol = newYorkToken.symbol();

        require(
            keccak256(abi.encodePacked(expectedSymbol)) ==
                keccak256(abi.encodePacked(actualSymbol))
        );
    }
}
