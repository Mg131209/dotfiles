# Usage
```
stow <config>
## use --rebase to adopt other configs
```
## Fixe playback isues
```
sudo pacman -S pipewire pipewire-pulse wireplumber
systemctl --user enable --now pipewire pipewire-pulse wireplumber
```
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```
# Zsh plugins
```
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```
# Dependenys
```
paru -S wofi waybar pulseaudio yazi wlogout neovim nwg-look nwg-displays nmtui-go swaync ttf-jetbrains-mono zsh stow
``
## hypr
- hyprland
- hyprpaper
- hypridle
- hyprlock
## other
- wofi
- waybar
- kitty
- pulseaudio
- yazi
- wlogout
- Nvim
- nwg-look
- nwg-displays
- nmtui-go
- swaync
- ttf-jetbrains-mono
- zsh
- stow
