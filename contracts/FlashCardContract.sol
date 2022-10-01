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

    /**
     * Redeem the card value to self
     * @param _cardId is the unique card Id
     * @param _password is the non-encrypted version of key to redeem the card
     */
    function redeemCard(uint256 _cardId, string memory _password) public payable {
        require(_cardId >= cardCount, "Invalid Card Id");
        bytes32 key = cardKeys[_cardId];
        require(cardAmounts[_cardId] > 0, "Insufficient card balance");
        bytes32 passKey = keccak256(abi.encodePacked(_password));
        require(key == passKey, "Wrong password");
        (bool sent,) = msg.sender.call{ value: cardAmounts[_cardId] }("");
        require(sent,"Error in transfer");
        cardAmounts[_cardId] = 0;
    }

    /**
     * Redeem the card value to provided address
     * @param to is the address where the fund will go
     * @param _cardId is the unique card Id
     * @param _password is the non-encrypted version of key to redeem the card
     * If we want to restrict this feature to the card owner only we can add
     * require(msg.sender == cardIds[_cardId], "Unauthorized: Owner only");
     */
    function redeemCardTo(address to, uint256 _cardId, string memory _password) public payable {
        require(_cardId >= cardCount, "Invalid Card Id");
        bytes32 key = cardKeys[_cardId];
        require(cardAmounts[_cardId] > 0, "Insufficient card balance");
        bytes32 passKey = keccak256(abi.encodePacked(_password));
        require(key == passKey, "Wrong password");
        (bool sent,) = to.call{ value: cardAmounts[_cardId] }("");
        require(sent,"Error in transfer");
        cardAmounts[_cardId] = 0;
    }

}