" vim:fdm=marker
" fallwith's .vimrc - 2016-12-29

" references {{{
"   twerth's .vimrc:        https://github.com/twerth/dotfiles/blob/master/etc/vim/vimrc
"   railsjedi's .vimrc:     https://github.com/railsjedi/vimconfig/blob/master/vimrc
"   thoughtbot's .vimrc:    https://github.com/thoughtbot/dotfiles/blob/master/vimrc
"   astrails' dotvim:       https://github.com/astrails/dotvim#installation
"   timss' .vimrc:          https://github.com/timss/vimconf/blob/master/.vimrc
"   tpope's sensibilities:  https://github.com/tpope/vim-sensible
"   DanielFGray's guide:    https://gist.github.com/DanielFGray/6d81dbede41e93bbd803
"   Ben Klein's tricks:     http://blog.unixphilosopher.com/2015/02/five-weird-vim-tricks.html
"   Dr. Bunsen:             http://www.drbunsen.org/writing-in-vim/
"   Luke Maciak:            http://www.terminally-incoherent.com/blog/2013/06/17/using-vim-for-writing-prose/
" }}}
" vim-plug {{{

" :PlugInstall [name]  - install all / specified plugins
" :PlugUpdate          - install/update all / specified plugins
" :PlugClean[!]        - confirm (or auto-approve) removal of unused plugins
" :PlugUpgrade         - Upgrade vim-plug itself

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
" airline: a lightweight provider of a fancy status line
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" fugitive: allows for the use of Git from within Vim
Plug 'tpope/vim-fugitive'
" commentary: allows for the commenting/uncommenting of text
Plug 'tpope/vim-commentary'
" syntastic: a linter / code syntax checker wrapper
Plug 'scrooloose/syntastic', { 'for': 'ruby' }
" surround: add, remove, swap surroundings like quotes or braces
Plug 'tpope/vim-surround'
" tabular: automatically align blocks of text based on a delimiter
Plug 'godlygeek/tabular', { 'for': 'ruby' }
" delimitMate: automatically provides closing quotes and braces
Plug 'Raimondi/delimitMate'
" vim-ruby: powers Vim's Ruby editing support, bundle to fetch newer code that what Vim shipped with
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
" ctrl-p: fast, fuzzy finder for searching filesystems, buffers, and mru items
Plug 'kien/ctrlp.vim'
" vim-vinegar: netrw file browsing improvements
Plug 'tpope/vim-vinegar'
" vim-yankstack: more easily navigate through previous yanks
Plug 'maxbrunsfeld/vim-yankstack'
" vim-endwise: add helpful closing structures (like 'end') for Ruby and others
Plug 'tpope/vim-endwise'
" nerdtree: file explorer (netrw replacement)
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" vim-tmux-navigator: seamless navigation between Vim and Tmux splits
Plug 'christoomey/vim-tmux-navigator'
" vim-rspec: kick off rspec tests from within vim
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
" tslime: send output to a tmux session
Plug 'jgdavey/tslime.vim', { 'for': 'ruby' }
" vim-gutentags: automatic CTags management
"Plug 'ludovicchabant/vim-gutentags'
" vim-ags: leverage The Silver Searcher (ag) from within Vim
Plug 'gabesoft/vim-ags'
" vim-molasses prevent repeated hjkl input for movement
" Plug '0x0dea/vim-molasses'
" vim-markdown: development version of Vim's markdown support
Plug 'tpope/vim-markdown'
" vim-pencil: use Vim for writing
" Plug 'reedes/vim-pencil'
" tmuxline: powerline type theming of tmux with vim based integration
Plug 'edkolev/tmuxline.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'junegunn/goyo.vim'
" vimwiki: personal wiki for Vim
Plug 'vimwiki/vimwiki'

