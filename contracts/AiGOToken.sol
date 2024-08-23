// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AiGOToken is ERC20, Ownable {
  constructor(uint256 initialSupply) ERC20("AiGO", "AIG") Ownable(msg.sender) {
    _mint(msg.sender, initialSupply);
  }

  function mint(address to, uint256 amount) external onlyOwner {
    _mint(to, amount);
  }
}

