sudo apt update
sudo apt install -y dosfstools mtools
mkfs.fat -C -F 12 -n MSXDISK ~/RetroPie/roms/msx/meujogo.dsk 720
mkdir -p ~/msx_dsk
sudo mount -o loop,uid=$USER,gid=$USER ~/RetroPie/roms/msx/meujogo.dsk ~/msx_dsk

# copie seus arquivos .BAS/.BIN/.COM etc para dentro do disco
cp -v ~/RetroPie/roms/msx/SEUARQ.BAS ~/msx_dsk/
# (repita para os outros)

sync
sudo umount ~/msx_dsk
