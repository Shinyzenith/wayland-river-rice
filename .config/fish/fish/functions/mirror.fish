function mirror --wraps='doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist-arch;rankmirrors /etc/pacman.d/mirrorlist| doas tee /etc/pacman.d/mirrorlist' --description 'alias mirror=doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist-arch;rankmirrors /etc/pacman.d/mirrorlist| doas tee /etc/pacman.d/mirrorlist'
  doas reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist-arch;rankmirrors /etc/pacman.d/mirrorlist| doas tee /etc/pacman.d/mirrorlist $argv
        
end
