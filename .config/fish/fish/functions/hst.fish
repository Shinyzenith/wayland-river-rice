function hst --wraps=history\ 1\ -1\ \|\ cut\ -c\ 8-\ \|\ sort\ \|\ uniq\ \|\ fzf\ \ --tiebreak=begin\ \|\ tr\ -d\ \'\\n\'\ \|\ wl-copy --description alias\ hst=history\ 1\ -1\ \|\ cut\ -c\ 8-\ \|\ sort\ \|\ uniq\ \|\ fzf\ \ --tiebreak=begin\ \|\ tr\ -d\ \'\\n\'\ \|\ wl-copy
  history 1 -1 | cut -c 8- | sort | uniq | fzf  --tiebreak=begin | tr -d '\n' | wl-copy $argv
        
end
