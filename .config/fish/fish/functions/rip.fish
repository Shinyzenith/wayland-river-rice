function rip --wraps=pacman\ -Qe\|\ cut\ -d\'\ \'\ -f1\ \|\ bat --description alias\ rip=pacman\ -Qe\|\ cut\ -d\'\ \'\ -f1\ \|\ bat
  pacman -Qe| cut -d' ' -f1 | bat $argv
        
end
