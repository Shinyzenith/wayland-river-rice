function decrypt --wraps='gpg --no-symkey-cache' --description 'alias decrypt=gpg --no-symkey-cache'
  gpg --no-symkey-cache $argv
        
end
