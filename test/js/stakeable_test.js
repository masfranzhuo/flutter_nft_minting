const Token = artifacts.require('Token');
const truffleAssert = require('truffle-assertions');
const helper = require("./helpers/truffleTestHelpers");

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
    it('should has index 1 for the first time stake and balance remaining 900000000000000000000 wei', async () => {
      const token = await Token.deployed();
      const stakeId = await token.stake(100);
      truffleAssert.eventEmitted(
        stakeId,
        'Staked',
        (stake) => {
          assert.equal(stake.index, 1);
          return true;
        });

      const resultBalance = await token.balanceOf.call(accounts[0]);
      assert.equal(resultBalance.toString(), '900000000000000000000');
    });
    it('should has index 2 for another stakeholder stake', async () => {
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
  describe('withdrawStake', () => {
    it('should return error message "Cannot withdraw more than you have staked" when try to withdraw more than staked', async () => {
      try {
        const token = await Token.deployed();
        await token.withdrawStake(200, 0);
      } catch (error) {
        assert.equal(error.reason, 'Cannot withdraw more than you have staked');
      }
    });
    it('should have total amount stake 80000000000000000000 wei and balance account have 920000000000000000000 wei', async () => {
      const token = await Token.deployed();
      await token.withdrawStake(20, 0);
      const resultBalance = await token.balanceOf.call(accounts[0]);
      const resultSummary = await token.hasStake(accounts[0]);
      assert.equal(resultBalance.toString(), '920000000000000000000');
      assert.equal(resultSummary.totalAmount.toString(), '80000000000000000000');
    });
    it('should remove stake if empty and total amount stake = 0, balance account = 1000000000000000000000 wei', async () => {
      const token = await Token.deployed();
      await token.withdrawStake(80, 0);
      const resultBalance = await token.balanceOf.call(accounts[0]);
      const resultSummary = await token.hasStake(accounts[0]);
      assert.equal(resultBalance.toString(), '1000000000000000000000');
      assert.equal(resultSummary.totalAmount.toString(), '0');
      assert.equal(resultSummary.stakes[0].user, "0x0000000000000000000000000000000000000000");
    });
  });
  describe('calculateStakeReward', () => {
    it('should have increase token by 2% when staking for 2 hours', async () => {
      const token = await Token.deployed();
      await token.stake(100);

      await helper.advanceTimeAndBlock(3600 * 20);

      const resultSummary = await token.hasStake(accounts[0]);
      assert.equal(resultSummary.stakes[1].claimable.toString(), '2000000000000000000');
    });
  });
});