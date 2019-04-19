""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

""""""""""""""""""""""""""""""
" Editor Config
""""""""""""""""""""""""""""""
" Asynchronous completion for neovim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'  }

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Color Scheme
Plug 'joshdick/onedark.vim'

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'

" Git wrapper
Plug 'tpope/vim-fugitive'

" Zoom in/out of windows
Plug 'troydm/zoomwintab.vim'


""""""""""""""""""""""""""""""
" Editor Utils
""""""""""""""""""""""""""""""
" Asynchronous Lint Engine
Plug 'w0rp/ale'

" The ultimate undo history visualizer for VIM
" Plug 'mbbill/undotree'

" EditorConfig plugin for Vim
" Plug 'editorconfig/editorconfig-vim'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Alignment for vim
" Plug 'junegunn/vim-easy-align'

" fzf  vim (Fuzzy file, buffer finder)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" Code search and view tool
Plug 'dyng/ctrlsf.vim'

" BufExplorer quickly and easily switch between buffer
Plug 'jlanzarotta/bufexplorer'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'

" Preview colors in source code
" Plug 'ap/vim-css-color'

" Emmet for vim
" Plug 'mattn/emmet-vim'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Paste in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'

" vim-snipmate default snippets
" Plug 'honza/vim-snippets'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'



""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""

" kubernetes syntax and snippet support
" Plug 'andrewstuart/vim-kubernetes'

" Go development plugin for Vim
Plug 'fatih/vim-go'

" Typescript syntax files for Vim
" Plug 'leafgarland/typescript-vim'

" Vim syntax file & snippets for Docker's Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Javascript indentation and syntax support
" Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting & indenting
" Plug 'mxw/vim-jsx'

" CSS3 syntax support
" Plug 'hail2u/vim-css3-syntax'

" SCSS syntax highlighting
" Plug 'cakebaker/scss-syntax.vim'

" Syntax for styled-components
" Plug 'styled-components/vim-styled-components'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'

" Improved nginx vim plugin (incl. syntax highlighting)
" Plug 'chr4/nginx.vim'

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""
" => PLUGIN SPECIFC CONFIGURATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" onedark theme
""""""""""""""""""""""""""""""
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1 " I love italic for comments


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
let g:NERDTreeWinSize = 25
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-e> :NERDTreeToggle<CR>


""""""""""""""""""""""""""""""
" vim markdown
""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1


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
" fzf
""""""""""""""""""""""""""""""
let g:fzf_layout = { 'down': '40%' }
" Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" Search project files, respecting git ignore
nnoremap <silent> <C-p> :FZF<CR>

" Search all files, e.g. node_modules/
nnoremap <silent> <leader>af :call fzf#vim#files('',
      \ {'source': 'ag --hidden --ignore .git -f -g "" -u', 'down': '40%'})<CR>

" Search MRU buffers
" nnoremap <silent> <leader>f :Buffers<CR>
" nnoremap <silent> <leader>` :Marks<CR>

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test'
" nnoremap <silent> <leader>t :Tags<CR>
" nnoremap <silent> <leader>b :BTags<CR>


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
" let g:airline_theme="badwolf"
let g:airline_theme="bubblegum"

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
" vim-javascript
""""""""""""""""""""""""""""""
let g:javascript_plugin_jsdoc = 1 " Enables syntax highlighting for JSDocs.
let g:javascript_plugin_flow = 1 " Enables syntax highlighting for Flow.

""""""""""""""""""""""""""""""
" vim-jsx
""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

""""""""""""""""""""""""""""""
" ALE
""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint', 'flow'],
\}

let g:ale_fixers = {
\   'javascript': [
\       'eslint',
\       {buffer, lines -> filter(lines, 'v:val !=~ ''^\s*//''')},
\   ],
\}

let g:ale_linter_aliases = {'jsx': 'css'}

let g:ale_pattern_options = {
\ '\.min\.js$': {'ale_linters': [], 'ale_fixers': []},
\ '\.min\.css$': {'ale_linters': [], 'ale_fixers': []},
\}

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'
" let g:ale_open_list = 1
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%] %s'

" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'

" navigate between errors quickly
nmap <silent> <C-S-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-S-j> <Plug>(ale_next_wrap)

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


""""""""""""""""""""""""""""""
" EditorConfig
""""""""""""""""""""""""""""""
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""
" Enable deoplete.
let g:deoplete#enable_at_startup = 1

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=tern#Complete
augroup end

let g:tern_request_timeout = 1
let g:tern_show_argument_hints = 'on_hold'
let g:tern_show_signature_in_pum = 0

let g:python_host_prog = '/usr/local/Cellar/python/3.7.2_2/bin/python3'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.2_2/bin/python3'
" Automatically close preview window after autocompletion
autocmd CompleteDone * if pumvisible() == 0 | pclose | endif

""""""""""""""""""""""""""""""
" Zoomwintab
""""""""""""""""""""""""""""""
nnoremap <silent> <leader>z :ZoomWinTabToggle<cr>

""""""""""""""""""""""""""""""
" Prettier
""""""""""""""""""""""""""""""

" Override default with async cuz vim8/neovim
" nmap <Leader>p <Plug>(PrettierAsync)
