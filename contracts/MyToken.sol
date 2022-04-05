// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts (last updated v4.5.0) (token/ERC20/ERC20.sol)

pragma solidity ^0.8.0;

import "../node_modules/openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";

contract PickleRickTokenContract is ERC20 {
    constructor() ERC20("PickleRickToken", "PRT") {
        _mint(msg.sender, 1000 * 10**18);
    }
}
