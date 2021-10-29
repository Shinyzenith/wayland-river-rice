function rangercd
	set TMP (mktemp)
	set CWD (pwd)

	ranger --choosedir=$TMP $argv

	set DIR (cat $TMP)

	rm -f $TMP

	if not [ DIR = CWD ]
		cd $DIR
	end
end
