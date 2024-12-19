# Thing To Do On A Fresh Arch Install

- Install And Configure *UPower* For Hibernation On Low Power
- Modify Logind To Enable Hibernation When Lid Is Closed
- Install `xdg-desktop-portal-gtk` For Browser Based Authentication Of Applications

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
