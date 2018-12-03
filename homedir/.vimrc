set nocompatible               " be iMproved
filetype off                   " required for vundle... we turn it back on later

" https://github.com/chriskempson/base16-shell
" If there is a base16 theme file, load it and set the colorspace to 256
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
else
  colorscheme breeze
  if has("gui_running")
    set antialias
  endif
endif

set encoding=utf-8
set fileencoding=utf-8

" turn on persistent undo, and store it in the vim dir
set undofile
set undodir=~/.vim/undodir

" hopeful that one of these will fix my slow scrolling, but not really
set ttyfast
set synmaxcol=400
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set re=1

" default space and tab handling
set shiftwidth=4
set tabstop=4
set expandtab
set softtabstop=4

" fold by indents unless specified otherwise
set foldmethod=indent
set foldlevel=9999

" use dark themes
set background=dark

" use the mouse in terminal mode
set mouse=a

" vim by default chooses the xterm2 mouse mode, which does not work past
" column 223. Set it to sgr, which works past 223 but may not be present
" in older vims
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

" backspace over auto-indents, eols, start of lines
set backspace=indent,eol,start

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
set list listchars=tab:→\ ,trail:·
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
"
" Disable the F1 help key
map <F1> <Esc>
imap <F1> <Esc>

" http://vim.wikia.com/wiki/Move_cursor_by_display_lines_when_wrapping
nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

" Ex mode is stupid
nnoremap Q <nop>

" Automatically read files which have been changed outside of Vim, if we
" haven't changed it already.
set autoread

" " keep the cursor in the middle of the screen
set scrolloff=999

" turn off swap files
set nobackup
set nowritebackup
set noswapfile

" http://vim.wikia.com/wiki/Example_vimrc
set wildmenu
set showcmd
set confirm

