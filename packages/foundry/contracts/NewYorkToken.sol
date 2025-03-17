// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "forge-std/console.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/// @title NewYorkToken ERC20 Token
/// @notice This contract implements a simple ERC20 token with minting functionality through an airdrop mechanism
/// @dev Inherits from OpenZeppelin's ERC20 and Ownable contracts
contract NewYorkToken is ERC20, Ownable {
    /// @notice The required fee in wei to mint tokens through the airdrop
    /// @dev Set as immutable to save gas since it never changes after deployment
    uint256 public immutable airdropFee;

    /// @notice Initializes the NewYorkToken contract
    /// @dev Sets up the ERC20 token with name "NewYorkToken" and symbol "NYT"
    /// @param _airdropFee The fee in wei that users must pay to mint tokens
    constructor(uint256 _airdropFee) ERC20("NewYorkToken", "NYT") Ownable(msg.sender) {
        airdropFee = _airdropFee;
    }

    /// @notice Allows users to mint tokens by paying the airdrop fee
    /// @dev Mints tokens directly to the caller's address after fee verification
    /// @param amount The amount of tokens to mint (in base units, 18 decimals)
    function airdropTokens(uint256 amount) public payable {
        require(msg.value >= airdropFee, "Must pay airdrop fee");
        _mint(msg.sender, amount);
        console.log("Airdropped", amount, "NYT tokens to", msg.sender);
    }

    /// @notice Allows the contract owner to withdraw accumulated ETH from airdrop fees
    /// @dev Uses low-level call to transfer ETH to avoid limitations of transfer/send
    function withdraw() public onlyOwner {
        (bool success, ) = msg.sender.call{value: address(this).balance}("");
        require(success, "Withdrawal failed");
    }
}
