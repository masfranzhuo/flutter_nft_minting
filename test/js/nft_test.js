const { expect } = require('chai');
const { ethers } = require('hardhat');

describe('NFT', function () {
  it('should return token counter=0 when first time deployed', async function () {
    const NFT = await ethers.getContractFactory('NFT');
    const nft = await NFT.deploy('Flutter NFT Minting', 'FNM');
    await nft.deployed();

    const result = await nft.tokenCounter();
    expect(result).to.equal(0);
  });
  it('should return token counter=1 when mint one NFT already', async function () {
    const NFT = await ethers.getContractFactory('NFT');
    const nft = await NFT.deploy('Flutter NFT Minting', 'FNM');
    await nft.deployed();

    await nft.mint('ipfs://example/nft.jpg', '0x1cb728ab78fcf1d8688ddad7fc6aeb2cba96c15f');
    const result = await nft.tokenCounter();
    expect(result).to.equal(1);
  });
  it('should return token URI = "ipfs://example/nft.jpg" when get token URI with token id = 0', async function () {
    const NFT = await ethers.getContractFactory('NFT');
    const nft = await NFT.deploy('Flutter NFT Minting', 'FNM');
    await nft.deployed();

    await nft.mint('ipfs://example/nft.jpg', '0x1cb728ab78fcf1d8688ddad7fc6aeb2cba96c15f');
    const result = await nft.tokenURI(0);
    expect(result).to.equal('ipfs://example/nft.jpg');
  });
});
