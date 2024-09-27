" Basic syntax highlighting for refer database files

syntax match ReferIncorrect '%\w'
syntax match ReferComment   '\\".*$'
syntax match ReferGeneric   '%E\|%G\|%L\|%N\|%O\|%P\|%R\|%S\|%V\|%X'
syntax match ReferKeywords  '%K'
syntax match ReferTitle     '%T'
syntax match ReferDate      '%D'
syntax match ReferLocation  '%C'
syntax match ReferPublisher '%I'
syntax match ReferContainer '%J\|%B'
syntax match ReferAuthor    '%A\|%Q'

highlight ReferIncorrect ctermfg=0 ctermbg=1
highlight ReferComment   ctermfg=0 ctermbg=3
highlight ReferGeneric   ctermfg=0 cterm=BOLD
highlight ReferKeywords  ctermfg=7 cterm=BOLD
highlight ReferTitle     ctermfg=1 cterm=BOLD
highlight ReferDate      ctermfg=6 cterm=BOLD
highlight ReferLocation  ctermfg=5 cterm=BOLD
highlight ReferPublisher ctermfg=3 cterm=BOLD
highlight ReferContainer ctermfg=4 cterm=BOLD
highlight ReferAuthor    ctermfg=2 cterm=BOLD
