const Token = artifacts.require("Token");

// 1 Ether = 1000000000000000000 Wei
contract("Token", (accounts) => {
  describe("mint", () => {
    it("should return token total supply = 2000000000000000000000 wei", async () => {
      const token = await Token.deployed();
      await token.mint(1000);
      const result = await token.totalSupply();
      assert(result.toString() == "2000000000000000000000");
    });
  });
  describe("burn", () => {
    it("should return token total supply = 1000000000000000000000 wei", async () => {
      const token = await Token.deployed();
      await token.burn(1000);
      const result = await token.totalSupply();
      assert(result.toString() == "1000000000000000000000");
    });
    // TODO: error test
    it("should return 'Burn amount exceeds balance'", async () => {
      const token = await Token.deployed();
      // expect(async () => await token.burn(2000)).to.throw(new Error("Returned error: VM Exception while processing transaction: revert -- Reason given: Panic: Arithmetic overflow."));
    });
  });
  describe("transfer", () => {
    it("should return balance of account[0] = 999999000000000000000 and account[1] = 1000000000000000", async () => {
      const token = await Token.deployed();
      await token.transfer(accounts[1], 1000000000000000);
      const resultAcc0 = await token.balanceOf.call(accounts[0]);
      const resultAcc1 = await token.balanceOf.call(accounts[1]);
      assert(resultAcc0.toString() == "999999000000000000000");
      assert(resultAcc1.toString() == "1000000000000000");
    });
  });
});