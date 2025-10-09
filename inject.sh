# 1) (uma vez) ferramentas
sudo apt update && sudo apt install -y mtools dosfstools

# 2) crie um DSK novo, FAT12 720 KB (sem cabeçalho)
mkfs.fat -C -F 12 -n MSXDISK ~/RetroPie/roms/msx/WORK.dsk 720

# 3) copie seus .BAS para dentro
mcopy -i ~/RetroPie/roms/msx/WORK.dsk ~/oscom/*.BAS ::

# 4) confirmar
mdir  -i ~/RetroPie/roms/msx/WORK.dsk ::

# 5) no emulador, carregue o WORK.dsk e no BASIC:
# FILES("A:") / LOAD "A:SEUARQ.BAS",R / RUN
