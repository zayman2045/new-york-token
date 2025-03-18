// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {NewYorkToken} from "../contracts/NewYorkToken.sol";

contract NewYorkTokenTest is Test {
    NewYorkToken public newYorkToken;

    function setUp() public {
        newYorkToken = new NewYorkToken(1 ether);
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

    function testInitialTokenSupplyIsZero() public view {
        uint256 expectedInitialTokenSupply = 0;
        uint256 actualInitialTokenSupply = newYorkToken.totalSupply();

        require(expectedInitialTokenSupply == actualInitialTokenSupply);
    }

    function testAirdrop() public {
        address user = makeAddr("user");
        uint256 mintAmount = 100 * 10 ** 18;
        
        // Fund user with ETH
        vm.deal(user, 2 ether);

        uint256 initialUserTokenSupply = newYorkToken.balanceOf(user);

        vm.prank(user);
        newYorkToken.airdropTokens{value: 1 ether}(mintAmount);

        uint256 newUserTokenSupply = newYorkToken.balanceOf(user);

        require(newUserTokenSupply == (initialUserTokenSupply + mintAmount));
    }

    function testAirdropFeeIsCorrect() public {
        address user = makeAddr("user");
        uint256 mintAmount = 100 * 10 ** 18;

        // Fund user with ETH
        vm.deal(user, 2 ether);

        vm.prank(user);
        newYorkToken.airdropTokens{value: 1 ether}(mintAmount);
    }
}
