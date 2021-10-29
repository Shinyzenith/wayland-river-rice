function webcam --wraps='setsid -f mpv --profile=low-latency --no-cache --untimed $(/bin/ls /dev/video* | fzf )' --description 'alias webcam=setsid -f mpv --profile=low-latency --no-cache --untimed $(/bin/ls /dev/video* | fzf )'
  setsid -f mpv --profile=low-latency --no-cache --untimed $(/bin/ls /dev/video* | fzf ) $argv
        
end
