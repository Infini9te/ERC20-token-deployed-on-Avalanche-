// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract UniqueToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") {}

    function mintTokens(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function transferTokens(address recipient, uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        approve(msg.sender, amount);
        transferFrom(msg.sender, recipient, amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function burnTokens(uint256 amount) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance");
        _burn(msg.sender, amount);
    }
    function gameStore() public pure returns (string memory) {
        return "1. Special Item 1 - 200 Tokens\n2. Special Item 2 - 100 Tokens\n3. Special Item 3 - 75 Tokens";
    }

    function redeemTokens(uint256 choice) external payable {
        require(choice <= 3, "Invalid selection");

        if (choice == 1) {
            require(balanceOf(msg.sender) >= 200, "Insufficient balance");
            approve(msg.sender, 200);
            transferFrom(msg.sender, owner(), 200);
        } else if (choice == 2) {
            require(balanceOf(msg.sender) >= 100, "Insufficient balance");
            approve(msg.sender, 100);
            transferFrom(msg.sender, owner(), 100);
        } else {
            require(balanceOf(msg.sender) >= 75, "Insufficient balance");
            approve(msg.sender, 75);
            transferFrom(msg.sender, owner(), 75);
        }
    }
}