" themes
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'chriskempson/tomorrow-theme', {'rtp': 'vim/'}
Plug 'w0ng/vim-hybrid'
Plug 'vim-scripts/wombat256.vim'
Plug 'Lokaltog/vim-distinguished', {'branch': 'develop'}
Plug 'zeis/vim-kolor'
Plug 'tomasr/molokai'
Plug 'toupeira/vim-desertink'
Plug 'ajh17/Spacegray.vim'
Plug 'wellsjo/wells-colorscheme.vim'
Plug 'romainl/Apprentice'
Plug 'fxn/vim-monochrome'
Plug 'duythinht/inori'
Plug 'vim-scripts/abbott.vim'
Plug 'yantze/pt_black'
Plug 'thewatts/wattslandia'
Plug 'kreeger/benlight'
Plug 'NLKNguyen/papercolor-theme'
Plug 'AlessandroYorba/Alduin'
call plug#end()
" }}}
" {{{ basic configuration
let mapleader = ","         " use a comma as the <Leader> character
set nocompatible            " disable vi compatibilty
let g:ruby_path='~/bin/ruby24'  " dramatically improve Ruby syntax processing time by not using the system ruby
filetype plugin indent on   " enable plugins related to the opened file's type and enable indentation
syntax enable               " enable syntax highlighting
set t_Co=256                " 256 colors
"colorscheme jellybeans      " set default color scheme (ir_black, desert, jellybeans) :colorscheme<tab> for list
"colorscheme Tomorrow-Night-Bright " set default color scheme (ir_black, desert, jellybeans) :colorscheme<tab> for list
"colorscheme distinguished   " set default color scheme (ir_black, desert, jellybeans) :colorscheme<tab> for list
set bg=dark                 " use dark background
set autowrite               " save on shell commands
set noerrorbells            " don't make noise
set showcmd                 " always display the status line
set ruler                   " enable the ruler
set timeoutlen=250          " time to wait after ESC
set expandtab               " expand tabs to spaces
set ts=2                    " tabs are 2 spaces
set bs=2                    " backspace over everything in insert mode
set shiftwidth=2            " tabs under smart indent
set laststatus=2            " always show status line
set autoindent              " a new line is indented as far as the previous one
set smartindent             " enable intelligent indenting behavior
set hlsearch                " highlight located values being searched for
set ignorecase              " case insensitive searching
set smartcase               " trigger case sensitivity when an upper case char is used
set incsearch               " as-you-type searching
set nocindent               " disable c style indenting
set nobackup                " disable backups"
set nowritebackup           " disable backups"
set noswapfile              " disable the creation of .swp swap files
set nu                      " enable line numbers
"set rnu                     " enable relative line numbers
set numberwidth=5           " specify line numbers column width
set vb t_vb=                " disable bell
set tags=.tags;/            " look for a .tags ctags file and keep looking all the way up to /
"set cursorline              " highlight the line the cursor resides on
set shiftround              " round indentation to a multiple of 'shiftwidth'
set wildmenu                " when tab completing commands, show available matches in a menu
set display+=lastline       " display as much as possible of the last (overly long) line
set history=1000            " increase the default number of remembered items from 20
set nojoinspaces            " don't use extra space when joining lines (with J)
set nrformats=              " treat all numerals as decimal (leading zeroes won't signify octal)
set pastetoggle=<F2>        " (for non gui Vim) hit F2 to toggle paste mode (which won't attempt to apply indentation)
set cc=120                  " (ruler) colorcolumn. column 120 is visually styled
set complete-=i             " remove 'included files' from the list of autocomplete sources
set clipboard=unnamed       " yank to / put from the operating system clipboard
set list                    " show invisibles
set ff=unix                 " unix fileformat
set listchars=tab:»·,trail:•,eol:¬  " characters to display when showing invisibles
hi ColorColumn guibg=grey13 ctermbg=246  " apply the desired visual styling to the colorcolumn
set grepprg=ag\ --nogroup\ --nocolor      " use ag instead of grep
set viminfo+=n~/.vim/.viminfo             " store the vim info file beneath ~/.vim
" }}}
" gui specific {{{
if has('gui_running')
  set transparency=10                 " transparent background
  "set guifont=Inconsolata:h14        " specify font family and size
  set guifont=Monaco:h11
  "set guifont=Menlo:h11
  colorscheme hybrid-light
  set lines=40 columns=120
else
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

  " colorscheme gruvbox
  " colorscheme spacegray
  " colorscheme hybrid
  colorscheme distinguished

  " don't allow colorschemes to set a background color
  highlight Normal ctermbg=NONE
  highlight nonText ctermbg=NONE
