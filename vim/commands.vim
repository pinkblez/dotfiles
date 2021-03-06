" duplicate current tab into a new tab
function! SplitTab()
    let l = line(".")
    let c = col(".")
    :tabe %
    call cursor(l, c)
endfun

" remove trailing whitespace from lines and preserve cursor position
function! StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

" run :GoBuild or :GoTestCompile based on the go file
function! BuildGoFiles()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfun

" Toggle between displaying/hiding tabs
function! ShowTabsToggle()
    set listchars=tab:>-
    set list!
endfun

command! -nargs=0 ShowTabsToggle :call ShowTabsToggle()

" find-replace current word under cursor with given parameter
command! -nargs=1 ReplaceWith :exec("%s/\\<".expand("<cword>")."\\>/<args>/gc")

" Make Ag (Ctrl-G) not include filenames in search output
command! -bang -nargs=* AgNoFiles call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

