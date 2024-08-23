import hardhat from 'hardhat';

async function main() {
	const { ethers } = hardhat;
	const [deployer] = await ethers.getSigners();
	console.log('Deploying contracts with the account:', deployer.address);

	const initialSupply = ethers.utils.parseUnits('1000', 18); // 1000 tokens with 18 decimals
	const Token = await ethers.getContractFactory('AiGOToken');
	const token = await Token.deploy(initialSupply);

	console.log('Token deployed to:', token.address);
}

main()
	.then(() => process.exit(0))
	.catch((error) => {
		console.error(error);
		process.exit(1);
	});
