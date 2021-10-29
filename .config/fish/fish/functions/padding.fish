function padding --wraps=sed\ -i\ \'s/^\#\ pad\\\(.\*\\\)/pad\\1/g\'\ \~/.config/foot/foot.ini --description alias\ padding=sed\ -i\ \'s/^\#\ pad\\\(.\*\\\)/pad\\1/g\'\ \~/.config/foot/foot.ini
  sed -i 's/^# pad\(.*\)/pad\1/g' ~/.config/foot/foot.ini $argv
        
end
