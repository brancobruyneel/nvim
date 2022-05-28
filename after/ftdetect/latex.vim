autocmd BufWritePost *.tex silent! execute ":Dispatch makeglossaries main && pdflatex --shell-escape main.tex" | redraw!
set textwidth=100
