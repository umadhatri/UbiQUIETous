const Web3 = require('web3');
const { abi, evm } = require('./build/contracts/SimpleContract.json');

const web3 = new Web3('http://127.0.0.1:7545'); // Connect to Ganache

const contractAddress = 'Contracts\SimpleContract.sol'; // Replace with the actual deployed contract address
const evaultContract = new web3.eth.Contract(abi, contractAddress);

// Interact with the contract using web3.js
