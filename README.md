# FileCoin
A guide for downloading the FileCoin blockchain, creating a wallet and transferring off an Exchange.<br>
**"Not your keys, not your coins."**

![FIL](https://github.com/SatoshiConomy/FileCoin/blob/main/fil-satoshis.png)

# Requirements
- Ubuntu 22.04
- GO, RUST and LOTUS
- 75GB Storage - In/External
- 100GB Storage - Internal
- 4 Hours to download (est)
- 6.5 Hours to sync (est)

# Notes
75GB is used for 'light snapshot' of FileCoin's Blockchain. This is then cached on the drive where Ubuntu is installed in `$HOME/.lotus/` directory resulting in an additional 100GB of storage used.

4 hours for download is with a decent, direct connection. Likely throttled by host service. Creating a wallet on the BC can be done as soon as a snapshot is imported, before spending additional 6hrs syncing up. Allowing transfers.

The sync enables verification of a money/FIL transfer. That is, the balance of a new wallet cannot be viewed if a transaction just took place and the blockchain isn't synced to the time of the transaction. Approximately 8 messages are synced/minute. The session imaged above required 3197. A wallet balance can be verified without a sync using a blockchain explorer: https://filfox.info/en

Crypto.com Mobile App requires a 24hr wait time to transfer coin to a new wallet. Advised to add new wallet as soon as snapshot is imported and prior to sync. Use a free QR code generator to scan (already public) wallet address into Crypto.com App to avoid any typos. The following transaction was completed and showing in under 2 minutes!

![FIL](https://github.com/SatoshiConomy/FileCoin/blob/main/tx-receipt.jpg)

# Installation
- **Do not** Make/clean/install from a directory with spaces [backslashes] as there is a bug in installation files.
- Run `install-filecoin.sh` script. Without editting, this will install all dependencies and lotus. Script is annoted with further info. The time consuming parts (downloading/importing snapshot) are commented out. Simply uncomment to run full 4hr installation and download.

# Wallet
- Online backup: `lotus wallet export filwalletstring > ~/Desktop/filwalletstring.key` to export wallet from a node.
- Offline backup: Copy wallet nodes located in `~/.lotus/keystore`. Backup entire folder to airgapped device for added security.
- Import: `lotus wallet import filwalletstring.key` will import a previously backed up wallet and/or simply copy back to same directory.

![FIL](https://github.com/SatoshiConomy/FileCoin/blob/main/screenshot.png)

# Screen Session
- Top Left (3 Bash): `htop` Provides resource usage and used to make sure nothing has frozen
- Top Middle (2 Bash): `df -h` While loop to monitor disk usage
- Top Right (4 Bash) `ncdu` Displays `.lotus` file usage
- Bottom Left (0 Bash) `lotus daemon` Lotus daemon syncing up to current block
- Bottom Right (1 Bash) `lotus sync wait` Status of lotus BC sync

# Resources:
- **Download/Import/Sync Blockchain**: https://lotus.filecoin.io/lotus/manage/chain-management/
- **Install Lotus**: https://lotus.filecoin.io/lotus/install/linux/
- **Wallet Info**: https://lotus.filecoin.io/lotus/manage/manage-fil
