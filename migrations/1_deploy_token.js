const Token = artifacts.require('Token');

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Token, 'Token Name 03', 'TN3', 1000);
};
