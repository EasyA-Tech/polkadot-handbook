# The Polkadot handbook.

Welcome. This is EasyA's legendary handbook. If you want to learn Polkadot like a legend, then you're in the right place.

# Purpose

This handbook serves as a guide to the Polkadot ecosystem, geared towards those just joining for the first time. It isn't just a beginners' handbook; it's a legendary handbook. Even if you've already immersed yourself in the ecosystem, you'll find tons of helpful tidbits around here!

# The EasyA App

Of course, the best place to start is always the [EasyA](https://www.easya.io) app! Download it here for the fastest and most fun way to learn about Polkadot. Download it directly right [here](https://links.easya.io/links/gotoapp)! 

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Core Concepts](#core-concepts)
- [Development Tools](#development-tools)
- [Smart Contracts](#smart-contracts)
- [Polkadot Network](#polkadot-network)
- [Ecosystem Projects](#ecosystem-projects)
- [Resources](#resources)
- [Handy Code Snippets](#handy-code-snippets)
- [Contributing](#contributing)

## Introduction

What is Polkadot:

- [Polkadot Overview](https://polkadot.network/) - Official website providing a comprehensive introduction to Polkadot's multi-chain network and its vision for Web3.

## Getting Started

The no-fluff starter:

- [Polkadot Wiki](https://wiki.polkadot.network/docs/getting-started) - Comprehensive documentation covering all aspects of Polkadot, from basic concepts to advanced topics.
- [Polkadot-JS Apps](https://polkadot.js.org/apps/) - A user interface for interacting with Polkadot and Substrate based chains.
- [Substrate Developer Hub](https://substrate.dev/) - Resources for building parachains and connecting to Polkadot using the Substrate framework.

## Core Concepts

Explanation of fundamental concepts in the Polkadot ecosystem:

- [Polkadot Architecture](https://wiki.polkadot.network/docs/learn-architecture) - Detailed explanation of Polkadot's unique multi-chain architecture.
- [Polkadot Consensus](https://wiki.polkadot.network/docs/learn-consensus) - Overview of Polkadot's hybrid consensus mechanism combining BABE and GRANDPA.

## Development Tools

Key tools and environments for Polkadot:

- [Substrate](https://substrate.dev/) - Blockchain development framework used to build parachains for Polkadot.
- [Polkadot-JS API](https://polkadot.js.org/docs/api) - JavaScript library for interacting with Polkadot nodes.

## Smart Contracts

How to write and deploy smart contracts on Polkadot:

- [ink!](https://github.com/paritytech/ink) - Rust-based smart contract language for Substrate chains in the Polkadot ecosystem.

Technically you can't (yet, see Plaza developments) deploy smart contracts on Polkadot directly. You need to deploy onto a parachain that supports smart contract execution (e.g. Astar, Acala, Moonbeam etc). Some of those parachains (e.g. Astar, Moonbeam) support EVM smart contracts, so you can also write them in Solidity (no ink! needed). 

## Polkadot Network

Going into the network level:

- [Telemetry](https://telemetry.polkadot.io/) - Real-time visualization of nodes on the Polkadot network.
- [Subscan](https://www.subscan.io/) - Multi-network explorer for Substrate-based chains, including Polkadot.

## Ecosystem Projects

Cool projects built on Polkadot:

- [Acala](https://acala.network/) - DeFi hub for Polkadot.
- [Astar](https://astar.network) - EVM and WASM smart contracts execution parachain on Polkadot.
- [Moonbeam](https://moonbeam.network/) - Ethereum-compatible smart contract parachain on Polkadot.

...and of course many more - check them out in the EasyA app!

## Resources

Extra stuff:

- [Polkadot Blog](https://polkadot.network/blog/) - Official blog with updates, insights, and deep dives into Polkadot and ecosystem.
- [Polkadot SDK GitHub](https://github.com/paritytech/polkadot-sdk) - Official GitHub repository for Polkadot SDK.

## Handy Code Snippets

Get a taste of Polkadot development with these code snippets:

### Subscribing to blocks

```javascript
import { ApiPromise } from '@polkadot/api';

// initialise via static create
const api = await ApiPromise.create();

// make a call to retrieve the current network head
api.rpc.chain.subscribeNewHeads((header) => {
  console.log(`Chain is at #${header.number}`);
});
```

### Making a transfer

```javascript
// Import the API, Keyring and some utility functions
const { ApiPromise } = require('@polkadot/api');
const { Keyring } = require('@polkadot/keyring');

const BOB = '5FHneW46xGXgs5mUiveU4sbTyGBzmstUspZC92UhjJM694ty';

async function main () {
  // Instantiate the API
  const api = await ApiPromise.create();

  // Construct the keyring after the API (crypto has an async init)
  const keyring = new Keyring({ type: 'sr25519' });

  // Add Alice to our keyring with a hard-derivation path (empty phrase, so uses dev)
  const alice = keyring.addFromUri('//Alice');

  // Create a extrinsic, transferring 12345 units to Bob
  const transfer = api.tx.balances.transferAllowDeath(BOB, 12345);

  // Sign and send the transaction using our account
  const hash = await transfer.signAndSend(alice);

  console.log('Transfer sent with hash', hash.toHex());
}

main().catch(console.error).finally(() => process.exit());
```

These examples showcase:
1. How to connect to subscribe to blocks.
2. How to make transfers.

## Contributing

We welcome contributions to make this handbook even more legendary! Here's how you can contribute:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/amazing-addition`)
3. Make your changes
4. Commit your changes (`git commit -am 'Add some amazing feature'`)
5. Push to the branch (`git push origin feature/amazing-addition`)
6. Create a new Pull Request

Please ensure your contributions align with our code of conduct and contribution guidelines.

## Credit/Inspiration

This handbook was inspired by the famous awesome lists by sindresorhus and the Awesome Polkadot list. We need awesome lists for Web3 ecosystems, with more of a hacker's guide to how they work. This is the answer to that need.
