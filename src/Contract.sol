// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import "openzeppelin/access/Ownable.sol";
import "./CloneFactory.sol";
import "./MinimalProxy.sol";

contract ContractFactory is Ownable, CloneFactory {
    address public libraryAddress;
    MinimalProxy[] public proxies;

    event ContractCreated(MinimalProxy proxy);

    constructor(address libraryAddr) {
        libraryAddress = libraryAddr;
    }

    function setLibraryAddress(address libraryAddr) external onlyOwner {
        libraryAddress = libraryAddr;
    }

    function createContract(uint256 initialData) external {
        MinimalProxy proxy = MinimalProxy(createClone(libraryAddress)); // deploy a minimal proxy
        // proxy.initialize(initialData); // pass in constructor variables here

        proxies.push(proxy);
        emit ContractCreated(proxy);
    }
}
