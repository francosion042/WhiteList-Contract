
const hre = require("hardhat");
require("dotenv").config()

async function main() {

  // We get the contract to deploy
  const WhiteList = await hre.ethers.getContractFactory("WhiteList");
  const whiteList = await WhiteList.deploy("Hello, Hardhat!");

  await whiteList.deployed();

  console.log("WhiteList deployed to:", whiteList.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
