function gpglistkeys --wraps='gpg --list-keys --keyid-format LONG' --description 'alias gpglistkeys=gpg --list-keys --keyid-format LONG'
  gpg --list-keys --keyid-format LONG $argv
        
end
