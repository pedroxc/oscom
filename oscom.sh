cd ~/SmallBASIC
git submodule update --init --recursive
make clean
./configure --enable-sdl2
make
sudo make install
