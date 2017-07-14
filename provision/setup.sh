#!/bin/bash
echo "Provisioning virtual machine..."

echo "Updating apt and its sources"
sudo apt-get install curl -y > /dev/null
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get update

echo "Installing OpenCV dependencies"
sudo apt-get install build-essential -y > /dev/null
sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev -y > /dev/null

echo "Installing optional OpenCV dependencies"
sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev -y > /dev/null

echo "Installing OpenCV"
sudo apt-get install libopencv-dev -y > /dev/null

echo "Installing Imagemagick"
sudo apt-get install imagemagick -y > /dev/null

echo "Installing Node.js and npm"
sudo apt-get install -y nodejs > /dev/null

# There are issues with npm 5.0.3 where dependencies are not always installed.
# Using yarn instead
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt-get update && sudo apt-get install yarn
