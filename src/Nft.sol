pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT
import {ERC721} from "./ERC721.sol";
import {Data} from "./Data.sol";

contract Nft is ERC721 {
    constructor(string memory name, string memory symbol ) {
    }

    function MintTweet(address _to) internal returns(uint256) {
        return _mint(_to);
    }
}