// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

contract FlashCardContract {
    // CardId => Address 
    mapping (uint256 => address) cardIds;
    // CardId => amount
    mapping (uint256 => uint256) cardAmounts;
    // CardId => key (in Keccak256)
    mapping (uint256 => bytes32) cardKeys;
    uint256 public cardCount;


    /**
     * Creates a new card
     * @param _amount is the value of card
     * @param _keyHash is the encrypted key to redeem the card
     * @returns current cardCount as cardId
     */

    function createNewCard(uint256 _amount, bytes32 _keyHash) public payable returns (uint256 cardId) {
        require(_amount == msg.value, "Invalid amount");
        uint256 id = cardCount + 1;
        cardIds[id] = msg.sender;
        cardAmounts[id] = _amount;
        cardKeys[id] = _keyHash;
        cardCount++;
        returns (cardCount);
    }
}