//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Tesoro is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter publico _items;

mapping(address => bool) controllers;
  
    constructor() ERC721("Tesoro", "TEST") {}

    
    function miint(address to, uint256 amount) external {
    require(controllers[msg.sender], "Only controllers can mint");
    _mint(to, amount);

        uint256 newItemId = _itemIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, itemURI);

        return newItemId;
    }


  function addController(address controller) external onlyOwner {
    controllers[controller] = true;
  }

  function removeController(address controller) external onlyOwner {
    controllers[controller] = false;
  }
}
