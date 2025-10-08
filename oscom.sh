sudo install -d -o lightdm -g lightdm /var/lib/lightdm/data
sudo apt update
sudo apt install --no-install-recommends \
  xserver-xorg lightdm raspberrypi-ui-mods pi-greeter \
  lxsession openbox rpd-icons rpd-plym-splash
