// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Attestor} from "../src/Attestor.sol";

contract AttestorTest is Test {
    Attestor public attestor;
    address owner = vm.addr(1);
    address newOwner = vm.addr(2);

    function setUp() public {
        string[] memory providers = new string[](1);
        providers[0] = "http";

        vm.startPrank(owner);
        attestor = new Attestor();
        attestor.initialize(owner, "Marksense Proof PnL", "MRKP", providers);
        vm.stopPrank();
    }

    function testSetOwner() public {
        assertEq(attestor.owner(), owner);

        vm.prank(owner);
        attestor.transferOwnership(newOwner);

        assertEq(attestor.owner(), newOwner);
    }
}
