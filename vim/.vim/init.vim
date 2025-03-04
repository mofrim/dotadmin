let g:is_nvim = has('nvim')
let g:is_vim8 = v:version >= 800 ? 1 : 0

" Reuse nvim's runtimepath and packpath in vim
if !g:is_nvim && g:is_vim8
  set runtimepath-=~/.vim
    \ runtimepath^=~/.local/share/nvim/site runtimepath^=~/.vim
    \ runtimepath-=~/.vim/after
    \ runtimepath+=~/.local/share/nvim/site/after runtimepath+=~/.vim/after
  let &packpath = &runtimepath
endif

"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
" source ~/.vimrc

execute pathogen#infect()

"" Commentary
autocmd FileType Xresources setlocal commentstring=\!\ %s
autocmd FileType make setlocal noexpandtab      " no expandtab in Makefiles

"" After 42 settings...
autocmd FileType c setlocal noexpandtab nu ru shiftwidth=4 tabstop=4

"" theming
set clipboard=unnamed
" let &t_ut=''
" set t_Co=256
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
" colorscheme wombat256mod
" colorscheme wombat256i
" colorscheme afterglow
colorscheme gruvbox
" colorscheme Tomorrow-Night-Eighties
" colorscheme xoria256
highlight Normal ctermbg=None ctermfg=none gui=none
set background=dark

set encoding=utf-8
filetype plugin indent on
let python_highlight_all=1
syntax on

" unmatched parens
hi MatchParen cterm=bold ctermbg=black  ctermfg=Red
" hi MatchOpen cterm=bold ctermbg=none ctermfg=Red

" automatically read when a file is changed from the outside
set autoread

"" für incsearch-plugin
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

" cursorline highlighting... nothing in terminal
set cursorline
" :hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=grey95 guifg=white
" :hi CursorLine   cterm=NONE guibg=grey95 guifg=white
:nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

" change cursor on insert/normal mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


" Disable highlight when <leader><cr> is pressed
noremap <silent> <leader><cr> :noh<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

""
"" from theicefire-vimrc:
""
let mapleader = " " " Leader is the space key
let g:mapleader = " "

""auto indent for brackets
"inoremap {<CR> {<CR>}<Esc>O

" easier write
nmap <leader>w :w!<cr>

" sudo write when forgotten ;)
cmap w!! w !sudo tee > /dev/null %

" easier quit
nmap <leader>q :q<cr>

" shortcut for tabedit
cabbr te tabedit

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
" let g:netrw_list_hide=netrw_gitignore#Hide()
" let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

set shell=bash
set path+=**            " find sucht rekursiv ab aktuellen path
set wildmenu
set hidden              " allow buffer switching without saving
set scrolloff=4                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar

""
"" line numbering stuf
""
noremap <F2> :set invnumber<CR>
noremap <F3> :set invrelativenumber<CR>
" set number              " Show line numbers

" config config config ....
set formatoptions-=l    " break longlines when starting to edit them
set linebreak           " Break lines at word (requires Wrap lines)
set wrap                        " Wrap lines
set showbreak=+++           " Wrap-broken line prefix
set textwidth=80            " Line wrap (number of cols)
set showmatch           " Highlight matching brace
set breakindent         " linebreak gets indented
" set cursorline

set smartcase           " Enable smart-case search
set ignorecase          " Always case-insensitive
set incsearch           " Searches for strings incrementally

set autoindent          " Auto-indent new lines
set shiftwidth=2        " Number of auto-indent spaces
set smartindent         " Enable smart-indent
set smarttab            " Enable smart-tabs
set softtabstop=2       " Number of spaces per Tab
set ruler               " Show row and column ruler information

set undolevels=1000     " Number of undo levels
set backspace=indent,eol,start  " Backspace behaviour

set noerrorbells    " pscht
set novisualbell    " pscht
set t_vb=           " pscht
set tm=500          " pscht

set foldcolumn=1     " a bit of extramargin to the left
set ffs=unix,dos,mac     " use unix as standar filetype

set nobackup     " no backups etc
set nowb
set noswapfile

set expandtab

""
"" Splitting and tabbing
""
set splitbelow
set splitright
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" NerdCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1


