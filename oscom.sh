#!/bin/bash
# Teste de instalação do BlueberryMSX no Raspberry Pi

# Caminho padrão (mude se estiver em outro lugar)
BBMSX_DIR="$HOME/blueberryMSX"
ROM_DIR="$BBMSX_DIR/roms"
BIN="$BBMSX_DIR/bbmsx"

echo "🔍 Testando instalação do BlueberryMSX..."
echo "------------------------------------------"

# 1️⃣ Verifica se o diretório existe
if [ ! -d "$BBMSX_DIR" ]; then
  echo "❌ Pasta $BBMSX_DIR não encontrada."
  echo "💡 Dica: clone o repositório com 'git clone https://github.com/0xe1f/blueberryMSX.git'"
  exit 1
else
  echo "✅ Pasta encontrada: $BBMSX_DIR"
fi

# 2️⃣ Verifica se o binário existe
if [ ! -f "$BIN" ]; then
  echo "❌ Arquivo bbmsx não encontrado!"
  echo "💡 Rode 'make RPI1=1' dentro da pasta para compilar."
  exit 1
else
  echo "✅ Binário encontrado: $BIN"
fi

# 3️⃣ Testa permissão de execução
if [ ! -x "$BIN" ]; then
  echo "⚠️  Corrigindo permissão de execução..."
  chmod +x "$BIN"
  echo "✅ Permissão ajustada."
fi

# 4️⃣ Checa as ROMs obrigatórias
MISSING=0
for rom in MSX.ROM MSX-BASIC.ROM MSX-CHAR.ROM; do
  if [ ! -f "$ROM_DIR/$rom" ]; then
    echo "❌ ROM ausente: $ROM_DIR/$rom"
    MISSING=1
  else
    echo "✅ ROM encontrada: $rom"
  fi
done

if [ $MISSING -eq 1 ]; then
  echo "💡 Copie as ROMs C-BIOS renomeadas para a pasta $ROM_DIR"
  exit 1
fi

# 5️⃣ Teste rápido de execução
echo "🚀 Rodando teste rápido (modo msx1, sem vídeo)..."
$BIN -msx1 -version >/dev/null 2>&1
if [ $? -eq 0 ]; then
  echo "✅ BlueberryMSX foi executado corretamente!"
else
  echo "❌ Houve um erro ao iniciar o BlueberryMSX."
  echo "💡 Verifique se o SDL2 está instalado: 'sudo apt install libsdl2-dev'"
  exit 1
fi

echo "------------------------------------------"
echo "🎉 Tudo pronto! Execute './bbmsx -msx1' para iniciar o MSX BASIC."
echo "Digite '10 SCREEN 2' e 'RUN' para testar gráficos."
