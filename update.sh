#!/bin/bash

reset

# temp workdir
rm -rf temp; mkdir temp; cd temp

# Get Releases
response=$(curl -s "https://api.github.com/repos/develsoftware/GMinerRelease/releases/latest")
download_url=$(echo "$response" | grep -E '"browser_download_url".*([^.]linux.*)"' | sed -E 's/.*"([^"]+)".*/\1/')
wget $download_url -O gminer.tar.xz

response=$(curl -s "https://api.github.com/repos/Lolliedieb/lolMiner-releases/releases/latest")
download_url=$(echo "$response" | grep -E '"browser_download_url".*([^.]Lin64.*)"' | sed -E 's/.*"([^"]+)".*/\1/')
wget $download_url -O lolminer.tar.gz

response=$(curl -s "https://api.github.com/repos/nanopool/nanominer/releases/latest")
download_url=$(echo "$response" | grep -E '"browser_download_url".*([^.]linux.*)"' | sed -E 's/.*"([^"]+)".*/\1/')
wget $download_url -O nanominer.tar.gz


# Extract releases
tar -xf gminer.tar.xz
tar -xf lolminer.tar.gz
tar -xf nanominer.tar.gz

# Remove unwanted items
mv miner ../gminer
mv nanominer ../nanom
mv `find . -name "lolMiner"` ../lolm

cd ../; rm -rf temp
