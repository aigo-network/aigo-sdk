require('@nomiclabs/hardhat-ethers');

const { readFileSync } = require('fs');
const { parse } = require('dotenv');
const envFile = readFileSync('.env');
const environments = parse(envFile);

module.exports = {
	solidity: '0.8.20',
	networks: {
		iotex: {
			url: 'https://babel-api.mainnet.iotex.io',
			accounts: [`0x${environments.IO_SECRET}`],
		},
	},
};
