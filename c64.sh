sudo apt update
sudo apt install -y autoconf automake libtool pkg-config \
                     libasound2-dev libgtk2.0-dev libfreetype6-dev \
                     libpng-dev libjpeg-dev libx11-dev libxrandr-dev \
                     libsdl2-dev

cd ~
git clone https://sourceforge.net/p/vice-emu/vice-code/ci/master/tree vice
cd vice
./autogen.sh
./configure --host=arm-linux-gnueabihf --disable-video-opengl # ou ajustes de vídeo leve
make -j2
sudo make install
