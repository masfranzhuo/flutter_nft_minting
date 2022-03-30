const Token = artifacts.require("Token");

contract("Token", () => {
  it("should return token total supply = 2000", async () => {
    const token = await Token.deployed("Name", "Symbol", 1000);
    await token.mint(1000);
    const result = await token.totalSupply();
    console.log(result);
    // assert(result == 2000);
  });
  it("should return token total supply = 500", async () => {
    const token = await Token.deployed("Name", "Symbol", 1000);
    await token.burn(500);
    const result = await token.totalSupply();
    // assert(result == 500);
  });
});