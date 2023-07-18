# ERC20-token-deployed-on-Avalanche-
# DegenToken Contract
The DegenToken contract is an ERC20 token smart contract that provides various functionalities for players on the Degen Gaming platform. This contract offers the following features:

## Token Creation: The platform owner has the authority to mint new tokens and distribute them as rewards to players. Only the contract owner can perform this action.

## Token Transfer: Players can transfer their tokens to other addresses. They can initiate token transfers by specifying the recipient's address and the amount of tokens they want to send.

## Token Redemption: Players have the option to redeem their tokens for items available in the in-game store. The contract maintains a list of items that can be redeemed using the corresponding token values.

## Token Balance Inquiry: Players can check their token balance at any time by calling the checkBalance function. This function returns the balance of tokens held by the caller's address.

## Token Burning: Token holders can choose to burn their own tokens if they no longer require them. The burnTokens function allows token holders to burn a specific amount of tokens from their own balance.

## Contract Details
SPDX-License-Identifier: MIT
Solidity Version: ^0.8.18
## Functions
mint:
function mint(address to, uint256 amount) public onlyOwner
The mint function enables the contract owner to create new tokens and distribute them to specified addresses. It accepts two parameters: to (the recipient's address) and amount (the number of tokens to mint). Only the contract owner can execute this function.

## transferTokens

function transferTokens(address receiver, uint amount) external
The transferTokens function allows players to transfer their tokens to other addresses. Players can initiate transfers by providing the recipient's address (receiver) and the amount of tokens (amount) to be transferred. This function requires the caller to have a sufficient balance of tokens.

## checkBalance

function checkBalance() external view returns (uint)
The checkBalance function allows players to check their token balance at any time. It returns the balance of tokens held by the caller's address.

## burnTokens

function burnTokens(uint amount) external
The burnTokens function enables any token holder to burn their own tokens if they are no longer needed. Token holders can specify the amount of tokens (amount) they wish to burn. The function requires the caller to have a sufficient balance of tokens.

## gameStore

function gameStore() public pure returns (string memory)
The gameStore function provides information about the available items in the in-game store. It returns a string containing the options and their corresponding values. Players can choose from these items to redeem with their tokens.

## redeemTokens

function redeemTokens(uint choice) external payable
The redeemTokens function allows players to redeem tokens for items in the in-game store. Players need to provide the choice parameter, representing the sequence number of the desired item to redeem. The function checks the player's token balance and verifies if it is sufficient for the selected item. If the conditions are met, it transfers the corresponding token value to the contract owner.

## AUTHOR
### SHUBHAM
