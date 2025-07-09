# OURO Protocol 

## Project Overview

The first on-chain cashback network

## Core Features 

### 🪙 USDO Stablecoin
- **Minting**: Users can mint USDO by depositing other tokens
- **Redemption**: Users can redeem USDO for other tokens
- **Tax Mechanism**: A tax is charged during redemption

### ⭐ STAR Reward System
- **Staking Rewards**: Users earn rewards by staking STAR tokens
- **Referral Rewards**: Additional rewards for referring new users
- **Airdrop System**: Regular airdrops to eligible users

### 🏆 VIP Management System
- **Tier System**: Different VIP tiers with various benefits
- **Privileged Features**: Special functions and discounts for VIP users

### 💰 Treasury Management
- **Fund Management**: Protocol treasury fund management and distribution
- **Revenue Distribution**: Protocol revenue distribution mechanism

## Technical Architecture

### Smart Contract Components
- **IOUROProtocol**: Core protocol interface defining main functionalities
- **IOUROMinterManager**: Minting manager
- **IOUROTokenRegistry**: Token registry
- **IOUROVipManager**: VIP manager
- **IOUROTreasure**: Treasury management
- **IOUROMintRouter**: Minting router
- **IUSDO**: USDO token interface
- **ISTAR**: STAR token interface

### Supported Networks
- **Ethereum Mainnet** (ChainID: 1)
- **Sepolia Testnet** (ChainID: 11155111)
- **BSC Mainnet** (ChainID: 56)
- **BSC Testnet** (ChainID: 97)

## Installation and Setup

### Requirements
- Node.js >= 18.18.0
- npm or yarn


### Environment Variables Configuration
Create a `.env` file and configure the following variables:
```env
# Deployer Private Key
DEPLOYER_PRIVATE_KEY=your_private_key_here

# RPC URLs
SEPOLIA_RPC_URL=your_sepolia_rpc_url
MAINNET_RPC_URL=your_mainnet_rpc_url
BSC_RPC_URL=your_bsc_rpc_url
BSC_TESTNET_RPC_URL=your_bsc_testnet_rpc_url
MORPH_TESTNET_RPC_URL=your_morph_testnet_rpc_url

# API Keys
ETHERSCAN_API_KEY=your_etherscan_api_key
BSCSCAN_API_KEY=your_bscscan_api_key
MORPHSCAN_API_KEY=your_morphscan_api_key
```

## Development Commands

### Compile Contracts
```bash
npm run compile
```

### Run Tests
```bash
npm run test
```

### Deploy Contracts
```bash
npm run deploy
```

## Security Audits

The project has been audited by SlowMist:
- [OURO Protocol - SlowMist Audit Report](./aduit/OURO%20Protocol%20-%20SlowMist%20Audit%20Report.pdf)
- [OURO Protocol Phase2 - SlowMist Audit Report](./aduit/OURO%20Protocol%20Phase2%20-%20SlowMist%20Audit%20Report.pdf)

## Tech Stack

- **Solidity**: 0.8.22
- **Hardhat**: Development framework
- **OpenZeppelin**: Secure contract library
- **TypeScript**: Development language
- **Ethers.js**: Ethereum interaction library

## License

MIT License

## Contributing

We welcome issues and pull requests to improve the project.

## Contact

For questions or suggestions, please contact us through GitHub Issues.
