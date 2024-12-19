# Thing To Do On A Fresh Arch Install

- Install And Configure *UPower* For Hibernation On Low Power
- Modify Logind To Enable Hibernation When Lid Is Closed
- Install `xdg-desktop-portal-gtk` For Browser Based Authentication Of Applications
- Configure Autorandr To Allow Monitor Switching When Docked

## UPower

Install UPower:
```
sudo pacman -S upower
```

Edit UPower Configuration:
```
sudoedit /etc/UPower/UPower.conf
```

Add The Following Lines:
```
PercentageLow=15
PercentageCritical=10
PercentageAction=5
CriticalPowerAction=Hibernate
```

Restart UPower:
```
sudo systemctl restart upower
```
## Logind

Edit Logind Configuration File:
```
sudoedit /etc/systemd/logind.conf
```

Add The Following Lines:
```
HandleLidSwitch=hibernate
HandleLidSwitchExternalPower=hibernate
HandleLidSwitchDocked=ignore
```

Restart `systemd-logind` To Apply The Changes:
```
sudo systemctl restart systemd-logind
```
## Autorandr Config

Install Autorandr:
```
sudo pacman -S autorandr
```

Save An Undocked Preset:
```
autorandr --save undocked
```

Save A Docked Preset:
```
autorandr --save docked
```

Create A User-Level Systemd Service File for Autorandr:
```
nvim ~/.config/systemd/user/autorandr.service
```

Add The Following Content:
```
[Unit]
Description=Autorandr execution
After=graphical.target

[Service]
ExecStart=/usr/bin/autorandr --change
Restart=on-failure

[Install]
WantedBy=default.target
```

Reload The Systemd User Units To Recognize The New Service:
```
systemctl --user daemon-reload
```

Enable The Service To Start At Login:
```
systemctl --user enable autorandr.service
```

Start The Service Immediately:
```
systemctl --user start autorandr.service
```

To Ensure User Services Run Automatically, Enable The `default.target` For The User:
```
sudo loginctl enable-linger $(whoami)
```
