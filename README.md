![MacBook Air M2 - 1](https://user-images.githubusercontent.com/92246587/193424276-f7d2081f-92d8-481c-8c08-6b8bac07dc0d.png)

FlashCard is blockchain based app for flash card payment like (Gift Cards) which can be redeemed later with a key and card Id.

> Note: This is very basic implementation of my idea or in other words its the first concept draft. Will keep improving and adding feature. End goal is to develop a flashcard payment service to pay on-chain without any wallet. Feel free to contribute or suggest any changes.


How it works:
- User creates a card with any amount (in ETH) using `createNewCard()` with parameters `amount` and `keyHash` (keccak256) of the password user wanna use.
- The above step generates and returns a `cardId` for the card generated.
- Card can be redeemed either partially or fully to anyone.
- Partial redemption requires a `keyHash` swap meaning it will replace the key for next redemption.
- User can either redeem the card to same wallet or to other wallet address using `redeemCard()` or `redeemCardTo()` function respectively.

Future integrations:
- Migrate to EIP-2535 for better storage layout and upgradability
- Card based attribute layout to add custom features
- Different type of cards like only full redeemable or locked till timestamp +more
- Password/Key can be changed on demand
- A card will have a whitelist and a blacklist maintained by original owner
- An official frontend
- (MAYBE) NFT Cards
- (MAYBEE) More currency support
- (MAYBEEE) Governance for Cards (admin control)


---

## Hardhat Tasks Commands

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```
