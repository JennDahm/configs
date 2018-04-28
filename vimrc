"" VIM Configuration file
"" Set up a symlink at ~/.vimrc to this file.

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" General:
" - Line numbers
" - Syntax highlighting and color
" - Visual Niceities
" - Tab/indent settings
" - Line width
" - Buffer status line
" - etc.
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set nocompatible " We don't need to worry about vi compatibility.
set hidden      " Allow modified buffers to be swapped out without discarding changes

set number          " Absolute line numbers. With relativenumber, only shows the current line number.
set relativenumber  " Line numbers relative to the current line (useful for relative motion)
syntax enable
" TODO: Add a color scheme?

set cursorline  " Highlight the current line.
set colorcolumn=+1,+20 " Highlight the column after textwidth and 20 after textwidth
set showcmd     " Show commands as I type them.
set wildmenu    " Show graphical menu when completing wildcards
set showmatch   " Highlight matching braces [{(<>)}]

" Invisible Characters:
" - tab:>-  Tabs are displayed as >-------
" - trail:~ Trailing spaces are displayed as ~
set listchars=tab:>-,trail:~,extends:>,precedes:<

" Linux Kernel standards:
set tabstop=8      " 8 visual characters per tab
set softtabstop=8  " 8 spaces per tab when typing.
"set shiftwidth=8  " Number of spaces for autoindention; =tabstop by default
set noexpandtab    " I can't expand my tabs into spaces.
set textwidth=80   " 80 characters per line.
set nowrap         " Don't wrap lines if the window is too narrow.


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Formatting:
" - Auto-indentation
" - Format options
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set cindent  " This works great for C files. See also: indentexpr
set cino=:0  " Indentation control: don't indent case labels.
" cino provides fine-grained control over indentation. Useful examples:
" LN (help cino-L) - Control alignment of jump labels
" :N (help cino-:) - Control alignment of case labels in switch blocks
" lN (help cino-l) - Control alignment after case labels in switch blocks
" bN (help cino-b) - Control alignment of break statements in switch blocks
"                    (i.e. make break align with case so that it sorta looks
"                    like a block.)
" gN (help cino-g) - Control alignment of C++ scope declarations
" hN (help cino-g) - Control alignment after C++ scope declarations
" +N (help cino-+) - Control alignment of line continuations
" (N (help cino-() - Control alignment of line continuations within parenthesis

" Sets some format options: (help fo-table)
" - t : Auto-wrap "text"
" - c : Auto-wrap comments
" - r : Automatically insert comment leaders in insert mode.
" - o : Automatically insert comment leaders after o and O commands
" - j : Remove comment leader when joining lines (if sane)
" Alternative: set formatprg for an external formatting application
set formatoptions=tcroj

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Status Line
"
" Examples:
" |src/main.c [+][c][Buffer 1]   ---   20, 30/140     25%|
" |options.text [-][help]        ---   64, 7418/9120  81%|
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
set statusline =%f\  " Path to file from CWD (and a space)
set statusline+=%m   " Modified/Non-modifiable?
set statusline+=%y   " File type (for help files, this is [help])
" Show the buffer number, but only if the buffer is listed:
set statusline+=%{buflisted(bufname('%'))?'[Buffer\ '.bufnr('%').']':''}

set statusline+=%=   " Left/Right Split

" Left-aligned group (18 chars minimum): (Visual) Column, Line Number, Total Lines
set statusline+=%-18(%3v,\ %l/%L%)
set statusline+=\ %P " Percentage through file

" Ensure that the status line is always shown:
set laststatus=2

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Commands:
" - Various improvements to commands in VIM
"   - Search improvements
"   - Movement improvements
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

" Set the "leader" character:
let mapleader=","

set incsearch   " Incrementally search as I type my query
set hlsearch    " Highlight search matches
" Link ,<space> to the command to turn off highlights after a search:
nnoremap <leader><space> :nohlsearch<CR>

" Link return to the command to follow a link
" Also link backspace to the command to return from a link.
nnoremap <CR> <C-]>
nnoremap <BS> <C-T>

" Link ,l to the command to toggle invisible characters:
nnoremap <leader>l :set<space>list!<CR>

" Move vertically by visual line, not file line:
nnoremap j gj
nnoremap k gk

" Easier movement to beginning/end of line
" This removes the ability to jump to the beginning and end of visual words,
" but I never use that feature anyway.
nnoremap B ^
nnoremap E $


" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Notes:
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
" Things to look into:
" * CtrlP : fuzzy file searcher
" * The Silver Searcher (Ag): Source code searcher
" * Folding?
" * CTags?
" * Color schemes? I've been recommended badwolf and solarized
" * Scrolling with mouse, and with key commands?

