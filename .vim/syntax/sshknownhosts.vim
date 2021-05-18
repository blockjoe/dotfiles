syntax match sship "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\>"
highlight def link sship Constant

syntax match sshhostname "\<\S*\.\(com\|org\|net\|xyz\|tech\|club\|crypto\)\>"
highlight def link sshhostname Underlined 

syntax match sshalg "\<\([a-z0-9]\{3,}-\)\+[a-z0-9]\{3,}\>"
highlight def link sshalg Identifier
