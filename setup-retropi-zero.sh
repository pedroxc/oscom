#!/bin/bash
# ===============================================
# Retro Pi Zero Setup Script
# Autor: Pedro
# ===============================================

echo "=== Atualizando sistema ==="
sudo apt update && sudo apt upgrade -y

echo "=== Instalando pacotes essenciais ==="
sudo apt install -y build-essential git unzip joystick python3-pip curl wget dialog libsdl2-2.0-0 libsdl2-mixer-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0 screen tmux ranger mc

echo "=== Instalando BASIC ==="
sudo apt install -y freebasic bas

echo "=== Instalando DOSBox ==="
sudo apt install -y dosbox

echo "=== Instalando openMSX ==="
sudo apt install -y openmsx

echo "=== Instalando VICE (Commodore 64) ==="
sudo apt install -y vice

echo "=== Instalando RetroArch ==="
sudo apt install -y retroarch retroarch-assets retroarch-dbg

echo "=== Criando pastas de ROMs ==="
mkdir -p ~/roms/{dos,msx,c64,retroarch}

echo "=== Criando menu retrô ==="
cat << 'EOF' > ~/retro-menu.sh
#!/bin/bash
while true; do
  clear
  echo "==== Retro Pi Zero ===="
  echo "1) BASIC"
  echo "2) DOSBox"
  echo "3) MSX (openMSX)"
  echo "4) Commodore 64 (VICE)"
  echo "5) RetroArch"
  echo "q) Sair"
  echo "======================="
  read -n1 -p "Escolha: " opt
  echo
  case $opt in
    1) bas ;;
    2) dosbox ;;
    3) openmsx ;;
    4) x64 ;;
    5) retroarch ;;
    q) exit 0 ;;
  esac
done
EOF

chmod +x ~/retro-menu.sh

echo "=== Instalação concluída! ==="
echo "Execute agora: ./retro-menu.sh"