"" super hacky clipboard shit
xnoremap <leader>y y:call system("wl-copy", @")<cr>
nnoremap <leader>p :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>"0p
" nnoremap "*p :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p")"
" nnoremap <leader>p :set paste<CR>"+p:set nopaste<CR>
" vnoremap <leader>p <Esc>:set paste<CR>gv"+p:set nopaste<CR>
"copy to outside buffer
" vnoremap <leader>y "+y
"paste from 0 register
"Useful because `d` overwrites the <quote> register
nnoremap <leader>P "0p
vnoremap <leader>P "0p

"select all
nnoremap <leader>a ggVG

"auto indent for brackets
inoremap {<CR> {<CR>}<Esc>O

" Red coloring at whitespace after end of line whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a markdown buffer for scribble
map <leader>s :e ~/buffer.md<cr>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>

" Open all buffers in tabs
map <leader>bt :tab sball<CR>

" open buffer list with buffer input
nnoremap <leader>bl :buffers<CR>:buffer<Space>

" delete buffer
nnoremap <leader>bd :bdelete<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => plugin configs... im grossen und ganzen
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" fzf -- be praised!
"
map <leader>fb :Buffers<cr>
map <leader>ff :Files<cr>
map <leader>fg :GFiles<cr>
map <leader>fr :Rg<cr>

"
" emmet-vim
"
let g:user_emmet_leader_key='<C-e>'

"
" rainbow mode
"
"" set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

"
" markdown mode
"
"" do not insert bullets when breaking long lines !
"" aaand disable initial folding
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_folding_disabled=1

"
" NERDTree
"
"" Openingn NerdTree when no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <F12> :NERDTreeToggle<CR>
"
" Ligthline
"
let g:lightline = {
      \ 'colorscheme': 'molokai',
      \ }

" let g:lightline = {
"       \ 'colorscheme': 'xoria256',
"       \ 'active': {
"       \   'left': [ ['mode', 'paste'],
"       \             ['fugitive', 'readonly', 'filename', 'modified'] ],
"       \   'right': [ [ 'lineinfo' ], ['percent'] ]
"       \ },
"       \ 'component': {
"       \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
"       \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
"       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"       \ },
"       \ 'component_visible_condition': {
"       \   'readonly': '(&filetype!="help"&& &readonly)',
"       \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
"       \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
"       \ },
"       \ 'separator': { 'left': ' ', 'right': ' ' },
"       \ 'subseparator': { 'left': ' ', 'right': ' ' }
"       \ }
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ }

" Bullets.vim
let g:bullets_enabled_file_types = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fancy stuff... alles nur geklaut ;)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"
" Python convenience
"
" PEP8 indentation for python
au BufNewFile,BufRead *.py set tabstop=4 softtabstop=4 shiftwidth=4 textwidth=79
      \ expandtab autoindent fileformat=unix

" Quick run via <F5>
nnoremap <F5> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    exec 'w'
    if &filetype == 'c'
        exec "AsyncRun! gcc % -o %<; time ./%<"
    elseif &filetype == 'cpp'
       exec "AsyncRun! g++ -std=c++11 % -o %<; time ./%<"
    elseif &filetype == 'java'
       exec "AsyncRun! javac %; time java %<"
    elseif &filetype == 'sh'
       exec "AsyncRun! time bash %"
    elseif &filetype == 'python'
       exec "AsyncRun! -raw time python %"
    endif
endfunction

" asyncrun now has an option for opening quickfix automatically
let g:asyncrun_open = 15

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

" yank somethin into system-clipboard, works over ssh!
" function! Osc52Yank()
"   let buffer=system('base64 -w0', @0)
"   let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\\'
"   silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
" endfunction
" nnoremap <leader>y :call Osc52Yank()<CR>

""" completor stuff
"""
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
" function! Tab_Or_Complete() abort
"   " If completor is already open the `tab` cycles through suggested completions.
"   if pumvisible()
"     return "\<C-N>"
"   " If completor is not open and we are in the middle of typing a word then
"   " `tab` opens completor menu.
"   elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^[[:keyword:][:ident:]]'
"     return "\<C-R>=completor#do('complete')\<CR>"
"   else
"     " If we aren't typing a word and we press `tab` simply do the normal `tab`
"     " action.
"     return "\<Tab>"
"   endif
" endfunction

" Use `tab` key to select completions.  Default is arrow keys.
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> Tab_Or_Complete()

""" hint to keep lines short
" au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
" alternatively
" set colorcolumn=+1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

noremap  <PageUp> <nop>
noremap! <PageUp> <nop>
noremap  <PageDown> <nop>
noremap! <PageDown> <nop>
