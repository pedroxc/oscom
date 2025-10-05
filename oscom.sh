echo "=== Tentando instalar BBC BASIC (SDL) ==="
if command -v bbc >/dev/null 2>&1; then
  echo "BBC BASIC já instalado"
else
  # tenta compilar
  sudo apt install -y libsdl2-dev libsdl2-ttf-dev libsdl2-image-dev libasound2-dev
  cd ~
  git clone https://github.com/rtrussell/BBCSDL.git || true
  cd BBCSDL
  make clean || true
  make LINUX=1 BCM=1 || true
  sudo make install || true
  cd ~
fi

echo "=== Verificando BASIC instalados / disponíveis ==="
# Verificar comando bbc ou tinybc
if command -v bbc >/dev/null 2>&1; then
  echo "BBC BASIC: instalado"
else
  echo "BBC BASIC: não detectado"
fi
if command -v tinybc >/dev/null 2>&1; then
  echo "tinybc (BASIC modo texto): instalado"
else
  echo "tinybc: não detectado"
fi
