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

" Insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" fzf  vim (Fuzzy file, buffer finder)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Code search and view tool
Plug 'dyng/ctrlsf.vim'

" Vim motions on speed
Plug 'easymotion/vim-easymotion'

" Paste in Vim with indentation adjusted to destination context
Plug 'sickill/vim-pasta'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

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

" The ultimate undo history visualizer for VIM
" Plug 'mbbill/undotree'
"
" Intellisense engine for vim8 & neovim, full language server protocol support as VSCode
" Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}

" EditorConfig plugin for Vim
" Plug 'editorconfig/editorconfig-vim'

" Alignment for vim
" Plug 'junegunn/vim-easy-align'

" Preview colors in source code
" Plug 'ap/vim-css-color'

" Emmet for vim
" Plug 'mattn/emmet-vim'
"
" vim-snipmate default snippets
" Plug 'honza/vim-snippets'



""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" Vim syntax file & snippets for Docker's Dockerfile
Plug 'ekalinin/Dockerfile.vim'

" Markdown syntax highlighting
Plug 'plasticboy/vim-markdown'

" kubernetes syntax and snippet support
" Plug 'andrewstuart/vim-kubernetes'

" Typescript syntax files for Vim
" Plug 'leafgarland/typescript-vim'

" Javascript indentation and syntax support
" Plug 'pangloss/vim-javascript'

" React JSX syntax highlighting & indenting
" Plug 'mxw/vim-jsx'

" CSS3 syntax support
" Plug 'hail2u/vim-css3-syntax'

" Syntax for styled-components
" Plug 'styled-components/vim-styled-components'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'

" Improved nginx vim plugin (incl. syntax highlighting)
" Plug 'chr4/nginx.vim'
"
" Vim syntax for TOML
" Plug 'cespare/vim-toml'

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

function! FzfSpellSink(word)
  exe 'normal! "_ciw'.a:word
endfunction

function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10 })
endfunction

nnoremap z= :call FzfSpell()<CR>

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

let g:python_host_prog = '/usr/local/Cellar/python/3.7.3/bin/python3'
let g:python3_host_prog = '/usr/local/Cellar/python/3.7.3/bin/python3'
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

""""""""""""""""""""""""""""""
" Vim-go
""""""""""""""""""""""""""""""
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

let g:go_addtags_transform = "camelcase"
let g:go_autodetect_gopath = 1
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

" let g:go_auto_sameids = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1

" Shortcuts to navigate between errors
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>


augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=2 shiftwidth=2

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
