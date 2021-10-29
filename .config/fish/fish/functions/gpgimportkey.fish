function gpgimportkey --wraps='gpg --import' --description 'alias gpgimportkey=gpg --import'
  gpg --import $argv
        
end
