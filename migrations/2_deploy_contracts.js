const Token = artifacts.require("Token");

module.exports = function (deployer) {
  deployer.deploy(Token, "Name", "Symbol", 1);
};
