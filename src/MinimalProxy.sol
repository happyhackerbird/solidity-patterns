// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

// deploys a simple contract that forwards all calls using delegatecall
contract MinimalProxy {
    address public logicContractAddress;

    constructor(address contractAddress) {
        logicContractAddress = contractAddress;
    }

    function forward() external returns (bytes memory) {
        // 1. take arguments and forward them to logic contract where they are executed
        // 2. receive return values and return them if successful
        (bool success, bytes memory data) = logicContractAddress.delegatecall(
            msg.data
        );
        require(success);
        return data;
    }
}
