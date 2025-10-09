#!/usr/bin/env bash
# grava_msx_basic.sh
# Cria HELLO.BAS e grava dentro do DSK do MSX.
# Uso: ./grava_msx_basic.sh [NOME_NO_DISCO.BAS]
set -euo pipefail

DSK="${HOME}/RetroPie/roms/msx/meudisco.dsk"
BAS_NAME="${1:-HELLO.BAS}"

# 1) Checagens
command -v mcopy >/dev/null || { echo "Instale o mtools: sudo apt update && sudo apt install -y mtools"; exit 1; }
[[ -f "$DSK" ]] || { echo "ERRO: não achei o DSK em $DSK"; exit 1; }

# 2) Criar arquivo BASIC (ASCII)
TMP="$(mktemp)"
cat > "$TMP" <<'BASIC'
10 PRINT ("HELLO BASIC")
20 END
BASIC

# 3) Copiar para dentro do DSK (raiz do A:)
mcopy -i "$DSK" "$TMP" "::${BAS_NAME}"

# 4) Listar conteúdo do DSK para conferência
echo "Conteúdo do disco após gravação:"
mdir -i "$DSK" ::

echo "OK: ${BAS_NAME} gravado dentro de $(basename "$DSK")"
echo "No MSX-BASIC, use:"
echo '  LOAD "A:'"${BAS_NAME}"'",R'
echo "  RUN"

# limpar temporário
rm -f "$TMP"
