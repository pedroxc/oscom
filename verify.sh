echo "=== Verificando pacotes instalados ==="

# Lista de pacotes esperados
PACKAGES=(
  dosbox
  openmsx
  vice
  retroarch
  joystick
  libsdl2-2.0-0
  libsdl2-mixer-2.0-0
  libsdl2-ttf-2.0-0
  libsdl2-image-2.0-0
)

# Cabeçalho bonito
printf "\n%-25s | %-10s\n" "PACOTE" "STATUS"
printf -- "-----------------------------------------\n"

# Verificação um a um
for pkg in "${PACKAGES[@]}"; do
  if dpkg -l | grep -q "^ii  $pkg "; then
    printf "%-25s | \e[32mINSTALADO\e[0m\n" "$pkg"
  else
    printf "%-25s | \e[31mFALTOU\e[0m\n" "$pkg"
  fi
done

printf "\n"
echo "=== Verificação finalizada ==="
echo "Se algum pacote faltou, tente instalar manualmente com: sudo apt install <nome>"
