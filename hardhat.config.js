require("@nomiclabs/hardhat-waffle")
const fs = require('fs') //Node File Server
const privateKey = fs.readFileSync(".secret").toString() //ref to pvk
const projectID = "86bfc8afefcc46b38f4cf729f83ad8cb" //infura project id

module.exports = {
  defaultNetwork: "hardhat",
  networks: {
    hardhat: {
      chainId: 1337 //standard hardhat id
    },
    mumbai: {
      url: 'https://polygon-mumbai.infura.io/v3/${projectID}', //infura url
      accounts: [privateKey] //accounts from where contracts are deployed
    },
    mainnet: {
      url: 'https://polygon-mainnet.infura.io/v3/${projectID}',
      accounts: [privateKey] //accounts from where contracts are deployedd
    }
  },
  solidity: {
    version: "0.8.4",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}

