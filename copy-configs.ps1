Copy-Item ./komorebi/* ~/.config/komorebi
Copy-Item ./powershell/Microsoft.PowerShell_profile.ps1 ~/Documents/PowerShell
Copy-Item ./neovim/.config/* ~/AppData/Local/nvim -Recurse -Force
Copy-Item ./neovim/.nvim/* ~/.nvim -Recurse -Force
Copy-Item ./yasb/config/* ~/.yasb