endif
" }}}
" {{{ custom hooks
" automatically leave paste mode after having pasted in text
au InsertLeave * silent! set nopaste
" }}}
" {{{ filetype specific
" not needed if 'tpope/vim-markdown' is present:
"au BufRead,BufNewFile *.md set filetype=markdown        " treat .md files as Markdown (not Modula)
au BufRead,BufNewFile *.md set cc=80

autocmd Filetype gitcommit setlocal spell textwidth=72 cc=50,72
" }}}
" {{{ custom mappings
:noremap <Leader>i :set list!<CR>       " toggle display of invisibles
map w!! %!sudo tee > /dev/null %        " force a write if vim was launched without sudo
nmap <silent> <Leader>/ ;nohlsearch<CR> " clear currently displayed search highlighting

" Leader-r reloads the vimrc -- making all changes active (have to save first)
"map <silent> <Leader>r ;source ~/.vimrc<CR>;filetype detect<CR>;exe ":echo 'vimrc reloaded'"<CR>

map <Leader>r ;redraw!<CR>

" Autocompletion
imap <S-Tab> <C-P>

" Convert arrow key presses into instructions
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" use jk for Esc
imap jk <Esc>
vmap jk <Esc>

" immediately reselect text after indenting/outdenting
vnoremap < <gv
vnoremap > >gv

" flip ; and : to enter command mode more easily
nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

" delete to the black hole
nnoremap d "_d
xnoremap d "_d"
nnoremap x "_x
xnoremap x "_x"
" }}}
" {{{ splits
" vertical and horizontal split to new buffer
:noremap <Leader>v :below vnew<CR>
:noremap <Leader>h :below new<CR>
" instead of ctrl+w, letter, just do ctrl+letter
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" open new horizonal split panes to the bottom and vertical panes to the right
set splitbelow
set splitright
" }}}
" {{{ custom commands
" Markdown
command! Mou :silent :!open -a Mou.app '%:p'
command! MD :silent :!open -a MacDown.app '%:p'

" Ctags
" create a Ruby project ctags file by passing the current file's path to the
" external 'rubyctags' script. (see https://gist.github.com/fallwith/9383650)
:command! Rubyctags !rubyctags %:p<CR>
:command! Rtags Rubyctags

" :S to quickly re-enable syntax highlighting
:command! S syntax on<CR>

" :Tig to launch Tig
:command! Tig :silent :!tig

" :Vimrc to open ~/.vimrc
:command! Vimrc :silent :e ~/.vimrc

" :Slate to open ~/.slate
:command! Slate :silent :e ~/.slate

" :Double and :Single to resize the window in gvim
:command! Double :silent :set columns=252 lines=60
:command! Single :silent :set columns=126 lines=50

" http://www.drbunsen.org/writing-in-vim/
func! WordProcessorMode()
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  "set thesaurus+=/Users/sbrown/.vim/thesaurus/mthesaur.txt
  set complete+=s
  set formatprg=par
  setlocal wrap
  setlocal linebreak
endfu
com! WP call WordProcessorMode()

" " prose editing mode
" func! ProseMode()
"   "setlocal formatoptions=1
"   setlocal formatoptions=ant
"   " map j gj
"   " map k gk
"   setlocal spell spelllang=en_gb
"   setlocal complete+=s
"   setlocal formatprg=par
"   setlocal wrap
"   setlocal nolist
"   setlocal linebreak
"   setlocal nonu
"   " setlocal textwidth=120
"   setlocal wrapmargin=0
"   setlocal noautoindent
"   setlocal nocindent
"   setlocal nosmartindent
"   setlocal indentexpr=
"   setlocal foldcolumn=10
"   setlocal columns=120
" endfunc
" com! Prose call ProseMode()

" <leader>ag to prep a quickfix window based ag (silver searcher) search
" :command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nno <leader>ag :Ags<SPACE>
" }}}
" {{{ plugins / third-party tools
" Airline
" let g:airline_theme='powerlineish'
let g:airline_theme='molokai'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tmuxline#enabled = 0 " different theme for tmux than vim

