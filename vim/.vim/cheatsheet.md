# Keybindings aus 'going mouseless talk'

## basics

* __vim verben__
  - c = change
  - d = delete
  - y = yank into register
  - ~ = swap case
  - gu = make lowercase
  - gU = make uppercase
  - ! = filter to external prog
  - < = shift left
  - > = right
  - = = indent

* __sample text objects__
  - aw = a word (whitespaces included ?!)
  - iw = inner word
  - aW = a WORD
  - iW = inner WORD
  - ap = a paragraph
  - ip = ...
  - ab = a bracket b='({['
  - ib = ..
  - at = a tag block
  - it = inner tag block

* __sample motions__
  - % = goto first matching paren/bracket
  - [count]+ = cnt down to first non-blank char of line
  - [count]$ = end of line
  - [count]f/F{char} = to next occurence of {char}
  - [count]t/T{char} = to befor next occurence of char
  - [count]h/j/k/l = ...
  - [count]]m = goto beginning of next method
  - [count]w/W = go word/WORD to the left
  - [count]b/B = go word/WORD to the right
  - [count]e/E = goto end of word

* __various motions - always be scrolling!__
  - ctrl-u / ctrl-d = up/down half a screen
  - ctrl-b / ctrl-f = up/down full screen
  - ctrl-y / ctrl-e = up/down couple of lines
  - H/M/L = high middl low on screen
  - last but not least: zz / zt / zb = scroll screen so that cursor so that it is top / middle / bottom of screen

* __editing files__
  - gf = goto file under cursor
  - gf 	open in the same window ("goto file")
  - <c-w>f 	open in a new window (Ctrl-w f)
  - <c-w>gf 	open in a new tab (Ctrl-w gf)
  - :fin[d] {file}

* __searching__
  - /{patt}[/]<CR> = search for patt
  - /<CR> = search for last used pattern
  - ?{patt}[?]<CR> = search back for patt
  - ?<CR> = search back for last used pattern
  - [count]n = repeat last search n times
  - [count]N = repeat last search back n times
  - * = search forward for word under cursor
  - # = search backward for word under cursor
  - gd = goto local declaration
  - :hls! = toggle search highlighting

* __marks and tags__
  - m{a-zA-Z} = sets mark exact location can be reached using backtick:
    `` `{mark} ``, line can be accessed by quotation mark: '{mark}
  - :marks = zeigt was gerade alles wie markiert ist
  -  `` `. `` und `` '. `` = jumping to last change
  - ctrl-] & ctrl-t = navigate tags

* __Jumplist & Changelist__
  - ** ctrl-O / ctrl-I ** = cycle through jumps
  - ** g; / g, ** = cycle through changes

* __Buffers__
  - :bn = goto next buffer
  - :b {filename} = goto buffer
  - :bd = delete current buffer
  - :buffers = list buffers
  - :bufdo {cmd} execute cmd for all buffers
  - :n = goto next file based on arg list
  - :arga {filename} = add filename to arg list
  - :argl {files} make a local arg copy via files
  - :args print out all initial arguments


* __windows__
  - ctrl-w s = split window
  - ctrl-w v = split window vertically
  - ctrl-w w = alternate window
  - ctrl-w r = rotate windows
  - :windo {cmd} = execute cmd for all windows
  - :sf {file} = split window and find file
  - :vert = make any split be vertical, also...
  - :vert sf {file}

* __tabs__
  - gt / gT = goto next / prev tab
  - :tabc = close tab
  - :tabe = open tab
  - :tabo = close all other tabs
  - :tabf = tab-find file


## tpope-surround
  - ds" = delete surrounding "
  - dst = in html zB: delete surrounding tag
  - ds( = del sur. ()
  - cs"' = change sur. " to '
  - ys$" = put " around text till end of line
  - ys3w) = put () around 3 words *without* spaces bef/aft ()
  - ys3( = put () around ... *with* spaces bef/aft ()

## handy stuff & shortcuts
  - :vs FILE -- open file as vertical split
  - :windo difft  -- do diff between open windows
  - :bo 15sp +term -- macht nen 15zeiligen terminal-buffer auf
  - :20vs . -- ist quasi ein  build-in nerdtree
  - g_ = last nonblank char in line
  - ^ = first nonblank ...
  - m [CAPITAL LETTER] = set file mark
  - m [not captial] = set mark in file

# Noch mehr Keybindings

* wenn man mal im insert-mode ist
  - kann man mit `ctrl-o command` genau ein normal-mode kommando
    ausführen.
  - strg-a = paste

* __wrapping lines__:
  - gqq = wraps current line
  - gqip = wraps current paragraph
  - :set tw=0 = wenn man mal keinen Bock mehr auf hard linebreaking hat

* Nützliche Tasten:
  - *irgend ein* Verb zB 'd'(=delete) + 'i' + 'w' für wort, 'p' für
    paragraph, '(' für klammern, etc... für das verb innerhalb diese
    rahmens aus
  - etwas machen, zB 'dw' (delete word) -> '.' wiederholt das letzte
    kommando, 'u' ist undo
  - '>' / '<' indent
  - switch tabs: 'gt' = next, 'gT' = prev
  - vertical spit current window: 'vsp' oder '<C-w>v', anderen buffer im
    neuen split editieren: `:b <num>`
  - copy to system clipboard `"*yy` für ganze line oder `"*yiw` für im
    wort das ganze wort, oder `"*y$` von hier bis zum EOL
  - *Bullets* oder *Allgemein Insert-Mode*: <C-t> und <C-d> indenten die
    aktuelle Zeile hoch oder unter.
  - Reload vimrc when editing it `:so %` otherwise `:so ~/.vimrc`
  - load plugin after install `:so ~/.vim/bundle/name/plugin/plugin.vim`
  - Reload file from disk: simply `:e`

* Bullet-vim:
  - `spc + x` für toggle checkbox

* Commentary:
  `gc + Motion`: Comment toggle motion, `gcc`: comment line

* folding
  - Im VISUAL mode markierne -> zf
  - zum öffnen 'zo', zum schließen 'zc'

* set relativenumber

* <leader> = '\' NEIN!... Space!

* **Completion**
  key 	description
  ^P 	basic tab completion, pulling from a variety of sources
  ^N   	the same as ^P but backward
  ^X ^L 	whole line completion
  ^X ^O 	syntax-aware omnicompletion

* **Window Splittung**
  " Max out the height of the current split
  ctrl + w _
  " Max out the width of the current split
  ctrl + w |
  " Normalize all split sizes, which is very handy when resizing terminal
  ctrl + w =
  " Swap top/bottom or left/right split
  Ctrl+W R
  " Break out current window into a new tabview
  Ctrl+W T
  " Close every window in the current. tabview but the current one
  Ctrl+W o

  Create a new tab from a buffer: :tab sb<N> or create a new window and then press <C-W>T

  Open all buffers in tabs: `:tab sball`
