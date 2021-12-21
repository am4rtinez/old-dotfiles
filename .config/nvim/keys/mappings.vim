" ===============================
" key mapping
" ===============================
"

" Save with <leader> + s
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <Leader>Q :q!<CR>

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Define <líder> + y to copy into clipboard (visual, normal modes)
vnoremap <leader>y "+y
nnoremap <leader>y "+y

" Define <líder> + d to cut into clipboard (visual & normal modes)
vnoremap <leader>d "+d
nnoremap <leader>d "+d

" Define <líder> + p to paste from clipboard (visual & normal modes)
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>P "+P

" shorter commands
cnoreabbrev tree NERDTreeToggle
cnoreabbrev find NERDTreeFind

" plugs
map <leader>nt :NERDTreeFind<CR>
map <leader>fi :Files<CR>
map <leader>ag :Ag<CR>

" Fast scrolling
nnoremap <C-j> 10<C-e>
nnoremap <C-k> 10<C-y>
nmap <Leader>s <Plug>(easymotion-s2)

set splitright
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://bash"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>
