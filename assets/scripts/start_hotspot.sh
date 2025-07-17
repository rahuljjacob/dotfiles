nmcli r wifi off
rfkill unblock wlan
nmcli r wifi on
sudo create_ap wlan0 wlan0 laptop qwertyui --freq-band 2.4