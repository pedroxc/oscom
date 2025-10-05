cd ~
wget http://ftp.debian.org/debian/pool/main/v/vice/vice_3.3.0+dfsg-2_armhf.deb
sudo dpkg -i vice_3.3.0+dfsg-2_armhf.deb || sudo apt -f install -y
