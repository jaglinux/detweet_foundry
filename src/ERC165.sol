pragma solidity >=0.8.0 <0.9.0;
//SPDX-License-Identifier: MIT

contract ERC165 {
    mapping (bytes4 => bool) internal supportedInterfaces;

    constructor(){
        //0x01ffc9a7
        supportedInterfaces[bytes4(keccak256("supportsInterface(bytes4)"))] = true;
    }
    
    function supportsInterface(bytes4 interfaceID) external view returns (bool){
        return supportedInterfaces[interfaceID];
    }
}