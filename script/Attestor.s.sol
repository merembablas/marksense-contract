// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC1967Proxy} from "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

import {Script, console} from "forge-std/Script.sol";
import {Attestor} from "../src/Attestor.sol";

contract AttestorScript is Script {
    Attestor public attestor;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        string[] memory providers = new string[](1);
        providers[0] = "http";
        attestor = new Attestor();

        bytes memory data = abi.encodeWithSignature(
            "initialize(address,string,string,string[])",
            0x53D5569491ECE5c5B5e7235160619bc2F1d3Ea62,
            "Marksense Proof",
            "MKP",
            providers
        );

        ERC1967Proxy proxy = new ERC1967Proxy(address(attestor), data);

        vm.stopBroadcast();
    }
}
