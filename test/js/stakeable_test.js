const Token = artifacts.require('Token');
const truffleAssert = require('truffle-assertions');

contract('Token', (accounts) => {
  describe('stake', () => {
    it('should return error message "Cannot stake more than you own" when stake more than your own', async () => {
      try {
        const token = await Token.deployed();
        await token.stake(10000);
      } catch (error) {
        assert.equal(error.reason, 'Cannot stake more than you own');
      }
    });
    it('should return error message "Cannot stake nothing" when stake amount less than 0', async () => {
      try {
        const token = await Token.deployed();
        await token.stake(0);
      } catch (error) {
        assert.equal(error.reason, 'Cannot stake nothing');
      }
    });
    it('should return index 1 for the first time stake', async () => {
      const token = await Token.deployed();
      const stakeId = await token.stake(100);
      truffleAssert.eventEmitted(
        stakeId,
        'Staked',
        (stake) => {
          assert.equal(stake.index, 1);
          return true;
        });
    });
    it('should return index 2 for another stakeholder stake', async () => {
      const token = await Token.deployed();
      await token.mint(accounts[1], 1000);
      const stakeId = await token.stake(100, { from: accounts[1] });
      truffleAssert.eventEmitted(
        stakeId,
        'Staked',
        (stake) => {
          assert.equal(stake.index, 2);
          return true;
        });
    });
  });
});