"" this group is recommended by http://items.sjbach.com/319/configuring-vim-right
set ignorecase
set smartcase
set title
set scrolloff=3
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set hidden
nnoremap ' `
nnoremap ` '
let mapleader = ","
set history=1000
runtime macros/matchit.vim

" Stolen from http://github.com/ask/ask-vimrc/blob/master/vimrc
set completeopt=menuone,longest,preview
set hidden
set complete+=k

" Syntax Highlighting
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" C-j replaces <C-w>j and so on (split navigation)
"map <C-J> <C-W>j
"map <C-K> <C-W>k
"map <C-L> <C-W>l
"map <C-H> <C-W>h
map <C-_> <C-W>_


" Allow those keys to move around tmux too
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

" terminal mode shortcuts. The tmux ones kind of work but leave you in normal
" mode instead of insert mode, which is irritating, so leave them dead for now
"tnoremap <silent> <C-h> <C-W>N:TmuxNavigateLeft<cr>
"tnoremap <silent> <C-j> <C-W>N:TmuxNavigateDown<cr>
"tnoremap <silent> <C-k> <C-W>N:TmuxNavigateUp<cr>
"tnoremap <silent> <C-l> <C-W>N:TmuxNavigateRight<cr>
tnoremap <silent> <C-h> <C-W>h
tnoremap <silent> <C-j> <C-W>j
tnoremap <silent> <C-k> <C-W>k
tnoremap <silent> <C-l> <C-W>l
" This seems to mess up the up key :(
"tnoremap <Esc> <C-w>N
tnoremap <leader><Esc> <C-w>N

" Open splits to the right and below by default. Feels more natural
set splitbelow
set splitright

"insert one character
noremap <C-i> i<space><esc>r

"no toolbar
set guioptions-=T

"show line
set ruler

"don't highlight searches
set nohls

"Gui tabs only show the filename
set guitablabel=%t

" http://vim.wikia.com/wiki/VimTip102
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction
inoremap <tab> <c-r>=Smart_TabComplete()<CR>

" better tab navigation mappings
map gn gt
map gN gT

"Specific commands for filetypes
augroup myfiletypes
  "clear old autocmds in group
  autocmd!
  "for ruby, autoindent with two spaces, always expand tabs
  autocmd FileType ruby,haml,eruby,yaml set sw=2 sts=2 et
  autocmd FileType html set sw=2 sts=2 et
  autocmd FileType python,c set sw=4 sts=4 et
  autocmd FileType javascript set sw=2 sts=2 et
  autocmd FileType go set ts=4 sw=4 sts=4 noet nolist
  autocmd FileType js set nofixeol
augroup END


"
" BEGIN VUNDLE SETUP
"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Git bindings
Plugin 'tpope/vim-fugitive'

" easier HTML typing
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" NERDtree
Plugin 'scrooloose/nerdtree'

" database access
Plugin 'vim-scripts/dbext.vim'

" Surround things with other things
Plugin 'tpope/vim-surround'

" Buf explore things
Plugin 'corntrace/bufexplorer'

" Git gutter marks
Plugin 'airblade/vim-gitgutter'

" Match HTML tags
Plugin 'gregsexton/MatchTag'

" CoffeeScript support
Plugin 'kchmck/vim-coffee-script'

" Markdown support
Plugin 'hallison/vim-markdown'

" Rust support
Plugin 'rust-lang/rust.vim'

" base 16 vim themes
Plugin 'chriskempson/base16-vim'

" XML support
Plugin 'othree/xml.vim'

" Handle ANSI escape codes
Plugin 'ponzellus/AnsiEsc'

" Golang
Plugin 'fatih/vim-go'

" NERD commenter
Plugin 'scrooloose/nerdcommenter'

" fzf fuzzy finder
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Elixir support
Plugin 'elixir-lang/vim-elixir'

" Crystal support
Plugin 'rhysd/vim-crystal'

" Treat C-hjkl the same in tmux as in vim
Plugin 'christoomey/vim-tmux-navigator'

" es6 highlighting
Plugin 'isRuslan/vim-es6'

" linting
Plugin 'w0rp/ale'

" writing mode :Goyo
Plugin 'junegunn/goyo.vim'

" ReasonML
Plugin 'reasonml-editor/vim-reason-plus'

call vundle#end()            " required
filetype plugin indent on     " required for vundle
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Plugin commands are not allowed.
" Put your stuff after this line

"
" END VUNDLE SETUP
"

"disable all bells
set visualbell t_vb=

"install go syntax and tools
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

" http://statico.github.io/vim.html
" emacs-style command-line controls
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" ATM, only accept golang-formatted errors for quickfix. If I start using this
" more, I should set it to accept error types only for specific files
set errorformat=%f:%l:%c:\ %m

" ALE config
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %code: %%s [%severity%]'

" don't run ale on every text change, just on every save
let g:ale_lint_on_text_changed = 'never'
nnoremap <leader>m :ALENextWrap<CR>

" https://github.com/prettier/prettier/tree/master/editors/vim#ale
" enable prettier on save
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_fixers['python'] = ['yapf']
let g:ale_fixers['c'] = ['clang-format']
" to dsiable on a particular buffer:
" :let b:ale_fix_on_save=0
let g:ale_fix_on_save = 1

nnoremap <leader>l :!clear && rake<CR>

" run 'make'
" nnoremap <leader>g :!clear && make<CR>

" plugin helpers
nnoremap <leader>t :NERDTreeToggle<CR>

function! DebugHere()
    silent !clear
    " TODO: right now I hardcode the binary name "test" in there.
    "       maybe the best thing to do would be to:
    "       * check if some g:executable_name (b:?) has been set
    "       * if not, prompt the user and save it to that var
    "
    "       How else could I grab that? think on it.
    execute "!lldb -f test -o 'breakpoint set -f " . bufname("%") . " -l " . line(".") . "' -o run"
endfunction

au FileType c nnoremap <leader>d :call DebugHere()<cr>

" default fzf looks like:
" nnoremap <leader>f :FZF<CR>
"
" but instead, we'll call it with the "exact" option. This means that, for ex,
" 'servi aptc' matches 'services/aptc.js' but not
" 'app/settings/controllers/services.js'
" nnoremap <leader>f :call fzf#run({'options': '-e', 'sink': 'e', 'down': '40%'})<CR>
"
" ^^^ this doesn't handle c-x and c-v for split, so:

" I basically have no idea how this works. CnP from
" https://github.com/junegunn/fzf/issues/239#issuecomment-103081772
function! s:my_fzf_handler(lines) abort
  if empty(a:lines)
    return
  endif
  let cmd = get({ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }, remove(a:lines, 0), 'e')
  for item in a:lines
    execute cmd escape(item, ' %#\')
  endfor
endfunction

nnoremap <silent> <leader>f :call fzf#run({
  \ 'options': '-e --expect=ctrl-t,ctrl-x,ctrl-v',
  \ 'down':    '40%',
  \ 'sink*':   function('<sid>my_fzf_handler')})<cr>

function! s:ag_to_qf(line)
  let parts = split(a:line, ':')
  return {'filename': parts[0], 'lnum': parts[1], 'col': parts[2],
        \ 'text': join(parts[3:], ':')}
endfunction

function! s:ag_handler(lines)
  if len(a:lines) < 2 | return | endif

  let cmd = get({'ctrl-x': 'split',
               \ 'ctrl-v': 'vertical split',
               \ 'ctrl-t': 'tabe'}, a:lines[0], 'e')
  let list = map(a:lines[1:], 's:ag_to_qf(v:val)')

  let first = list[0]
  execute cmd escape(first.filename, ' %#\')
  execute first.lnum
  execute 'normal!' first.col.'|zz'

  if len(list) > 1
    call setqflist(list)
    copen
    wincmd p
  endif
endfunction

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

nnoremap <silent> <leader>g :Rg 

" Ack search
" nnoremap <leader>s :Ack! -i 
" if executable('rg')
"   let g:ackprg = 'rg --vimgrep'
" endif

" Format json
"nnoremap <leader>j :%!jsonpp<CR>
nnoremap <leader>j :%!jq ''<CR>

au FileType rust nnoremap <leader>a :RustFmt<CR>

" Format xml
nnoremap <leader>x :%!xmllint --format --encode UTF-8 -<CR>

" Format html
nnoremap <leader>h :%!xmllint --format --encode UTF-8 --html -<CR>

" ruby debugger
au FileType ruby nnoremap <leader>d orequire 'byebug'; byebug<esc>
au FileType ruby nnoremap <leader>D Orequire 'byebug'; byebug<esc>

" system paste and yank
nnoremap <leader>p :pu +<CR>
vnoremap <leader>y "+y

" edit vimrc and source vimrc, respectively
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>es :source $MYVIMRC<cr>

" add or remove focus:true to the current line
" I actually wrote this!
function! Add_or_remove_focus()
  let line=getline('.')
  echom 'yo'

  if line =~ 'focus'
    execute ':.s/,\s*focus\s*:\s*true//'
  else
    execute ':.s/ do$/, focus:true do/'
  endif
endfunction
" add or remove focus:true to the current line
nnoremap <leader>o :call Add_or_remove_focus()<cr>

" Don't autocomplete html except with leader-a
let xml_tag_completion_map = "<leader>a"
