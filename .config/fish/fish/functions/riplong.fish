function riplong --wraps=expac\ --timefmt=\'\%Y-\%m-\%d\ \%T\'\ \'\%l\\t\%n\ \%v\'\ \|\ sort\ \|\ tail\ -3000\ \|\ nl --description alias\ riplong=expac\ --timefmt=\'\%Y-\%m-\%d\ \%T\'\ \'\%l\\t\%n\ \%v\'\ \|\ sort\ \|\ tail\ -3000\ \|\ nl
  expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl $argv
        
end
