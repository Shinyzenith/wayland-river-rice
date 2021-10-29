function ripaur --wraps=pacman\ -Qm\ \|cut\ -d\ \'\ \'\ -f\ 1\|\ bat --description alias\ ripaur=pacman\ -Qm\ \|cut\ -d\ \'\ \'\ -f\ 1\|\ bat
  pacman -Qm |cut -d ' ' -f 1| bat $argv
        
end
