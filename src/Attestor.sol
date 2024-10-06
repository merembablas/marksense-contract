// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "./reclaim/Reclaim.sol";
import "./reclaim/Addresses.sol";

contract Attestor {
    address public reclaimAddress;
    address public owner;
    // add providersHashes for your permitted providers
    string[] public providersHashes;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    constructor(string[] memory _providersHashes) {
        owner = msg.sender;
        providersHashes = _providersHashes;
        reclaimAddress = Addresses.BASE_SEPOLIA_TESTNET;
    }

    function verifyProof(Reclaim.Proof memory proof) public view {
        Reclaim(reclaimAddress).verifyProof(proof);
    }

    function setReclaimAddress(address newAddress) external onlyOwner {
        reclaimAddress = newAddress;
    }

    function transferOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}
