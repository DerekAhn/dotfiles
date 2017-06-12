""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')


""""""""""""""""""""""""""""""
" Editor Config
""""""""""""""""""""""""""""""
" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Color Scheme
Plug 'NLKNguyen/papercolor-theme'

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'


""""""""""""""""""""""""""""""
" Editor Utils
""""""""""""""""""""""""""""""
" Alignment for vim
Plug 'junegunn/vim-easy-align'

" Emmet for vim
Plug 'mattn/emmet-vim'

" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'ctrlpvim/ctrlp.vim'

" Code completion
Plug 'Valloric/YouCompleteMe', { 'do': './install.sh'  }

" Code search and view tool
Plug 'dyng/ctrlsf.vim'

" BufExplorer quickly and easily switch between buffer
Plug 'jlanzarotta/bufexplorer'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'

" Undo history visualizer
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Preview colors in source code
Plug 'ap/vim-css-color'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'

" Paste in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'

" vim-snipmate default snippets
Plug 'honza/vim-snippets'

" Asynchronous Lint Engine
Plug 'w0rp/ale'


""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""

" Go development plugin for Vim
Plug 'fatih/vim-go'

" Formats javascript files by js-beautify
Plug 'maksimr/vim-jsbeautify'

" Javascript indentation and syntax support
Plug 'pangloss/vim-javascript'

" dustjs template syntax highlighting and more for vim
Plug 'jimmyhchan/dustjs.vim'

" CSS3 syntax support
Plug 'hail2u/vim-css3-syntax'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" SCSS syntax highlighting
Plug 'cakebaker/scss-syntax.vim'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SPECIFC CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" indentLine
""""""""""""""""""""""""""""""
let g:indentLine_color_term = 239


""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeIgnore = ['\.js.map$', '\.DS_Store$']
let g:NERDTreeWinPos = "left"
let g:NERDTreeWinSize=25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-e> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" vim markdown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled=1


""""""""""""""""""""""""""""""
" undotree
""""""""""""""""""""""""""""""
map <leader>u :UndotreeToggle<CR>
let g:undotree_WindowLayout = 3
let g:undotree_SplitWidth = 35
let g:undotree_SetFocusWhenToggle = 1

if has("persistent_undo")
  set undodir='~/.undodir/'
  set undofile
endif


""""""""""""""""""""""""""""""
" ctrp
""""""""""""""""""""""""""""""
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
" let g:ctrlp_custom_ignore = 'node_modules\|bower_components\|DS_Store\|git'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|bower_components$\|node_modules$\|\.DS_Store$\',
  \ 'file': '\.so$\|\.swp$\|\.zip$\|\*/tmp/*$|\~$\',
  \ }


""""""""""""""""""""""""""""""
" vim-easymotion
""""""""""""""""""""""""""""""
map s <Plug>(easymotion-s)
map <leader>ss <Plug>(easymotion-s2)
map <leader><leader><leader> <Plug>(easymotion-prefix)

" match lower & upper case
let g:EasyMotion_smartcase = 1

let g:EasyMotion_use_smartsign_us = 1

map <leader>l <Plug>(easymotion-lineforward)
map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion


""""""""""""""""""""""""""""""
" vim-fugitive
""""""""""""""""""""""""""""""
map <leader>gg :GitGutterToggle<CR>
map <leader>gs :Gstatus<CR>
set diffopt+=vertical


""""""""""""""""""""""""""""""
" CtrlSF
""""""""""""""""""""""""""""""
" Prompt CtrlSF using ALT+f
nmap ƒ <Plug>CtrlSFPrompt
vmap ƒ <Plug>CtrlSFVwordPath

" Toggle CtrlSF result display
map † :CtrlSFToggle<CR>

let g:ctrlsf_indent = 2


""""""""""""""""""""""""""""""
" vim airline
""""""""""""""""""""""""""""""
let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline_powerline_fonts = 1
let g:airline_theme="badwolf"

" Automatically truncate sections
let g:airline#extensions#default#section_truncate_width = {
  \ 'b': 100,
  \ 'x': 100,
  \ 'y': 105,
  \ 'z': 50,
  \ 'warning': 50,
  \ }


""""""""""""""""""""""""""""""
" Ultisnips
""""""""""""""""""""""""""""""
" Trigger configuration
let g:UltiSnipsExpandTrigger="<C-Space>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"


""""""""""""""""""""""""""""""
" vim-jsx
""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files


""""""""""""""""""""""""""""""
" vim-jsbeautify
""""""""""""""""""""""""""""""
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>


""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""
let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
" let g:ale_open_list = 1
let g:ale_sign_column_always = 1

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'

" navigate between errors quickly
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Show errors or warnings in statusline
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? 'OK' : printf(
  \   '%dW %dE',
  \   all_non_errors,
  \   all_errors
  \)
endfunction

set statusline=%{LinterStatus()}
