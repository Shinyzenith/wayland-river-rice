function update --wraps='paru -Syyu --devel;paru -c' --description 'alias update=paru -Syyu --devel;paru -c'
  paru -Syyu --devel;paru -c $argv
        
end
