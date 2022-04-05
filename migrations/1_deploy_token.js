const Token = artifacts.require('Token');

module.exports = function (deployer, network, accounts) {
  deployer.deploy(Token, 'Token Name 02', 'TN2', 1000);
};
