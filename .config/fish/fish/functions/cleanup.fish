function cleanup --wraps='doas pacman -Rns ; paru -c' --description 'alias cleanup=doas pacman -Rns ; paru -c'
  doas pacman -Rns ; paru -c $argv
        
end
