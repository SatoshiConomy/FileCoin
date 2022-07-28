## https://lotus.filecoin.io/lotus/install/linux/
# Install dependencies
sudo apt install mesa-opencl-icd ocl-icd-opencl-dev gcc git bzr jq pkg-config curl clang build-essential hwloc libhwloc-dev wget -y && sudo apt upgrade -y

# Install Rust and GO and Compile from source GIT
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
wget -c https://golang.org/dl/go1.17.9.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local

# Add Lotus EnVar
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc && source ~/.bashrc

# Download Lotus Git
git clone https://github.com/filecoin-project/lotus.git
cd lotus/

# Clean/Make Commands will error out if executed in a directory with spaces/backslashes
git checkout v1.15.3
make clean all # Long pause without indications
sudo make install

# Install NCDU before going below, if concerned about storage capacity
# sudo apt-get install ncdu

## https://lotus.filecoin.io/lotus/manage/chain-management/
# Download 'light snapshot' of block chain ie: No msg receipts and current block - 2000 blocks
curl -sI https://fil-chain-snapshots-fallback.s3.amazonaws.com/mainnet/minimal_finality_stateroots_latest.car | perl -ne '/x-amz-website-redirect-location:\s(.+)\.car/ && print "$1.sha256sum\n$1.car"' | xargs wget

# Run checksum - This takes awhile with no progress indications
# Replace the filenames for `.sha256sum` and `.car` files based on snapshot filename

# echo "$(cut -c 1-64 minimal_finality_stateroots_1871999_2022-06-05_21-59-30.sha256sum) minimal_finality_stateroots_1871999_2022-06-05_21-59-30.car" | sha256sum --check

# Import Snapshot
lotus daemon --import-snapshot *.car
#lotus daemon --import-snapshot minimal_finality_stateroots_1871999_2022-06-05_21-59-30.car

## https://lotus.filecoin.io/lotus/manage/manage-fil
# Create Wallet
lotus wallet new
