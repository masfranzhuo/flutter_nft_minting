const Token = artifacts.require('Token');

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Token, 'Token Name 04', 'TN4', 1000);
};
