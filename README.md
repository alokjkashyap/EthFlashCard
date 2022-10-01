# EthFlashCard

EthFlashCard is blockchain based app for flash card payment like (Gift Cards) which can be redeemed later with a key and card Id.

> Note: This is very basic implementation of my idea or in other words its the first concept draft. Will keep improving and adding feature. Feel free to contribute or suggest any changes.


How it works:
- User creates a card with any amount (in ETH) using `createNewCard()` with parameters `amount` and `keyHash` (keccak256) of the password user wanna use.
- The above step generates and returs a `cardId` for the card generated.
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
