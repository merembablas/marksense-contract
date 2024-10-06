// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Attestor} from "../src/Attestor.sol";

contract AttestorScript is Script {
    Attestor public attestor;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        string[] memory providers = new string[](1);
        providers[0] = "http";
        attestor = new Attestor(providers);

        vm.stopBroadcast();
    }
}
