const PickleRickToken = artifacts.require("PickleRickTokenContract");

module.exports = function (deployer) {
  deployer.deploy(PickleRickToken);
};
