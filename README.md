![Test](https://github.com/masfranzhuo/flutter_nft_minting/workflows/Test/badge.svg)
[![codecov](https://codecov.io/gh/masfranzhuo/flutter_nft_minting/branch/main/graph/badge.svg?token=VW5CZJSO9H)](https://codecov.io/gh/masfranzhuo/flutter_nft_minting)

# Flutter NFT Minting

A sample Flutter project for minting NFT.

## Command Documentation

```
> npx hardhat

> npm install --save-dev "hardhat@2.8.3"
> npm install --save-dev "@nomiclabs/hardhat-waffle@2.0.0"
> npm install --save-dev "ethereum-waffle@3.0.0"
> npm install --save-dev "chai@4.2.0"
> npm install --save-dev "@nomiclabs/hardhat-ethers@2.0.0"
> npm install --save-dev "ethers@5.0.0"
> npm install @nomiclabs/hardhat-etherscan

> npm install @openzeppelin/contracts
> npm install dotenv

> npx hardhat clean
> npx hardhat compile
> npx hardhat run scripts/deploy.js --network Mumbai
> npx hardhat run scripts/verify.js --network Mumbai
```

### Basic Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, a sample script that deploys that contract, and an example of a task implementation, which simply lists the available accounts.

Try running some of the following tasks:

```shell
npx hardhat accounts
npx hardhat compile
npx hardhat clean
npx hardhat test
npx hardhat node
node scripts/sample-script.js
npx hardhat help
```

### Resources

- [An NFT minting smart contract, explained. Line by line.](https://www.linkedin.com/pulse/nft-minting-smart-contract-explained-line-matthew-willox)
- [Guide to creating your own NFT with Javascript & Solidity 🚀 (Part 1 of 3)](https://medium.com/coinmonks/guide-to-creating-your-own-nft-with-javascript-solidity-part-1-of-3-7909b80fae94)
- [Guide to creating your own NFT with Javascript & Solidity 👾(Part 2 of 3)](https://medium.com/coinmonks/guide-to-creating-your-own-nft-with-javascript-solidity-part-2-of-3-ceaa1cb2412a)
- [Build an NFT Collection using Flutter](https://betterprogramming.pub/build-an-nft-collection-using-flutter-6df928e5f742)