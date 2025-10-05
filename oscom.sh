sudo apt install -y git build-essential libsdl1.2-dev

cd ~
git clone https://github.com/stardot/brandy.git
cd brandy/src

make -f Makefile.RPi
