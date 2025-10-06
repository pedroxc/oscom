cd ~
git clone https://github.com/0xe1f/blueberryMSX.git
cd blueberryMSX
git checkout 7e021f6   # commit antigo estável antes das mudanças SDL2
sudo apt install libsdl1.2-dev zlib1g-dev build-essential
make clean
make RPI1=1
