//Contract based on [https://docs.openzeppelin.com/contracts/3.x/erc721](https://docs.openzeppelin.com/contracts/3.x/erc721)
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract Tesoro is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _itemIds;

    constructor() ERC721("Tesoro", "TEST") {}

    //transfer Tesoro recipient address with itemURI which is json metadata
    function mintNFT(address recipient, string memory itemURI)
        public onlyOwner
        returns (uint256)
    {
        _itemIds.increment();

        uint256 newItemId = _itemIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, itemURI);

        return newItemId;
    }
}
