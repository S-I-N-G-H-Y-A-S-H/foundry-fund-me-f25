# ⭐️ Foundry Fund Me

This is a section of the **Cyfrin Solidity Course**.

## 📌 Table of Contents

- [Getting Started](#getting-started)
  - [Requirements](#requirements)
  - [Quickstart](#quickstart)
  - [Optional: Gitpod](#optional-gitpod)
- [Usage](#usage)
  - [Deploy](#deploy)
  - [Testing](#testing)
  - [Test Coverage](#test-coverage)
- [Local zkSync](#local-zksync)
  - [Additional Requirements](#additional-requirements)
  - [Setup local zkSync node](#setup-local-zksync-node)
  - [Deploy to local zkSync node](#deploy-to-local-zksync-node)
- [Deployment to a Testnet or Mainnet](#deployment-to-a-testnet-or-mainnet)
- [Scripts](#scripts)
  - [Withdraw](#withdraw)
  - [Estimate Gas](#estimate-gas)
- [Formatting](#formatting)
- [Additional Info](#additional-info)
  - [What "Official" Means](#what-official-means)
- [Summary](#summary)
- [Thank You](#thank-you)

---

## 🚀 Getting Started

### Requirements

Make sure the following are installed:

- **Git**  
  Check with:
  ```bash
  git --version
  ```
  Example output:
  ```
  git version x.x.x
  ```

- **Foundry**  
  Check with:
  ```bash
  forge --version
  ```
  Example output:
  ```
  forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)
  ```

---

### Quickstart

```bash
git clone https://github.com/Cyfrin/foundry-fund-me-cu
cd foundry-fund-me-cu
make
```

---

### Optional: Gitpod

If you prefer not to install locally, you can work with this repo in Gitpod.  
> _Skip the clone step if using Gitpod._

[Open in Gitpod](https://gitpod.io/)

---

## 🧪 Usage

### Deploy

```bash
forge script script/DeployFundMe.s.sol
```

---

### Testing

This repo demonstrates 2 out of 4 testing tiers:

- ✅ Unit
- ⛔ Integration
- ✅ Forked
- ⛔ Staging

Run tests:

```bash
forge test
```

Run a specific test:

```bash
forge test --match-test testFunctionName
```

Run with forked chain:

```bash
forge test --fork-url $SEPOLIA_RPC_URL
```

---

### Test Coverage

```bash
forge coverage
```

---

## ⚙️ Local zkSync

### Additional Requirements

In addition to the above:

- **foundry-zksync**  
  ```bash
  forge --version
  ```
  Example:
  ```
  forge 0.0.2 (816e00b ...)
  ```

- **npm & npx**  
  ```bash
  npm --version
  npx --version
  ```

- **Docker**  
  ```bash
  docker --version
  docker --info
  ```

  Make sure Docker daemon is running.

---

### Setup local zkSync node

```bash
npx zksync-cli dev config
```

- Choose: **In-memory node**
- Skip extra modules

Start zkSync:

```bash
npx zksync-cli dev start
```

Sample output:
```
In memory node started v0.1.0-alpha.22:
 - RPC URL: http://127.0.0.1:8011
 - Rich accounts: [zkSync docs](https://era.zksync.io/docs/tools/testing/era-test-node.html#use-pre-configured-rich-wallets)
```

---

### Deploy to local zkSync node

```bash
make deploy-zk
```

---

## 🚀 Deployment to a Testnet or Mainnet

### Setup Environment Variables

Create a `.env` file:

```env
PRIVATE_KEY=your_private_key
SEPOLIA_RPC_URL=https://your-sepolia-url
ETHERSCAN_API_KEY=your_api_key (optional)
```

> ⚠️ **Use a dev key only. Never use a real wallet key.**

Get testnet ETH:  
Visit [faucets.chain.link](https://faucets.chain.link)

### Deploy

```bash
forge script script/DeployFundMe.s.sol   --rpc-url $SEPOLIA_RPC_URL   --private-key $PRIVATE_KEY   --broadcast   --verify   --etherscan-api-key $ETHERSCAN_API_KEY
```

---

## 📜 Scripts

### Interact with Contract

Fund the contract:

```bash
cast send <FUNDME_CONTRACT_ADDRESS> "fund()"   --value 0.1ether   --private-key <PRIVATE_KEY>
```

Alternatively:

```bash
forge script script/Interactions.s.sol:FundFundMe   --rpc-url sepolia   --private-key $PRIVATE_KEY   --broadcast
```

### Withdraw

```bash
cast send <FUNDME_CONTRACT_ADDRESS> "withdraw()"   --private-key <PRIVATE_KEY>
```

---

### Estimate Gas

```bash
forge snapshot
```

Look for `.gas-snapshot` in the root.

---

## 🧹 Formatting

To auto-format the code:

```bash
forge fmt
```

---




## ✅ Summary

- The Chainlink Brownie contracts repo is official.
- It pulls verified releases from npm.
- It's packaged for direct use in Foundry projects.

---

## 🙏 Thank You!

Happy building with Foundry and zkSync!  
Feel free to contribute, raise issues, or star the repo!
