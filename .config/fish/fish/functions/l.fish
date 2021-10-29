function l --wraps='exa -lahF --color=always --icons --sort=name --group-directories-first' --description 'alias l=exa -lahF --color=always --icons --sort=name --group-directories-first'
  exa -lahF --color=always --icons --sort=name --group-directories-first $argv
        
end
