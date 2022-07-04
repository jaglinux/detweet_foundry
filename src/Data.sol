pragma solidity >=0.8.0 <0.9.0;

//SPDX-License-Identifier: MIT

library Data {
    struct tweet {
        string message;
        address owner;
        uint256 numberOfLikes;
        uint256 numberOfRetweets;
        bool minted;
        mapping(address => uint256) isLiker;
        mapping(uint256 => address) idToLikerAddress;
        mapping(address => uint256) isReTweet;
        mapping(uint256 => address) idToReTweetAddress;
    }
    struct user {
        string name;
        uint256 numberOfTweets;
        uint256 numberOfFollowers;
        uint256[] tweetsList;
        uint256[] reTweetsList;
        mapping(address => uint256) isFollower;
        mapping(uint256 => address) idToFollowerAddress;
    }
}
