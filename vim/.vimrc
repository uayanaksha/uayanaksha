" Options
syntax on
filetype on
filetype plugin indent on
set cot=menuone,fuzzy
set dict=~/.vim/dictionary.txt
set tsr=~/.vim/thesaurus.txt
set udir=~/.vim/backup
set encoding=utf-8
set et is sb sc si sm smd  spr sta title nu rnu wmnu udf
set nocp nohls noswf 
set so=8 sw=2 ts=2 sts=2 hi=1000 ls=2
set wim=full
set wop=pum,tagfile

" Net setting
let g:netrw_banner=0
let g:netrw_liststyle=3

" Plugins
call plug#begin('~/.vim/plugged')
  Plug 'dylanaraps/fff.vim'
  Plug 'flazz/vim-colorschemes'
  Plug 'junegunn/fzf'
  Plug 'neoclide/coc.nvim'
  Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'mattn/emmet-vim'
  " Plug 'arzg/vim-colors-xcode' 
  " Plug 'lervag/vimtex'
call plug#end()

" vim ~7.3 enable undofile.
if version >= 703
    set undodir=~/.vim/backup
    set undofile
    set undoreload=10000
endif

" coc tab completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" coc select from popup
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Status line
set stl=
set stl+=\ %F\ %M\ %Y\ %R
set stl+=\[%b\ =>\ 0x%B\]\ \[%l_%c\]\ %p%%\
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}
set laststatus=1

" Disable Arrow Keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Colorscheme
set background=dark
set termguicolors
if exists("syntax_on")
    colo gruvbox
endif
hi Folded guibg=#888888 guifg=#080808

" Keymaps
let mapleader = " "
map <leader> <C-w>

"remap split navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"move tabs
map <leader><right> :tabnext<CR>
map <leader><left>  :tabprevious<CR>
map <leader>l       :tabnext<CR>
map <leader>h       :tabprevious<CR>


"adjust split sizes easier
noremap <silent> <C-Left>   :vertical resize +3<CR>
noremap <silent> <C-Right>  :vertical resize -3<CR>
noremap <silent> <C-Up>     :resize +3<CR>
noremap <silent> <C-Down>   :resize -3<CR>

"change split windows from vertical to horizontal or vice versa
map <leader>z   :Lexplore 20<CR>
map <leader>x   :FZF<CR>
map <leader>c   :tabnew +FZF<CR>
map <leader>th  <C-w>t<C-w>H
map <leader>tk  <C-w>t<C-w>K

" automatically close brackets, parethesis, double quotes, and single quotes

let g:coc_global_config="$HOME/.vim/coc-settings.json"

" rrethy/vim-hexokinase setup

let g:Hexokinase_highlighters = [ 'backgroundfull' ]
let g:Hexokinase_optInPatterns = [ 'full_hex', 'triple_hex', 'rgb', 'rgba', 'hsl', 'hsla', 'colour_names' ]

" coc settings

set updatetime=300

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" GoTo code navigation
nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent><nowait> gr <Plug>(coc-references)

