autocmd BufWritePost *.tex silent! execute "!pdflatex --shell-escape main.tex >/dev/null 2>&1" | redraw!
set textwidth=100
