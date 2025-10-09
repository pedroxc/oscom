#!/usr/bin/env bash
# salva_bas_no_dsk.sh
# Copia todos os .BAS de ~/oscom para dentro do meudisco.dsk
# Uso:
#   ./salva_bas_no_dsk.sh                 # copia para a raiz do disquete
#   ./salva_bas_no_dsk.sh BAS             # copia para a pasta BAS dentro do disquete

set -euo pipefail

SRC_DIR="${HOME}/oscom"
DSK="${HOME}/RetroPie/roms/msx/meudisco.dsk"
DST_DIR_IN_DSK="${1:-/}"      # "/" = raiz do disquete; ou algo como "BAS" / "GAMES"

need() { command -v "$1" >/dev/null || { echo "Falta $1. Instale: sudo apt update && sudo apt install -y $1"; exit 1; }; }

need mcopy
need mdir
# unix2dos é opcional (só se você quiser CRLF)
if ! command -v unix2dos >/dev/null; then
  echo "Aviso: unix2dos não encontrado (opcional). Para instalar: sudo apt install -y dos2unix"
fi

[[ -f "$DSK" ]] || { echo "ERRO: não achei o disquete: $DSK"; exit 1; }
[[ -d "$SRC_DIR" ]] || { echo "ERRO: não achei a pasta de origem: $SRC_DIR"; exit 1; }

shopt -s nullglob
BAS_LIST=( "$SRC_DIR"/*.BAS "$SRC_DIR"/*.bas )
if (( ${#BAS_LIST[@]} == 0 )); then
  echo "Nenhum .BAS encontrado em $SRC_DIR"
  exit 1
fi

# Cria a pasta destino dentro do DSK (se não for raiz)
if [[ "$DST_DIR_IN_DSK" != "/" ]]; then
  mmd -i "$DSK" "::/${DST_DIR_IN_DSK}" 2>/dev/null || true
fi

echo "Copiando para $DSK -> ::/${DST_DIR_IN_DSK}"
TMPDIR="$(mktemp -d)" ; trap 'rm -rf "$TMPDIR"' EXIT

for f in "${BAS_LIST[@]}"; do
  base="$(basename "$f")"
  # (opcional) converter para CRLF para ficar 100% DOS-friendly
  if command -v unix2dos >/dev/null; then
    cp -f "$f" "$TMPDIR/$base"
    unix2dos -q "$TMPDIR/$base"
    SRC_TO_COPY="$TMPDIR/$base"
  else
    SRC_TO_COPY="$f"
  fi
  # copia para dentro do DSK
  mcopy -i "$DSK" "$SRC_TO_COPY" "::/${DST_DIR_IN_DSK}"
  echo " - $base"
done

echo
echo "Conteúdo do disquete agora:"
mdir -i "$DSK" "::/${DST_DIR_IN_DSK}"
echo "Pronto! No MSX-BASIC use:  LOAD \"A:ARQUIVO.BAS\",R  e depois RUN"
