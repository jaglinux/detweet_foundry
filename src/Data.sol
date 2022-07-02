pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

library Data {
        struct tweet {
        string message;
        address owner;
        uint256 numberOfLikes;
        bool minted;
        mapping(address => uint256) isLiker;
        mapping(uint256 => address) idToLikerAddress;
    }
    struct user {
        string name;
        uint256 numberOfTweets;
        uint256 numberOfFollowers;
        uint256[] tweetsList;
        mapping(address => uint256) isFollower;
        mapping(uint256 => address) idToFollowerAddress;
    }
}