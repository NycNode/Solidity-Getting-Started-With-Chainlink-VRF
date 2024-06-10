# Two Die Smart Contract Project

<strong>A demo for using Chainlink VRF to ensure on-chain randomness.</strong>

The [VRFNumberGen.sol](./contracts/VRFNumberGen.sol) smart contract will allow you to simulate rolling two dice. Feel free to refer to the following documentation as well:<br>

- [VRF Documentation]("https://docs.chain.link/vrf/v2-5/getting-started")

## Table of Contents

- [Dependencies](#dependencies)
- [Clone The Repository](#clone-the-repository)
  - [Using GitHub Desktop](#using-github-desktop)
  - [Using Git SCM](#using-git-scm)
- [Setting Up A MetaMask Wallet](#setting-up-a-metamask-wallet)
- [Deploying With Remix](#deploying-with-remix)
  - [Browser Setup](#browser-setup)
  - [Local Terminal Setup](#local-terminal-setup)
  - [Remix Instructions](#remix-instructions)
  - [Chainlink VRF Setup](#chainlink-vrf-setup)
  - [Deploy the Contract](#deploy-the-contract)
  - [Using the Contract](#using-the-contract)
- [Contributors](#contributors)

## Dependencies

1. [NodeJS](https://nodejs.org/en)
2. [GitHub Desktop](https://desktop.github.com/) or [Git SCM](https://www.git-scm.com/downloads)
3. [Visual Studio Code (optional)](https://code.visualstudio.com/)

## Clone The Repository

### Using GitHub Desktop

<p >
  <img src="images/github-desktop-cloning.png" alt="GitHub Desktop Cloning" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

### Using Git SCM

1. Open a terminal window or Git Bash.
2. Navigate to your preferred directory using `cd` (change directory), `mkdir` (make directory), `dir` (show directory files), `ls` (show directory files).
3. Run: `git clone https://github.com/NycNode/Solidity-Getting-Started-With-Chainlink-VRF.git`

## Setting Up A MetaMask Wallet

Use Chrome preferably.

<p>
  <a href="https://youtu.be/bMf73G42SF4?feature=shared" target="_blank">
    <img src="https://img.youtube.com/vi/bMf73G42SF4/0.jpg" alt="Watch the video" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
  </a>
</p>

## Deploying With Remix

### Browser Setup

1. Create a test wallet in MetaMask.
2. Set up the Polygon Amoy network in MetaMask's settings and fund your wallet with MATIC using a faucet. More information is available here:
   - [Amoy Instructions & Faucet](https://polygon.technology/blog/introducing-the-amoy-testnet-for-polygon-pos)
3. You will also need LINK tokens for testing which can be obtained through the following URL:
   - [LINK Faucet](https://faucets.chain.link/polygon-amoy)

### Local Terminal Setup

1. Run the command `npm install` in a terminal window inside this project's directory.
2. Also run `npm install -g @remix-project/remixd` to make remixd available globally for your file system.
3. Run `remixd` in the terminal, then head to [Remix](https://remix.ethereum.org/).

### Remix Instructions

1. Enable the Remixd plugin and then click "Access File System".

<p>
  <img src="images/remix-one.png" alt="Remix Instructions" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

2. Open the contract file in Remix (`VRFNumberGen.sol`).

<p>
  <img src="images/remix-two.png" alt="Contract Opened" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

3. Compile the contract (you should see a green check mark once done).

<p>
  <img src="images/remix-three.png" alt="Compiling Contract" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

4. Connect your MetaMask to Remix, ensuring it is on the Polygon Amoy network.

<p>
  <img src="images/remix-five.png" alt="Switching Networks" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
  <img src="images/remix-four.png" alt="Connecting MetaMask" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

### Chainlink VRF Setup

1. In order to use Chainlink's VRF service, we will have to create a subscription (no real money involved, just using test LINK and MATIC). Head over to the following link, and after entering your wallet address (can be obtained from MetaMask) paste it in as the "Admin address".

<p>
  <img src="images/remix-six.png" alt="Public Address" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

- [Link To Subscribe](https://vrf.chain.link/polygon-amoy/new)

<p>
  <img src="images/remix-seven.png" alt="Subscribing" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

2. Continuing next steps, once you've created the subscription head to the subscription and click on it.

- [View Your Subscriptions](https://vrf.chain.link/polygon-amoy)

<p>
  <img src="images/remix-eight.png" alt="My Subscriptions" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

3. Copy the subscription "ID" (it'll be used when we deploy the contract). Then click "Actions" and "Fund Subscription".

<p>
  <img src="images/remix-nine.png" alt="ID and Funding" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

4. Earlier, one of our faucets gave us 25 LINK tokens but it might be less at your current point in time. However, funding with 5 LINK tokens should be more than enough.

<p>
  <img src="images/remix-ten.png" alt="Funding Subscription" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

### Deploy the Contract

1. Go back to Remix and deploy the contract by first inputting your subscription ID that you copied earlier as a parameter. Then, MetaMask will prompt you to confirm the transaction.

<p>
  <img src="images/remix-eleven.png" alt="Deploying" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

2. At this point, once the transaction is confirmed, you'll see a message like so with a green check mark in Remix's terminal. If you scroll down further on the left side of the navigation bar that you used to deploy, you should see your newly deployed contract's functions as well as its address. Copy that address and navigate back to your VRF subscriptions (same place as in the picture for step 11).

<p>
  <img src="images/remix-twelve.png" alt="Transaction Confirmed & Getting Contract Address" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

- [View Your Subscriptions](https://vrf.chain.link/polygon-amoy)

3. Click "Add Consumer" and paste in your contract address that we previously obtained from Remix's IDE. Now hit the next "Add Consumer" button and that will allow your contract to use your subscription. Make sure to confirm the transaction as well when prompted by MetaMask to do so.
<p>
  <img src="images/remix-thirteen.png" alt="Adding A Consumer" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>
After a minute or so, refreshing the page will now show your contract address as one of the consumers for your subscription.

<p>
  <img src="images/remix-fourteen.png" alt="Viewing Your Newly Added Consumer" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

## Using the Contract

1. Go back to Remix and call the `requestRandomNumber` function, and confirm the MetaMask transaction thereafter.

<p>
  <img src="images/remix-fifteen.png" alt="Calling The VRF" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

2. After confirmation, take your MetaMask wallet address again (same way as in the first picture of step 9) and paste it in as the first parameter for the `addressToRandomNumber` function. The second parameter will be 0 or 1, each representing a separate die. Call the function to display the value underneath as an unsigned integer with 256 bits.

<p>
  <img src="images/remix-sixteen.png" alt="Reading The State" style="border: 2px solid #375bd2; border-radius: 8px; max-width: 70%; display: block; margin: 1rem auto;">
</p>

## Contributors

- **Daniel Chrostowski** - Created the Hardhat application using Chainlink's VRF documentation with support in mind for Remixd (and Ignition). For those who are adventurous and curious, there might be an additional feature involving Ignition hidden within the project files.
- **Joshua Gottlieb** - Outlined the scope of this project to create a simple Remix-based VRF contract to simulate rolling two dice through the Chainlink Verifiable Randomness Function.
