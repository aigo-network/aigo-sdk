// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DeviceNFT is ERC721, Ownable {
  event MinterConfigured(address indexed minter, uint256 minterAllowedAmount);
  event MinterRemoved(address indexed minter);

  mapping(address => bool) internal minters;
  mapping(address => uint256) internal minterAllowed;
  uint256 nextId;

  constructor() ERC721("Example Device NFT", "EDN") Ownable(msg.sender) {}

  function minterAllowance(address minter) external view returns (uint256) {
    return minterAllowed[minter];
  }

  function isMinter(address account) external view returns (bool) {
    return minters[account];
  }

  function configureMinter(address _minter, uint256 _minterAllowedAmount) external onlyOwner {
    minters[_minter] = true;
    minterAllowed[_minter] = _minterAllowedAmount;
    emit MinterConfigured(_minter, _minterAllowedAmount);
  }

  function removeMinter(address _minter) external onlyOwner {
    minters[_minter] = false;
    minterAllowed[_minter] = 0;
    emit MinterRemoved(_minter);
  }

  function mint(address _to) external returns (uint256) {
    require(_to != address(0), "zero address");

    uint256 mintingAllowedAmount = minterAllowed[msg.sender];
    require(mintingAllowedAmount > 0, "exceeds minterAllowance");
    unchecked {
      minterAllowed[msg.sender] -= 1;
    }

    uint256 _tokenId = ++nextId;
    _mint(_to, _tokenId);
    return _tokenId;
  }
}
