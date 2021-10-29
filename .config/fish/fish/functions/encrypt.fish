function encrypt --wraps='gpg -c --no-symkey-cache --cipher-algo AES256' --description 'alias encrypt=gpg -c --no-symkey-cache --cipher-algo AES256'
  gpg -c --no-symkey-cache --cipher-algo AES256 $argv
        
end
