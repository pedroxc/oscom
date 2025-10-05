cd ~
rm -rf SmallBASIC
sudo apt install -y build-essential git autoconf automake pkg-config libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libsdl2-gfx-dev libfreetype6-dev libfontconfig1-dev
git clone --recurse-submodules https://github.com/smallbasic/SmallBASIC.git
cd SmallBASIC
./autogen.sh
./configure --enable-sdl2
make
sudo make install
