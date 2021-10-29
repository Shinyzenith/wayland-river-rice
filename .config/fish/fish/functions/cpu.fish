function cpu --wraps='ps axch -o cmd:15,%cpu --sort=-%cpu | head' --description 'alias cpu=ps axch -o cmd:15,%cpu --sort=-%cpu | head'
  ps axch -o cmd:15,%cpu --sort=-%cpu | head $argv
        
end
