// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import "GMPunks.sol";
import "@openzeppelin/contracts/access/AccessControlEnumerable.sol";

/**
 * @title GMPunksProxy
 * GMPunksProxy - a contract that serves as a proxy to mint NFTs.
 */
contract GMPunksProxy is AccessControlEnumerable {

    GMPunks public nft = GMPunks(0x8b973ad9Ba411f502521da122c9a226E75526c11);
    mapping (address => bool) private allowList;

    constructor() {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }
    
    /**
     * Checks if a user is allowed to mint.
     */
    function canMint() public view returns (bool) {
        return allowList[msg.sender];
    }

    /*
     * Allows the contract admin to update the `alreadyMinted` map.
     */
    function updateAllowlist(address to, bool allow) public onlyRole(DEFAULT_ADMIN_ROLE) {
        allowList[to] = allow;
    }

    /**
     * Allows public minting of one NFT.
     */
    function publicMint() public virtual returns (uint256) {
        require(allowList[msg.sender], "Wallet is not allow listed");
        
        uint256 tokenId = nft.mint(msg.sender);
        allowList[msg.sender] = false;
        return tokenId;
    }

    function ownedBy() public virtual view returns(uint[] memory) {
        return nft.ownedBy(msg.sender);
    }
}