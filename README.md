# DegenToken

DegenToken is an ERC20 token implemented in Solidity programming. This project is for those who want some challenges to test their skills in Solidity programming, demonstrating the basic syntax and functionality of smart contracts on the blockchain and also its verification on 'Snowtrace' (a powerful blockchain explorer designed for the Avalanche Network).

## Description

DegenToken is a simple contract written in Solidity, a programming language used for developing smart contracts on the Avalanche blockchain. The contract demonstrates the use of ERC20 tokens, which can be used in a game, named "Degen Gaming", in which the platform can create new tokens and distribute them to players as rewards and only the owner can mint tokens. Also, Players can transfer their tokens to others. Players can  redeem their tokens for items in the in-game store. Players can check their token balance at any time. Anyone can burn tokens, that they own, that are no longer needed.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. Follow these steps:

1. Open Remix (https://remix.ethereum.org/)

2. Go to the Remix website at Remix Ethereum -> Create a New File

3. Click on the "+" icon in the left-hand sidebar and save the file with a .sol extension (e.g., DegenToken.sol).

4. Add the Contract Code: Copy and paste the DegenToken contract code into the newly created file.

5. Compile the Code: Click on the "Solidity Compiler" tab in the left-hand sidebar. Ensure the "Compiler" option is set to "0.8.0" (or above compatible version) and click on the "Compile DeegnToken.sol" button. Also make sure that in the compiler tab (in advance configurations), the EVM VERSION must be set to 'Istanbul' or others (except default).

6. Now, come in 'DEPLOY & RUN TRANSACTIONS' tab, the environment must be connected to "Injected Provider - MetaMask".

7. Now click on 'deploy' button to deploy the contract. A MetaMask window will appear asking for the transaction to deploy the contract. Click on 'Confirm' to confirm the transaction.

8. Now go to the deployed contract and copy the address of the contract and paste it on '[testnet-Snowtrace](https://testnet.snowtrace.io/)' website. It will show the activity of the current contract deployed.

9. Now, come to the deployed contract on 'remix IDE' and go to 'mintToken' function to mint some tokens. Write an address of any account and put any amount and click on transact button. The MetaMask window will appear asking to do the transaction. Click on 'Confirm' to do the transaction. Now, go to balanceOf function and check the balance of the address. And again go on'[testnet-Snowtrace](https://testnet.snowtrace.io/)' webiste and refresh the webiste to see the activity that the mint token activity is showing.

10. Now, go to burnToken function, put some amount and click on transact. And repeat same processes from step 9 to see the activity of burnToken function.

11. Now, go to 'setItemCost' function and set the 'itemName' and 'cost' and then click on transact button. And again repeat same processes from step 9 to see the activity of setItemCostToken function.

12. Now go on 'itemCosts' to check the cost of the item.

13. Now, go on 'redeemItem' function and enter the name of the item which you want to redeem and do the transaction and again go on snowtrace testnet webisite to check the activity.

14. At last, copy an address of another account and go on 'transferTokens' function and paste the address of that account and also fill the amount to be transferred. Do the transaction through MetaMask and check on 'Snowtrace testnet'.  That amount will be deducted and will be transferred to the another account.


## License
This project is licensed under the MIT License. See the LICENSE file for details.

## Authors

Srijan Kumar  
[@Srijan](srijankumar11627@gmail.com)
