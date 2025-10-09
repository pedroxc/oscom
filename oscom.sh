echo "pedro"

sudo mkdir -p /opt/retropie/configs/all/retroarch/config/blueMSX
sudo tee /opt/retropie/configs/all/retroarch/config/blueMSX/blueMSX.cfg >/dev/null <<'INI'
# Exigir tecla modificadora: SEM ela nada dispara
input_enable_hotkey = "rctrl"

# Agora os atalhos exigem RightCtrl + tecla
input_menu_toggle   = "f1"      # abre menu: RCTRL + F1
input_exit_emulator = "escape"  # sair:     RCTRL + Esc
input_save_state    = "f2"      # salvar:   RCTRL + F2
input_load_state    = "f4"      # carregar: RCTRL + F4
INI
