// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/security/Pausable.sol";

contract DegenToken is ERC20, Ownable, Pausable {

    // Mapping of items and their token cost
    mapping(uint256 => uint256) public itemCosts;

    // Constructor to initialize the token with name and symbol
    constructor() ERC20("Degen", "DGN") {
        itemCosts[1] = 150; // item 1 costs 150 tokens (150 DGN)
        itemCosts[2] = 200; // item 2 costs 200 tokens (200 DGN)
        itemCosts[3] = 250; // item 3 costs 250 tokens (250 DGN)
    }

    // Function to create new tokens and distribute them to players as rewards, can only be called by the owner
    function mintToken(address to, uint256 amount) external onlyOwner whenNotPaused {
        _mint(to, amount);
    }

    // Function to burn tokens, that they own, that are no longer needed, can be called by anyone who owns tokens
    function burnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }

    // Function to redeem their tokens for items in the in-game store
    function redeemItem(uint256 itemId) external whenNotPaused {
        uint256 itemCost = itemCosts[itemId];
        require(itemCost > 0, "Item does not exist or cost not set");
        require(balanceOf(msg.sender) >= itemCost, "Insufficient tokens");

        _burn(msg.sender, itemCost);
    }

    // Function to transfer their tokens to other's address
    function transferTokens(address to, uint256 amount) external whenNotPaused {
        _transfer(msg.sender, to, amount);
    }

    // Function to pause all token transfers and minting
    function pauseContract() external onlyOwner {
        _pause();
    }

    // Function to unpause all token transfers and minting
    function unpauseContract() external onlyOwner {
        _unpause();
    }
}
