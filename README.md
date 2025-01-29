# PokeDIO: A Blockchain Pokémon Adventure

**PokeDIO** is a decentralized application powered by Ethereum smart contracts, offering a unique Pokémon-like gaming experience where players can create, own, and battle with their digital monsters. Built upon the ERC721 token standard, it combines blockchain technology with the fun of Pokémon!

## Table of Contents

- [Introduction](#introduction)
- [Technologies Used](#technologies-used)
- [Project Setup](#project-setup)
- [Smart Contract Overview](#smart-contract-overview)
- [Methods and Events](#methods-and-events)
- [Deployment](#deployment)
- [How to Use and Gameplay](#how-to-use-and-gameplay)
- [Added Characters](#added-characters)

## Introduction

PokeDIO is designed as an engaging blockchain-based game where each Pokémon character is represented as a unique non-fungible token (NFT). This project explores the intersection of gaming, blockchain technology, and decentralized ownership, aiming to provide players with true asset ownership and interoperability.

## Technologies Used

- **Remix IDE**: A browser-based IDE for developing and deploying Ethereum smart contracts.
- **Ganache**: A personal Ethereum blockchain used for contract deployment, testing, and development.
- **Metamask**: A cryptocurrency wallet for Ethereum, facilitating interactions with the blockchain.
- **IPFS**: (Planned integration) Used for storing and sharing Pokémon images.
- **Solidity**: A statically-typed programming language for writing smart contracts.
- **OpenZeppelin**: Secure and community-reviewed library for Ethereum, providing implementation of ERC721 standard.

## Project Setup

### Requirements

- Ganache (Local Blockchain)
- Metamask (Chrome Extension)
- Remix IDE (Online)

### Installation

1. **Install Ganache**:
   - Download and install Ganache from [Truffle Suite](https://trufflesuite.com/ganache/).

2. **Set Up Metamask**:
   - Install the Metamask browser extension from the [official website](https://metamask.io/).

3. **Open Remix IDE**:
   - Access the Remix IDE through your browser by visiting [Remix.ethereum.org](https://remix.ethereum.org/).

## Smart Contract Overview

The PokeDIO smart contract is built on the Solidity programming language and leverages the OpenZeppelin ERC721 implementation for NFT functionalities.

### Custom Components

- **Pokemon Struct**: A struct to represent individual Pokémon traits (name, level, image).
- **gameOwner**: Address variable to define the owner who can create new Pokémons.

## Methods and Events

### Custom Methods

- **createNewPokemon**:
  - **Description**: Allows only the game owner to create new Pokémon characters.
  - **Parameters**: `string _name`, `address _to`, `string _img`
  
- **battle**:
  - **Description**: Allows Pokémon owners to initiate a battle, impacting their levels based on outcomes.
  - **Parameters**: `uint _attackingPokemon`, `uint _defendingPokemon`

### Inherited Methods from OpenZeppelin

- **ERC721 Methods**:
  - `approve(address to, uint256 tokenId)`
  - `transferFrom(address from, address to, uint256 tokenId)`
  - `safeTransferFrom(address from, address to, uint256 tokenId)`
  - `balanceOf(address owner)`
  - `ownerOf(uint256 tokenId)`

## Deployment

### Deploying on Remix IDE

- **Configuration**:
  - Connect Metamask to the desired network (e.g., Ganache). Ensure the compiler version is set to 0.8.20 in Remix.
  
- **Compile**:
  - Select and compile the contract in Remix IDE.

- **Deploy**:
  - Deploy by switching to the 'Injected Provider - MetaMask' environment and confirm transactions in Metamask.

## How to Use and Gameplay

1. **Creating Pokémons**:
   - Execute `createNewPokemon` with desired name, address, and image data to generate a new token.

2. **Battling Pokémons**:
   - Initiate battles using the `battle` method, specifying attacker and defender IDs.

3. **Transfer Ownership**:
   - Use the `safeTransferFrom` method to change the ownership of Pokémon NFTs between players.

4. **Verification**:
   - Use the PokéDIO interface methods to create and check Pokémon details.

5. **Account Switching**:
   - Use Metamask to manage multiple accounts and test gameplay roles.

6. **Enhancing Experience**:
   - Observe how transactional changes affect gameplay dynamics directly by manipulating NFTs.

## Added Characters

| Name       | Image                                                                                                                                 |
|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| Psyduck    | ![Psyduck](assets/psyduck.jpeg)                   |
| Shih Tzu   | ![Shih Tzu](assets/shih_tzu.jpeg)                 |
| Bulbassaur | ![Bulbassaur](assets/bulbassaur.jpeg)            |
| Squirtle   | ![Squirtle](assets/squirtle.jpeg)                |
