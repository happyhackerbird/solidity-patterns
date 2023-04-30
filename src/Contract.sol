// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

contract ContractFactory is Ownable, CloneFactory {
    address public libraryAddress;
    ClonableContract[] public proxies;

    event ContractCreated(ClonableContract proxy);

    constructor(address libraryAddr) public {
        libraryAddress = libraryAddr;
    }

    function setLibraryAddress(address libraryAddr) external onlyOwner {
        libraryAddress = libraryAddr;
    }

    function createContract(uint256 initialData) external {
        ClonableContract proxy = ClonableContract(createClone(libraryAddress));
        proxy.initialize(initialData);

        proxies.push(proxy);
        emit ContractCreated(proxy);
    }
}
