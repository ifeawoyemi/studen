import { ethers } from "hardhat";

async function main() {
  const studentRecordMgt = await ethers.deployContract("StudentRecordManagement");
  await studentRecordMgt.waitForDeployment();
  console.log(`Student Record Management deployed to ${studentRecordMgt.target}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
