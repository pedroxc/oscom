cd ~
rm -rf blueberryMSX
git clone --branch rpi1 https://github.com/0xe1f/blueberryMSX.git
cd blueberryMSX
sudo apt update
sudo apt install libsdl1.2-dev zlib1g-dev build-essential
make RPI1=1
