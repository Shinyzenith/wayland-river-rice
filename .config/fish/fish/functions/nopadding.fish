function nopadding --wraps=sed\ -i\ \'s/^pad\\\(.\*\\\)/\#\ pad\\1/g\'\ \~/.config/foot/foot.ini --description alias\ nopadding=sed\ -i\ \'s/^pad\\\(.\*\\\)/\#\ pad\\1/g\'\ \~/.config/foot/foot.ini
  sed -i 's/^pad\(.*\)/# pad\1/g' ~/.config/foot/foot.ini $argv
        
end
