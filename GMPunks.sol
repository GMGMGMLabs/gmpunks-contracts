// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

//import "./ERC721Tradable.sol";
import "ERC721PresetMinterPauserAutoIdCustom.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title GMPunks
 * GMPunks - a contract for our amazing GMPunks.
 */
contract GMPunks is ERC721PresetMinterPauserAutoIdCustom, Ownable {

    constructor()
        ERC721PresetMinterPauserAutoIdCustom("GMPunksV0", "GMPunksV0", "https://punks.gmlabs.dev/")
    {}

    function baseTokenURI() public pure returns (string memory) {
        return "https://punks.gmlabs.dev/";
    }
}