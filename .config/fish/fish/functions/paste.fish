function paste --wraps='cat "$(find . -type f | fzf  --preview "bat --color=always --style=numbers --line-range=:500 {}")" | curl -sF "sprunge=<-" http://sprunge.us|wl-copy && wl-paste' --description 'alias paste=cat "$(find . -type f | fzf  --preview "bat --color=always --style=numbers --line-range=:500 {}")" | curl -sF "sprunge=<-" http://sprunge.us|wl-copy && wl-paste'
  cat "$(find . -type f | fzf  --preview "bat --color=always --style=numbers --line-range=:500 {}")" | curl -sF "sprunge=<-" http://sprunge.us|wl-copy && wl-paste $argv
        
end
