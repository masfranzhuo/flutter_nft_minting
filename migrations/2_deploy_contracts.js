const Token = artifacts.require("Token");

module.exports = function (deployer) {
  deployer.deploy(Token, "Token Name 01", "TN1", 1000);
};
