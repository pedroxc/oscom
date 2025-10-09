sudo apt update
sudo apt install -y dosfstools mtools
mkfs.fat -C -F 12 -n MSXDISK ~/RetroPie/roms/msx/meudisco.dsk 720
