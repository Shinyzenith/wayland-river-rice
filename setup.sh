#!/usr/bin/env bash
# installing our package manager
doas pacman -S --noconfirm --needed git
if ! command -v paru &> /dev/null
then
	git clone https://aur.archlinux.org/paru-bin.git /tmp/paru-bin-cloned
	cd /tmp/paru-bin-cloned/
	makepkg -sfci --noconfirm --needed
fi

cd ~/.config/.dotfiles
doas cp ./assets/pacman.conf /etc/pacman.conf
doas pacman -Syy

# arch linux support
doas pacman -S --noconfirm --needed artix-archlinux-support
doas pacman-key --init
doas pacman-key --populate artix
doas pacman-key --populate archlinux


# makepkg.conf optimization
numberofcores=$(grep -c ^processor /proc/cpuinfo)
if [ $numberofcores -gt 1 ]
then
        doas sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j'$(($numberofcores+1))'"/g' /etc/makepkg.conf;
        doas sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -z - --threads=0)/g' /etc/makepkg.conf
        doas sed -i 's/COMPRESSZST=(zstd -c -z -q -)/COMPRESSZST=(zstd -c -z -q - --threads=0)/g' /etc/makepkg.conf
        doas sed -i "s/PKGEXT='.pkg.tar.xz'/PKGEXT='.pkg.tar.zst'/g" /etc/makepkg.conf
else
        echo "makepkg.conf not changed."
fi


# Doom emacs.
# paru -S emacs-gcc-wayland-devel-bin --noconfirm
# export DOOMDIR="${XDG_CONFIG_HOME:-$HOME/.config}/doom"
# git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
# ~/.config/emacs/bin/doom install
# rm -rf ~/.config/doom
# ~/.config/emacs/bin/doom sync

for line in $(cat ./assets/packagelist)
do
	doas pacman -S --noconfirm --needed $line
done

for line in $(cat ./assets/aurlist)
do
	if [[ $(pacman -Qs $line) == "" ]]
	then
		paru -S --noconfirm --needed $line
	fi
done

#cleaning up orphans
doas pacman -Rns --noconfirm sudo
doas pacman -Rns --noconfirm scdoc
doas pacman -Rdd --noconfirm xorg-server
doas pacman -Rdd --noconfirm foot-themes
doas pacman -Rns --noconfirm python-pytest
doas pacman -S --needed wireplumber
doas pacman -S --needed pipewire-pulse
paru -c --noconfirm
paru --gendb

doas ln -s /etc/runit/sv/bluetoothd /run/runit/service
doas ln -s /etc/runit/sv/sshd /run/runit/service

xdg-user-dirs-update &
cd ~/.config/.dotfiles
doas mkdir /usr/share/btop/themes
doas cp ./assets/tokyo.theme /usr/share/btop/themes/tokyo.theme
./config.sh
doas ln -s ~/.config/swhkd/swhkdrc /etc/swhkd/swhkdrc
doas python3 -m pip install neovim
doas python3 -m pip install beautifulsoup4
doas npm install neovim --global
doas npm install prettier --global
mkdir -p ~/Pictures/screenshots
mkdir -p ~/Videos/recordings
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
nvim -c :PackerSync -c :exit -c :exit
doas mkdir -p /usr/share/icons/default
doas touch /usr/share/icons/default/index.theme
doas chown $USER /usr/share/icons/default/index.theme
doas chown $USER /usr/share/backgrounds
doas echo "[Icon Theme]" > /usr/share/icons/default/index.theme
doas echo "Inherits=macOSBigSur" >> /usr/share/icons/default/index.theme
doas chown root /usr/share/icons/default/index.theme
doas gpasswd -a $USER video
doas gpasswd -a $USER power
doas gpasswd -a $USER audio
rm -rf .bash_history
rm -rf .bash_logout
rm -rf .bashrc
rm -rf .viminfo
rm -rf ~/.npm
rm -rf ~/Templates
rm -rf ~/Public
xdg-user-dirs-update
chsh --shell $(which zsh) $USER
