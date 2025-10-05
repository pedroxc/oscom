#!/bin/bash
# ===============================================
# Retro Pi Zero - Verificação de Instalação
# Autor: Pedro
# ===============================================

# Função auxiliar
check_command() {
  if command -v "$1" &> /dev/null; then
    echo -e "✅ \e[32m$2\e[0m encontrado: \e[90m($1)\e[0m"
  else
    echo -e "❌ \e[31m$2\e[0m não encontrado"
  fi
}

echo -e "\n===== 🔍 Verificando sistema Retro Pi Zero =====\n"

# --- Básico do sistema ---
check_command dosbox        "MS-DOS (DOSBox)"
check_command openmsx       "MSX (openMSX)"
check_command x64           "Commodore 64 (VICE)"
check_command retroarch     "RetroArch"
check_command bas           "Tiny BASIC"
check_command fbc           "FreeBASIC"
check_command bbc           "BBC BASIC"
check_command ranger        "Gerenciador Ranger"
check_command tmux          "Gerenciador de sessões (tmux)"
check_command screen        "Gerenciador de terminal (screen)"

# --- Dependências principais ---
echo -e "\n===== 📦 Verificando bibliotecas SDL ====="
for pkg in libsdl2-2.0-0 libsdl2-mixer-2.0-0 libsdl2-ttf-2.0-0 libsdl2-image-2.0-0; do
  if dpkg -l | grep -q "^ii  $pkg "; then
    echo -e "✅ \e[32m$pkg\e[0m instalado"
  else
    echo -e "❌ \e[31m$pkg\e[0m ausente"
  fi
done

# --- Teste rápido de execução ---
echo -e "\n===== 🧪 Teste rápido ====="
if command -v bbc &> /dev/null; then
  echo "Executando BBC BASIC em modo de teste..."
  timeout 2 bbc > /dev/null 2>&1 && echo -e "✅ \e[32mBBC BASIC executa corretamente\e[0m" || echo -e "⚠️ \e[33mBBC BASIC não respondeu (pode precisar de SDL ativo)\e[0m"
fi

if command -v x64 &> /dev/null; then
  echo "Testando inicialização do VICE (modo silencioso)..."
  timeout 2 x64 -console > /dev/null 2>&1 && echo -e "✅ \e[32mVICE inicia corretamente\e[0m" || echo -e "⚠️ \e[33mVICE não respondeu (verifique SDL)\e[0m"
fi

echo -e "\n===== ✅ Verificação concluída ====="
echo -e "Se algum pacote aparecer como ausente, use: \e[36msudo apt install <nome>\e[0m\n"
