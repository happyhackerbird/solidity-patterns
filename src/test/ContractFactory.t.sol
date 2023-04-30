// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {Utilities} from "./utils/Utilities.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";

import "src/Factory/ContractFactory.sol";
import "src/Factory/MinimalProxy.sol";
import "src/Factory/LogicContract.sol";

contract ContractFactoryTest is DSTest {
    Vm internal immutable vm = Vm(HEVM_ADDRESS);
    ContractFactory factory;
    LogicContract implementation;
    event ContractCreated(MinimalProxy proxy);

    function setUp() public {
        implementation = new LogicContract();
        // deploy factory contract and set the address of the implementation contract
        factory = new ContractFactory(address(implementation));
    }

    function test_factory() public {
        vm.expectEmit(true, true, true, true);
        factory.createContract(10);
        MinimalProxy p = factory.proxies(0);
        emit ContractCreated(p); // indeed it still tests that the correct event was emitted
    }
}
