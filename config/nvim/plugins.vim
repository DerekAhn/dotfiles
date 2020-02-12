" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

""""""""""""""""""""""""""""""
" Editor UI
""""""""""""""""""""""""""""""

" Lean & mean status/tabline
Plug 'vim-airline/vim-airline'

" Add filetype glyphs (icons)
Plug 'ryanoasis/vim-devicons'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Color Scheme
Plug 'joshdick/onedark.vim'

" Tree explorer for vim.
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Tmux statusline generator with support for airline
Plug 'edkolev/tmuxline.vim'

" Seamless navigation between tmux panes and vim splits
Plug 'christoomey/vim-tmux-navigator'

" Display indention levels with vertical lines
Plug 'Yggdroot/indentLine'


""""""""""""""""""""""""""""""
" Editor Git
""""""""""""""""""""""""""""""

" From a very single vim buffer, you can perform main git operations in few key press.
" Plug 'jreybert/vimagit'

" Git wrapper
" Plug 'tpope/vim-fugitive'

" Shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'


""""""""""""""""""""""""""""""
" Editor Utils
""""""""""""""""""""""""""""""

" Asynchronous Lint Engine
Plug 'w0rp/ale'

" Vim plugin, insert or delete brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Dark powered asynchronous completion framework for neovim/Vim8
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" fzf  vim (Fuzzy file, buffer finder)
Plug 'junegunn/fzf.vim'

" A Vim plugin for Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" Enable repeating supported plugin maps
Plug 'tpope/vim-repeat'

" Vim plugin for generating images of source code
Plug 'segeljakt/vim-silicon'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" UltiSnips - The ultimate snippet solution for Vim
Plug 'SirVer/ultisnips'

" Zoom in/out of windows
Plug 'troydm/zoomwintab.vim'


""""""""""""""""""""""""""""""
" Syntax support
""""""""""""""""""""""""""""""

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'


""""""""""""""""""""""""""""""
" Frontend Plugins
""""""""""""""""""""""""""""""

" Emmet for vim
Plug 'mattn/emmet-vim'

" React JSX syntax highlighting and indenting for vim.
Plug 'mxw/vim-jsx'

" A vim plugin for Flow
Plug 'flowtype/vim-flow'

" Preview colors in source code
" Plug 'ap/vim-css-color'

" A Vim plugin that provides GraphQL file detection, syntax highlighting, and indentation.
" Plug 'jparise/vim-graphql'

" Syntax for styled-components
" Plug 'styled-components/vim-styled-components'


" Initialize plugin system
call plug#end()