function updatefonts --wraps='doas fc-cache -fv' --description 'alias updatefonts=doas fc-cache -fv'
  doas fc-cache -fv $argv
        
end
