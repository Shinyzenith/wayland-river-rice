function lst --wraps='exa -lahFT --color=always --icons --sort=name --group-directories-first' --description 'alias lst=exa -lahFT --color=always --icons --sort=name --group-directories-first'
  exa -lahFT --color=always --icons --sort=name --group-directories-first $argv
        
end
