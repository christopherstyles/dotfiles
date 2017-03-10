" Use Vim settings, rather then Vi settings. This setting must be as early as
" possible, as it has side effects.
set nocompatible

" Leader
let mapleader = " "

set autoread        " automatically reload files changed outside of Vim
set backspace=2     " Backspace deletes like most programs in insert mode
set clipboard=unnamed " normal OS clipboard interaction
" set clipboard=unnamedplus " Yanks go on clipboard
set cmdheight=2     " use a status bar that is 2 rows high
set cursorline
set nobackup
set nowrap
set nowritebackup
set noswapfile      " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ignorecase      " ignore case when searching
set ruler           " show the cursor position all the time
set scrolloff=4     " keep 4 lines off the edges of the screen when scrolling
set showcmd         " display incomplete commands
set showmatch       " set show matching parenthesis
set smartcase       " ignore case if search pattern is all lowercase,
                    " case-sensitive otherwise
set smarttab        " insert tabs on the start of a line according to
                    " shiftwidth, not tabstop
set incsearch       " do incremental searching
set laststatus=2    " Always display the status line
set autowrite       " Automatically :write before running commands
set shortmess+=I    " hide the launch screen
set title           " change the terminal's title
" set virtualedit=all " allow the cursor to go in to "invalid" places
set visualbell      " don't beep
set noerrorbells    " don't beep
set wildchar=9      " tab as completion character

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

syntax on

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" let g:solarized_termcolors=256
syntax enable
set background=dark
colorscheme sunburst
" colorscheme solarized
" colorscheme monokai
" colorscheme jellybeans

if has('gui_running')
  set guifont=Monaco:h11
  set guioptions-=r
  set guioptions-=l
  set guioptions-=L
end

" settings for terminal vim
if !has("gui_running")
  set t_Co=256
endif

filetype plugin indent on

set omnifunc=syntaxcomplete#Complete

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Cucumber navigation commands
  autocmd User Rails Rnavcommand step features/step_definitions -glob=**/* -suffix=_steps.rb
  autocmd User Rails Rnavcommand config config -glob=**/* -suffix=.rb -default=routes

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 80 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=80
augroup END

" Softtabs, 2 spaces
set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab
set autoindent
set smartindent

" Display extra whitespace
" set list listchars=tab:»·,trail:·
set list
" set listchars=tab:>.,trail:.,extends:#,nbsp:.
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
" set list listchars=tab:»-,trail:·,extends:»,precedes:«

" indentLine (https://github.com/Yggdroot/indentLine)
" Vim
" indentLine will overwrite 'conceal' color with grey by default.
" If you want to highlight conceal color with your colorscheme, disable by:
let g:indentLine_setColors = 0
" let g:indentLine_color_term = 235
" GVim
" let g:indentLine_color_gui = '#262626'
" none X terminal
" let g:indentLine_color_tty_light = 4 " (default: 4)
" let g:indentLine_color_dark = 2 " (default: 2)
" let g:indentLine_char = '︙'
" let g:indentLine_char = ''
" let g:indentLine_char = '│'
" let g:indentLine_color_gui = '#333333'

" let g:indentLine_concealcursor = 'inc'
" let g:indentLine_conceallevel = 2 " (default 2)
" let g:indentLine_enabled = 1

let g:indentLine_setConceal = 0

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor\ --column

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0

  let g:ackprg = 'ag --nogroup --nocolor --column'
endif

" Remove extra whitespace on save
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window = 'top,order:ttb,min:1,max:10,results:10'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.bak,*.pyc,*.class

" Make it obvious where 80 characters is
" set textwidth=80
" set colorcolumn=+1

" let &colorcolumn="80,"
set colorcolumn=80
" let &colorcolumn="80,".join(range(120,999),",")

highlight ColorColumn ctermbg=233 guibg=#2c2d27

" Numbers
set number
set relativenumber
set numberwidth=3
" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-rspec mappings
nnoremap <Leader>t :call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

map <Leader>bb :!bundle install<cr>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Speed up scrolling of the viewport slightly
" nnoremap <C-e> 2<C-e>
" nnoremap <C-y> 2<C-y>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'
let g:syntastic_ruby_checkers = ['rubocop', 'rubylint']
let g:vim_json_syntax_conceal = 0
" disable syntastic on the statusline
let g:statline_syntastic = 0

" Add spell checking and automatic wrapping at  72 columns on commit messages
autocmd Filetype gitcommit setlocal spell textwidth=72

" Highlight searches
" set hlsearch

" Open NERDTree with Ctrl+n
" map <C-n> :NERDTreeToggle<CR>
" let g:NERDTreeDirArrows = 1
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" let g:NERDTreeMouseMode=3

" https://github.com/thoughtbot/vim-rspec#iterm-instead-of-terminal
let g:rspec_runner = "os_x_iterm"

set mouse=a
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" Set up the gui cursor to look nice
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=ve:ver35-Cursor
set guicursor+=o:hor50-Cursor
set guicursor+=i-ci:ver25-Cursor
set guicursor+=r-cr:hor20-Cursor
set guicursor+=sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set wrap!

" Airline config
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=0

" GitGutter colors
" highlight SignColumn ctermbg=235 ctermfg=235
hi SignColumn ctermbg=232

" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Create a new tab
nnoremap tt :tabnew<cr>

" Close a tab
nnoremap tw :tabclose<cr>

" Move to the previous tab
nnoremap th :tabprev<cr>

" Move to the next tab
nnoremap tl :tabnext<cr>

" Write the file
map <leader>w :w<cr>

" Close the buffer
map <leader>q :bd<cr>

" Comment lines with vim-commentary
map <leader>/ :Commentary<cr>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Clear out a search
nnoremap <leader><space> :noh<cr>

" Select all
map <C-a> <esc>ggVG<CR>
"
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
" nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
" nmap <leader>bl :ls<CR>

" Theming
" let g:jellybeans_overrides = {
"       \    'Todo': { 'guifg': '303030', 'guibg': 'cccccc',
"       \              'ctermfg': 'Black', 'ctermbg': 'Yellow',
"       \              'attr': 'bold' },
"       \}

" let g:jellybeans_use_lowcolor_black = 1
" let g:jellybeans_use_term_italics = 1
" let g:jellybeans_background_color_256=232
" let g:jellybeans_background_color = '000000'
" let g:jellybeans_use_term_background_color = 1
" set colorcolumn=+1
" let g:jellybeans_use_term_background_color = 1
" set colorcolumn=+1
" autocmd colorscheme * hi Normal ctermbg=236
" autocmd colorscheme * hi Normal ctermbg=232
" let g:jellybeans_use_lowcolor_black = 1
" let g:jellybeans_use_256ctermbg = 233

" vim-diminactive
hi ColorColumn ctermbg=232 guibg=#121212
let g:diminactive_use_syntax = 0

" Change the line number colors
highlight LineNr ctermfg=239 ctermbg=black gui=NONE guifg=#7C7C7C guibg=#000000

" hi Directory guifg=#ff0000 guibg=#00ff00
" hi treeDir guifg=#ff0000 guibg=#00ff00

" List occurrences for search
" let g:searchtasks_list=["TODO", "FIXME", "HACK", "REVIEW", "OPTIMIZE"]

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

