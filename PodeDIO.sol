// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Importing the ERC721 standard contract from OpenZeppelin library
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

// Define the main contract that extends the functionalities of ERC721
contract PokeDIO is ERC721{

    // Define a struct to represent a Pokemon with a name, level, and image
    struct Pokemon{
        string name;  // The name of the Pokemon
        uint level;   // The level of the Pokemon
        string img;   // URL or identifier for the Pokemon's image
    }

    // An array to store all Pokemons created in the contract
    Pokemon[] public pokemons;
    // Address of the owner who deploys the contract (the game owner)
    address public gameOwner;

    // Constructor to initialize the ERC721 token with a name and symbol
    constructor () ERC721 ("PokeDIO", "PKD"){
        gameOwner = msg.sender;  // Set the contract deployer as the game owner
    } 

    // Modifier to ensure that the function can only be called by the owner of a specified monster
    modifier onlyOwnerOf(uint _monsterId) {
        require(ownerOf(_monsterId) == msg.sender, "Apenas o dono pode batalhar com este Pokemon"); // Ensure caller owns the Pokemon
        _;
    }

    // Function to enable a battle between two Pokemons
    function battle(uint _attackingPokemon, uint _defendingPokemon) public onlyOwnerOf(_attackingPokemon){
        // Access attacker and defender from storage
        Pokemon storage attacker = pokemons[_attackingPokemon];
        Pokemon storage defender = pokemons[_defendingPokemon];

        // Update the levels based on battle outcome
        if (attacker.level >= defender.level) {
            attacker.level += 2;  // Attacker gains more levels if stronger
            defender.level += 1;  // Defender gains one level as consolation
        } else {
            attacker.level += 1;  // Attacker gains a level
            defender.level += 2;  // Defender gains more levels if stronger
        }
    }

    // Function to create a new Pokemon
    function createNewPokemon(string memory _name, address _to, string memory _img) public {
        require(msg.sender == gameOwner, "Apenas o dono do jogo pode criar novos Pokemons"); // Only the game owner can create new Pokemons
        uint id = pokemons.length;  // Assign new Pokemon an ID based on current array length
        pokemons.push(Pokemon(_name, 1, _img)); // Add new Pokemon with default level 1
        _safeMint(_to, id); // Mint a new ERC721 token for the Pokemon to the specified address
    }
}