const Token = artifacts.require("Token");

// 1 Ether = 1000000000000000000 Wei
contract("Token", () => {
  describe("mint", () => {
    it("should return token total supply = 2000000000000000000 wei", async () => {
      const token = await Token.deployed();
      await token.mint(1);
      const result = await token.totalSupply();
      assert(result.toString() == "2000000000000000000");
    });
  });
  describe("burn", () => {
    it("should return token total supply = 1000000000000000000 wei", async () => {
      const token = await Token.deployed();
      await token.burn(1);
      const result = await token.totalSupply();
      assert(result.toString() == "1000000000000000000");
    });
    // TODO: error test
    it("should return 'Burn amount exceeds balance'", async () => {
      const token = await Token.deployed();
      expect(async () => await token.burn(2)).to.throw(new Error("Returned error: VM Exception while processing transaction: revert -- Reason given: Panic: Arithmetic overflow."));
    });
  });
});