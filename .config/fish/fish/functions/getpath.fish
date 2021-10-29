function getpath --wraps=find\ -type\ f\ \|\ fzf\ --preview\ \'bat\ --color=always\ --style=numbers\ --line-range=:500\ \{\}\'\|\ sed\ \'s/^..//g\'\ \|\ wl-copy\ -n --description alias\ getpath=find\ -type\ f\ \|\ fzf\ --preview\ \'bat\ --color=always\ --style=numbers\ --line-range=:500\ \{\}\'\|\ sed\ \'s/^..//g\'\ \|\ wl-copy\ -n
  find -type f | fzf --preview 'bat --color=always --style=numbers --line-range=:500 {}'| sed 's/^..//g' | wl-copy -n $argv
        
end
