// This module is used to deploy the VRFNumberGen contract
// The subscriptionId is passed as a parameter to the module. Set it by renaming .env.example to .env and setting the SUBSCRIPTION_ID variable
// Start a hardhat node using the command (unless you have one running already or are using a different network):
// npx hardhat node
// The module is deployed using the command:
// npx hardhat ignition deploy .\ignition\modules\VRFNumberGen.js --network localhost
const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");
const configDotenv = require("dotenv");
configDotenv.config();

const SUBSCRIPTION_ID = parseInt(process.env.SUBSCRIPTION_ID);

module.exports = buildModule("VRFModule", (m) => {
  const subscriptionId = m.getParameter("subscriptionId", SUBSCRIPTION_ID);
  const vrf = m.contract("VRFNumberGen", [subscriptionId]);
  return { vrf };
});
