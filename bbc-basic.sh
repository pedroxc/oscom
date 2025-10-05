#!/bin/bash
set -e

echo "=== Instalando dependências para compilar BBCSDL ==="
sudo apt update
sudo apt install -y build-essential libsdl2-dev libsdl2-image-dev libsdl2-ttf-dev libasound2-dev

echo "=== Clonando repositório BBCSDL ==="
cd ~
git clone https://github.com/rtrussell/BBCSDL.git
cd BBCSDL

echo "=== Compilando BBC BASIC SDL ==="
make clean
make LINUX=1 BCM=1

echo "=== Instalando ==="
sudo make install

echo "=== Pronto! Para rodar: bbc (ou bbc-sdl) ==="
