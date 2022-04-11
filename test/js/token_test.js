const Token = artifacts.require('Token');

// 1 Ether = 1000000000000000000 Wei
contract('Token', (accounts) => {
  describe('mint', () => {
    it('should return error message "Invalid burn recipient" when executed by zero address', async () => {
      try {
        const token = await Token.deployed();
        await token.mint('0x0000000000000000000000000000000000000000', 1000);
      } catch (error) {
        assert.equal(error.reason, 'Invalid burn recipient');
      }
    });
    it('should return error message "Operation unauthorised" when executed by not the owner of contract', async () => {
      try {
        const token = await Token.deployed();
        await token.mint(accounts[1], 1000);
      } catch (error) {
        assert.equal(error.reason, 'Operation unauthorised');
      }
    });
    it('should return token total supply = 2000000000000000000000 wei', async () => {
      const token = await Token.deployed();
      await token.mint(accounts[0], 1000);
      const result = await token.totalSupply();
      assert(result.toString() == '2000000000000000000000');
    });
  });
  describe('burn', () => {
    it('should return error message "Invalid burn recipient" when executed by zero address', async () => {
      try {
        const token = await Token.deployed();
        await token.burn('0x0000000000000000000000000000000000000000', 1000);
      } catch (error) {
        assert.equal(error.reason, 'Invalid burn recipient');
      }
    });
    it('should return error message "Operation unauthorised" when executed by not the owner of contract', async () => {
      try {
        const token = await Token.deployed();
        await token.burn(accounts[1], 1000);
      } catch (error) {
        assert.equal(error.reason, 'Operation unauthorised');
      }
    });
    it('should return error message "Burn amount exceeds balance" when burn amount larger than wallet amount', async () => {
      try {
        const token = await Token.deployed();
        await token.burn(accounts[0], 3000);
      } catch (error) {
        assert.equal(error.reason, 'Burn amount exceeds balance');
      }
    });
    it('should return token total supply = 1000000000000000000000 wei', async () => {
      const token = await Token.deployed();
      await token.burn(accounts[0], 1000);
      const result = await token.totalSupply();
      assert(result.toString() == '1000000000000000000000');
    });
  });
  describe('transfer', () => {
    it('should return balance of account[0] = 999999000000000000000 and account[1] = 1000000000000000', async () => {
      const token = await Token.deployed();
      await token.transfer(accounts[1], 1000000000000000);
      const resultAcc0 = await token.balanceOf.call(accounts[0]);
      const resultAcc1 = await token.balanceOf.call(accounts[1]);
      assert(resultAcc0.toString() == '999999000000000000000');
      assert(resultAcc1.toString() == '1000000000000000');
    });
    // TODO: error can't send arg negative number on big int
    // it('should return error message "Value must be greater or equal to 0" when amount to transfer <= 0', async () => {
    //   try {
    //     const token = await Token.deployed();
    //     await token.transfer(accounts[1], -1000);
    //   } catch (error) {
    //     assert.equal(error.reason, 'Value must be greater or equal to 0');
    //   }
    // });
    it('should return error message "Not enough balance" when amount to transfer is larger than wallet has', async () => {
      try {
        const token = await Token.deployed();
        await token.transfer(accounts[1], 1000000000000000, { from: accounts[2] });
      } catch (error) {
        assert.equal(error.reason, 'Not enough balance');
      }
    });
  });
});