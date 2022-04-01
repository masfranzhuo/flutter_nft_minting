const Token = artifacts.require("Token");

module.exports = function (deployer) {
  deployer.deploy(Token, "Token Name", "TN", 1000);
};
