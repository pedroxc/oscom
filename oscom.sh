#!/usr/bin/env bash
# cria_m3u_msx.sh
# Uso: ./cria_m3u_msx.sh [NOME_DA_PLAYLIST.m3u]
set -euo pipefail

ROMDIR="${HOME}/RetroPie/roms/msx"
DSK1="${ROMDIR}/meujogo.dsk"
DSK2="${ROMDIR}/meudisco.dsk"
M3U="${ROMDIR}/${1:-playlist.m3u}"

# Confere pasta e arquivos
[[ -d "$ROMDIR" ]] || { echo "ERRO: Pasta não encontrada: $ROMDIR"; exit 1; }
[[ -f "$DSK1" ]] || { echo "ERRO: Não achei $DSK1"; exit 1; }
[[ -f "$DSK2" ]] || { echo "ERRO: Não achei $DSK2"; exit 1; }

# Cria o .m3u com caminhos absolutos (recomendado para RetroArch)
cat > "$M3U" <<EOF
$DSK1
$DSK2
EOF

echo "OK: Criado $M3U com:"
echo " - $DSK1"
echo " - $DSK2"
