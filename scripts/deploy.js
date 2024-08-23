import hardhat from 'hardhat';

async function main() {
	const { ethers } = hardhat;
	const [deployer] = await ethers.getSigners();
	console.log('Deploying contracts with the account:', deployer.address);

	const DeviceNFTContract = await ethers.getContractFactory('DeviceNFT');
	const contract = await DeviceNFTContract.deploy();

	console.log('DeviceNFT Contract deployed to', contract.address);
}

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
