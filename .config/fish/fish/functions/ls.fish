function ls --wraps='exa -lhF --color=always --icons --sort=name --group-directories-first' --description 'alias ls=exa -lhF --color=always --icons --sort=name --group-directories-first'
  exa -lhF --color=always --icons --sort=name --group-directories-first $argv
        
end
