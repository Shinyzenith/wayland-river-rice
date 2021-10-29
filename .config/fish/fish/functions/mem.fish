function mem --wraps='ps axch -o cmd:15,%mem --sort=-%mem | head' --description 'alias mem=ps axch -o cmd:15,%mem --sort=-%mem | head'
  ps axch -o cmd:15,%mem --sort=-%mem | head $argv
        
end
