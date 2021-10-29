function ex
	if not test -d $argv
		switch $1
			case '*.tar.bz2'
			  tar xjf $1
			case '*.tar.gz'
			  tar xzf $1
			case '*.bz2'
			  bunzip2 $1
			case '*.rar'
			  unrar x $1
			case '*.gz'
			  gunzip $1
			case '*.tar'
			  tar xf $1
			case '*.tbz2'
			  tar xjf $1
			case '*.tgz'
			  tar xzf $1
			case '*.zip'
			  unzip $1
			case '*.Z'
			  uncompress $1
			case '*.7z'
			  7z x $1
			case '*.deb'
			  ar x $1
			case '*.tar.xz'
			  tar xf $1
			case '*.tar.zst'
			  tar xf $1
			case '*'
			  echo "'$1' cannot be extracted via ex()"
		end
	end
end
