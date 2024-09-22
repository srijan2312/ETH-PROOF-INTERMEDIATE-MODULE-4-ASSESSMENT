// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.4.0/contracts/access/Ownable.sol";

contract DEGENTOKEN is ERC20, Ownable {
    string[] public redeemableItems;
    mapping(uint256 => uint256) public itemCosts;
    mapping(address => mapping(uint256 => bool)) public itemRedeemed;


    constructor() ERC20("Degen", "DGN") {
        
        // Initialize redeemable items
        redeemableItems.push("Item 1");
        redeemableItems.push("Item 2");
        redeemableItems.push("Item 3");
        redeemableItems.push("Item 4");

        // Set costs for each item
        itemCosts[0] = 100; // Example cost for Item 1
        itemCosts[1] = 200; // Example cost for Item 2
        itemCosts[2] = 300; // Example cost for Item 3
        itemCosts[3] = 400; // Example cost for Item 4
    }

    function mintToken(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

      function burnToken(uint256 amount) public {
        _burn(msg.sender, amount);
    }


    function transferTokens(address to, uint256 amount) external onlyOwner {
        _transfer(msg.sender, to, amount);
    }

    function redeem(uint256 itemId) public {
        require(itemId < redeemableItems.length, "Item does not exist");
        uint256 cost = itemCosts[itemId];
        require(balanceOf(msg.sender) >= cost, "Insufficient balance");
        require(!itemRedeemed[msg.sender][itemId], "Item already redeemed");

        // Burn tokens as payment for the redeemed item
        _burn(msg.sender, cost);
        
        // Mark item as redeemed for the user
        itemRedeemed[msg.sender][itemId] = true;
    }

    function getRedeemedItems(address user) public view returns (bool[] memory) {
        bool[] memory redeemed = new bool[](redeemableItems.length);
        for (uint256 i = 0; i < redeemableItems.length; i++) {
            redeemed[i] = itemRedeemed[user][i];
        }
        return redeemed;
    }

}
