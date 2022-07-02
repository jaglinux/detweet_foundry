pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

import "./ERC165.sol";
interface IERC721 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);
    function balanceOf(address owner) external view returns (uint256 balance);
    function ownerOf(uint256 tokenId) external view returns (address owner);
    /*
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;*/
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external;
    function approve(address to, uint256 tokenId) external;
    function getApproved(uint256 tokenId) external view returns (address operator);
    function setApprovalForAll(address operator, bool _approved) external;
    function isApprovedForAll(address owner, address operator) external view returns (bool);
    /*
    function safeTransferFrom(
        address from,
        address to,
        uint256 tokenId,
        bytes calldata data
    ) external;*/
}

interface IERC721Receiver {
    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4);
}

abstract contract ERC721 is IERC721, ERC165 {
    uint256 private id;
    mapping(uint256 => address) private _owners;
    mapping(address => uint256) private _balances;
    mapping(uint256 => address) private _tokenApprovals;
    mapping(address => mapping(address => bool)) private _operatorApprovals;

    function balanceOf(address owner) external override view returns (uint256) {
        require(owner != address(0), "Cannot be Zero address");
        return _balances[owner];
    }

    function ownerOf(uint256 tokenId) public override view returns (address) {
        return _owners[tokenId];
    }

    function approve(address to, uint256 tokenId) public override {
        require(_owners[tokenId] == msg.sender, "only owner can approve");
        _tokenApprovals[tokenId] = to;
    }

    function getApproved(uint256 tokenId) public override view returns (address) {
        return _tokenApprovals[tokenId];
    }

    function setApprovalForAll(address operator, bool _approved) external override{
        _operatorApprovals[msg.sender][operator] = _approved;
    }

    function isApprovedForAll(address owner, address operator) public override view returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    function _isApprovedOrOwner(address _spender, uint256 _tokenId) internal view returns(bool){
        address owner = ownerOf(_tokenId);
        return (owner == _spender || owner == getApproved(_tokenId) || isApprovedForAll(owner, _spender));
    }

    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external override {
        require(to != address(0), "Cannot be Zero address");
        require(_isApprovedOrOwner(msg.sender, tokenId), "not approved");
        approve(address(0), tokenId);
        _balances[from]--;
        _balances[to]++;
        _owners[tokenId] = to;
    }

    function _mint(address _to) internal returns(uint256) {
        require(_to != address(0), "Cannot be Zero address");
        _owners[id] = _to;
        _balances[_to]++;
        id++;
        return id-1;
    }
}