// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract nft is ERC721URIStorage {
    using Counters for Counters.Counter; //using the Counter utility to declare token id
    Counters.Counter private _tokenIds; //private variable to track ID for each token
    address contractAddress; //marketplace address for hosted/support tokens

    constructor(address marketplaceAddress) ERC721("Femiverse Tokens", "FEMI") {
        contractAddress = marketplaceAddress; //takes in the marketplace address, assigning the contract address to the marketplace address
    }

    function createToken(string memory tokenURI) public returns (uint) { //function to allow minting of new tokens
        _tokenIds.increment(); //increment the tokenid
        uint256 newItemId = _tokenIds.current(); //declare a new item by retrieving the tokenid
        _mint(msg.sender, newItemId); //mint the token, send message to user
        _setTokenURI(newItemId, tokenURI); //assign the token URI
        setApprovalForAll(contractAddress, true);
        return newItemId;
    }
}   