" Tabular
" use tabular to align on equals signs and on colons (ruby 1.9+ style hashes)
nmap <Leader>a= :Tab/=<CR>
vmap <Leader>a= :Tab/=<CR>
nmap <Leader>a: :Tab/:\zs<CR>
vmap <Leader>a: :Tab/:\zs<CR>
nmap <Leader>a> :Tab/=><CR>
vmap <Leader>a> :Tab/=><CR>

" Syntastic

" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1

" bypass checking if :wq (or ZZ) is used
let g:syntastic_check_on_wq = 0
" specify which ruby to use (enforces MRI in JRuby projects)
let g:syntastic_ruby_mri_exec = '~/bin/ruby24'
let g:syntastic_ruby_rubocop_exec = '~/bin/rubocop'
"let g:syntastic_ruby_rubocop_exec = '~/.gem/ruby/2.3.1/bin/bundle\ exec\ rubocop'
" use mri and rubocop checkers with ruby files
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" VimSneak
let g:sneak#streak = 1

" Vinegar
autocmd FileType netrw nnoremap <silent> q :bd<CR>

" NERDTree
:noremap <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1              " show hidden files
let g:NERDTreeMapJumpNextSibling = "" " unbind <C-j>
let g:NERDTreeMapJumpPrevSibling = "" " unbind <C-k>

" CtrlP
let g:ctrlp_map = '<Leader>q'
" list buffers
:noremap <Leader>b :CtrlPBuffer<CR>
" list mru
:noremap <Leader>m :CtrlPMRU<CR>
" let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""' " use ag for CtrlP for listing files
let g:ctrlp_use_caching = 0 " ag is fast enough for CtrlP not to have to cache
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others | grep -v vcr_cassettes'],
    \ },
  \ 'fallback': 'ag %s -l --nocolor -g ""'
  \ }

" Yankstack
let g:yankstack_map_keys = 0
call yankstack#setup()
nmap <leader>p <Plug>yankstack_substitute_older_paste
nmap <leader>P <Plug>yankstack_substitute_newer_paste
:noremap <Leader>y :Yanks<CR>

" by default Y yanks the entire line, including the newline. have Y copy from
" the cursor to the end of the line and exclude the newline
nnoremap Y y$

" vim-rspec
let g:rspec_command = 'call Send_to_Tmux("bundle exec rspec {spec}\n")'
map <Leader>t ;call RunCurrentSpecFile()<CR>
map <Leader>s ;call RunNearestSpec()<CR>
map <Leader>l ;call RunLastSpec()<CR>
map <Leader>a ;call RunAllSpecs()<CR>
"let g:rspec_command = "!bundle exec rspec --tty --color --format documentation {spec}"

" Ranger
" from: http://www.reddit.com/r/vim/comments/2va2og/ranger_the_cli_file_manager_xpost_from/cog2ley
function! RangerChooser()
  let temp = tempname()
  exec 'silent !ranger --choosefiles=' . shellescape(temp)
  if !filereadable(temp)
    redraw!
    " Nothing to read.
    return
  endif
  let names = readfile(temp)
  if empty(names)
    redraw!
    " Nothing to open.
    return
  endif
  " Edit the first item.
  exec 'edit ' . fnameescape(names[0])
  " Add any remaning items to the arg list/buffer list.
  for name in names[1:]
    exec 'argadd ' . fnameescape(name)
  endfor
  redraw!
endfunction
nnoremap <leader>R :call RangerChooser()<CR>

" Goyo
let g:goyo_width = 120

" VimWiki
let g:vimwiki_list = [{'path': '~/.vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" vim-gutentags
"let g:gutentags_cache_dir = "/tmp"

" " vim-pencil
" let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
" let g:pencil#textwidth = 119

" augroup pencil
"   autocmd!
"   autocmd FileType markdown,mkd call pencil#init()
"   autocmd FileType text         call pencil#init({'wrap': 'hard'})
" augroup END

" }}}
" {{{ .vimrc.last overrides
"if filereadable($HOME . "/.vimrc.last")
"  source $HOME/.vimrc.last
"else
"  call system("touch $HOME/.vimrc.last")
"endif
" }}}


" if filereadable($HOME . "/.vim/acolyte_to_adept.vim")
"   source $HOME/.vim/acolyte_to_adept.vim
" endif
