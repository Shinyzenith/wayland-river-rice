function gpgexportprivkey --wraps='gpg --export-secret-keys --armor' --description 'alias gpgexportprivkey=gpg --export-secret-keys --armor'
  gpg --export-secret-keys --armor $argv
        
end
