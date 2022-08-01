// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "hardhat/console.sol";

contract ZombieFactory {
    uint dnaLength = 16;
    uint dnaMod = 10 ** dnaLength;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    event NewZombie(uint zombieId, string name, uint dna);

    function _createZombie(string calldata _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
        uint id = zombies.length - 1;
        emit NewZombie(id, _name, _dna);
    }

    function _generateRandomDna(string calldata _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaMod;
    }

    function createRandomZombie(string calldata _name) public {
        uint dna = _generateRandomDna(_name);
        _createZombie(_name, dna);
    }
}
