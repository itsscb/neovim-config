# neovim-config

## Linux

### Create a backup of current config and shared folder of your nvim instance

```
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
```

### Clone this template repository and run the setup script

```
git clone --depth 1 https://github.com/itsscb/neovim-config ~/.config/nvim
rm -rf ~/.config/nvim/.git
chmod +x ~/.config/nvim/setup.sh
~/.config/nvim/setup.sh
```

## Windows

### Create a backup of current config and shared folder of your nvim instance
```
Rename-Item -Path $env:LOCALAPPDATA\nvim -NewName $env:LOCALAPPDATA\nvim.bak
Rename-Item -Path $env:LOCALAPPDATA\nvim-data -NewName $env:LOCALAPPDATA\nvim-data.bak
```

### Clone this template repository and run the setup script

`TODO:` Add *PowerShell*-Script and update this section

```
git clone --depth 1 https://github.com/itsscb/neovim-config (Join-Path $env:LOCALAPPDATA -ChildPath 'nvim')

```
