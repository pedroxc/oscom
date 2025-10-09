# 1) Garanta hotkeys mínimas no GLOBAL
sudo sed -i '/^input_enable_hotkey/d;/^input_menu_toggle/d;/^input_exit_emulator/d;/^input_save_state/d;/^input_load_state/d' /opt/retropie/configs/all/retroarch.cfg
sudo tee -a /opt/retropie/configs/all/retroarch.cfg >/dev/null <<'INI'
input_enable_hotkey = "rctrl"
input_menu_toggle   = "f1"
input_exit_emulator = "escape"
input_save_state    = "f2"
input_load_state    = "f4"
INI

# 2) (Opcional) limpe o por-sistema de MSX se existir
sudo rm -f /opt/retropie/configs/msx/retroarch.cfg 2>/dev/null

# 3) Reinicie a EmulationStation
emulationstation --restart
