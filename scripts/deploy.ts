import hre from "hardhat";

async function main() {
  // Get the contract factory from hre.ethers
  const Ayusutra = await hre.ethers.getContractFactory("Ayusutra");

  // Deploy the contract
  const ayusutra = await Ayusutra.deploy();

  // Wait until deployment is complete
  await ayusutra.waitForDeployment();

  console.log("✅ Ayusutra deployed to:", await ayusutra.getAddress());
}

// Run main
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

