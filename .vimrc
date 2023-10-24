

"  ██╗   ██╗██╗███╗   ███╗  Maintainer: Basir (bsrrmz@live.com)
"  ██║   ██║██║████╗ ████║  Date:       Tue, 5 Sep 08:19:07 AM IST 2023
"  ██║   ██║██║██╔████╔██║  Version:    0.1
"  ╚██╗ ██╔╝██║██║╚██╔╝██║
"   ╚████╔╝ ██║██║ ╚═╝ ██║
"    ╚═══╝  ╚═╝╚═╝     ╚═╝



set nocompatible " Disable compatibility with vi which can cause unexpected issues.
syntax on " Turn syntax highlighting on.

" Enable type file detection. Vim will be able to try to detect the type of file is use.
" Enable plugins and load plugin for the detected file type.
" Load an indent file for the detected file type.
filetype plugin indent on



" PLUGINS  ------------------------------------------------------------

    "Plug 'morhetz/gruvbox'
    "Plug 'fneu/breezy'

call plug#begin('~/.vim/plugged')

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    Plug 'mcchrish/nnn.vim'
    Plug 'dense-analysis/ale'

    Plug 'mattn/emmet-vim'
    Plug 'davidhalter/jedi-vim' " Python autocompletion

    Plug 'tomasiser/vim-code-dark'

call plug#end()

" Floating window. This is the default
let g:nnn#layout = { 'window': { 'width': 0.4, 'height': 0.6, 'highlight': 'Comment' } }

" Or pass a dictionary with window size
"let g:nnn#layout = { 'left': '~10%' } " or right, up, down

" Set default encoding to utf-8
set encoding=utf-8
set fileencodings=utf-8
set termencoding=utf-8
"set termguicolors
set t_Co=256 " Set number of colors.
set hidden " Open other files if current one is not saved
set title " Show title in console title bar.
set autoread

" Performance optimizations
" Indicate we have a fast terminal connection. Improves smooth redrawing
" make the switch between insert and normal mode faster
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast


" After given time, Vim will stop hihglighting further matches
" Syntax highlighting vs performance trade-off
set redrawtime=600

set mouse=a " Enable Mouse mode in all modes
set background=dark

set history=10000 " Set the commands to save in history default number is 20.

" Indentation
set autoindent
set cindent
set smartindent

set wrapmargin=0
set nowrap " Do not wrap lines. Allow long lines to extend as far as the line goes.
" Makes sense only for nowrap
set sidescroll=0 " Recenter cursor during horizontal scroll
set sidescrolloff=3 " Keep some characters visible during horizontal scroll
set textwidth=128 "prevent vim auto new lines

" Add numbers to the file.
set number " Show line numbers.
set relativenumber " Show relative line numbers.
set numberwidth=4
set signcolumn=number " Always show sign column on the left, even when no signs

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

set ruler " Show current cursor position in the lower right corner.

set scrolloff=7 " Do not let cursor scroll below or above N number of lines when scrolling.
set cursorline " Highlight cursor line underneath the cursor horizontally.
"set cursorcolumn " Highlight cursor line underneath the cursor vertically.
set nostartofline " Keep cursor at the same column after navigating within a file (e.g gg, G)

set shiftwidth=4 " Set shift width to 4 spaces.
set tabstop=4 " Set tab width to 4 columns.
set expandtab " Use space characters instead of tabs.

"" SAVE
set nobackup " Do not save backup swap files.
set noswapfile
set backupcopy=yes " https://en.parceljs.org/hmr.html#safe-write
set undofile " An undo history
set undodir=/tmp " Directories for backup, undo and swap files

set showcmd " Show partial command you type in the last line of the screen.
set showmode " Show the mode you are on the last line.

" always use system clipboard as unnamed register
" Detect when system clipboard changes and sync it with yank unnamed register
set clipboard=unnamed,unnamedplus " Allow copy and paste from system clipboard

"" SEARCH
"set autochdir " Change the current directory to the directory of the current file
set incsearch " While searching though a file incrementally highlight matching characters as you type.
set hlsearch " Use highlighting when doing a search.
"set nohlsearch " " Do not highlight search results by default
set ignorecase " Ignore capital letters during search.
set smartcase " This will allow you to search specifically for capital letters." Override the ignorecase option if searching for capital letters.
set showmatch " Show matching words during a search.show matching brackets (),{},[]
set wrapscan  " Stop when reaching last match, don't start over

" Provide tab-completion for all file-related tasks
set path+=** " Search down into subfolders

"set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
"set wildmode=longest,list " Make wildmenu behave like similar to Bash completion.
set wildmenu " Display all matching files when we tab complete " Enable auto completion menu after pressing TAB.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Wildmenu will ignore files with these extensions.
set diffopt+=iwhite " Ignore whitespace whilst diffing

set splitbelow "open horizontal splits below the current window
set splitright "open vertical splits to the right of the current window

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
    " https://github.com/vim/vim/issues/993#issuecomment-255651605
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

    set termguicolors
endif

" MAPPINGS  ------------------------------------------------------------
"nnoremap – Allows you to map keys in normal mode.
"inoremap – Allows you to map keys in insert mode.
"vnoremap – Allows you to map keys in visual mode.
"nnoremap ,html :-1read $HOME/<CR>3jwf

let mapleader = "\<space>"

" you can split the window in Vim by typing :split or :vsplit.
" navigate the split view easier by pressing CTRL+j, CTRL+k, CTRL+h, or
" ctrl+l.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" resize split windows using arrow keys by pressing:
" ctrl+up, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
nnoremap <c-down> <c-w>+
nnoremap <c-up> <c-w>-
nnoremap <c-right> <c-w>>
nnoremap <c-left> <c-w><

" create new tabs  {{
nnoremap <leader>t :tabnew<Enter>
" close current tab
nnoremap <leader>w :tabclose<Enter>
" close all except current tab :tabo or tab:only
nnoremap <leader>q :tabonly<Enter>

" Navigating tabs
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
"Previous and next window
"nnoremap <C-L> gt
"nnoremap <C-H> gT
nnoremap <leader>l gt
nnoremap <leader>h gT


" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <F5> :w <CR>:!clear <CR>:!python3 % <CR>


" https://github.com/kaihendry/dotfiles/blob/master/.vimrc
" Spelling right! en_gb
" Spell-check set to <F8>
map <F8> :setlocal spell! spelllang=en_us<CR>

nnoremap <F1> :buffers<CR>:buffer<Space>

" Alias for saving when not editing as sudo
cmap w!! %!sudo tee > /dev/null %

" Control-Backspace to remove last word
inoremap <C-H> <C-W>

" Ignore white space in vimdiff
"set diffopt+=iwhite " Ignore whitespace whilst diffing
"nnoremap <silent> <F5> :%s/\s\+$//<cr>


" Automatically deletes all trailing whitespaces on save
autocmd BufWritePre * %s/\s\+$//e


" -----------------------------------------------------------------------------
" Plugins settings
" -----------------------------------------------------------------------------

" PLUGINS Configuration ------------------------------------------------------------


" Enable completion where available.
" This setting must be set before ALE is loaded.
"
" You should not turn this setting on if you wish to use ALE as a completion
" source for other completion plugins, like Deoplete.
"let g:ale_completion_enabled = 1

"let g:ale_linters = {'javacsript': ['prettier']}
"let g:ale_floating_window_border = repeat([''], 8)


" Pluggins Configurations
"
" FZF
" https://github.com/erikw/dotfiles/blob/main/.config/vim/vimrc
" fzf.vim {
" " Stolen from my friend
" https://github.com/erikagnvall/dotfiles/blob/master/vim/init.vim
" " Comment must be on line of its own...
" " Search for files in given path.
" nnoremap <Leader>f :FZF<space>
" " Search for files starting at current directory.
" " Sublime-like shortcut 'go to file' ctrl+p.
" " Disabled here; see vim-yoink section for a re-mapping for :Files
" "nnoremap <C-p> :Files<CR>
" " Search for files starting at current directory.
" " Sublime-like shortcut 'go to file' ctrl+shift+p. Note: <C-S-p> is not
" mappable in vim. <M-P> is in neovim but not vim.
" nnoremap <leader>c :Commands<CR>
" " Search in tags file.
" nnoremap <Leader>T :Tags<CR>
" " Search open buffers.
" " ; conflicts with repeating search for characther (fF]
" "nnoremap ; :Buffers<CR>
" "nnoremap <leader>; :Buffers<CR>
" nnoremap <Leader>b :Buffers<CR>
" " Search open tabs (indirectly;
" https://medium.com/@paulodiovani/vim-buffers-windows-and-tabs-an-overview-8e2a57c57afa).
" nnoremap <Leader>t :Windows<CR>
" " Search history of opended files
" nnoremap <Leader>H :History<CR>
" " Search mappings.
" nnoremap <Leader>m :Maps<CR>
" " Search with rg (aka live grep).
" nnoremap <Leader>g :Rg<CR>
"}
"

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit' }


" Use vim window popup
" let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.8, 'yoffset': 0, 'border': 'bottom', 'highlight': 'Todo' } }
" let g:fzf_layout = { 'window': 'enew' } " use vim window - -tabnew, 10new
let g:fzf_layout = { 'down': '30%' } " use terminal window - down / up / left / right
" disable the statusline for a cleaner look.
autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" --border-label="| My Cool Label |"--layout=reverse-list
let $FZF_DEFAULT_OPTS = '--header="| esc:exit | c-space:preview | c-w:wrap | c-d:down | c-u:up | c-l:clear |" --header-first  --border=bottom --info=inline --preview-window="wrap:hidden"  --multi --bind="ctrl-space:toggle-preview,ctrl-w:toggle-preview-wrap,ctrl-d:half-page-down,ctrl-u:half-page-up,ctrl-l:clear-query"'

"noremap <C-f> :Files!<CR>
noremap <silent> <Leader>o :Files<CR>
noremap <silent> <Leader>O :Files ~<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
inoremap <C-f> <Esc><Esc> :BLines!<CR>
nnoremap <C-f> <Esc><Esc> :Lines!<CR>

" Customize fzf colors to match your color scheme.
" - fzf#wrap translates this to a set of `--color` options
let g:fzf_colors =
            \ { 'fg':         ['fg', 'Normal'],
            \ 'bg':         ['bg', 'Normal'],
            \ 'preview-bg': ['bg', 'NormalFloat'],
            \ 'hl':         ['fg', 'Comment'],
            \ 'fg+':        ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
            \ 'bg+':        ['bg', 'CursorLine', 'CursorColumn'],
            \ 'hl+':        ['fg', 'Statement'],
            \ 'info':       ['fg', 'PreProc'],
            \ 'border':     ['fg', 'Ignore'],
            \ 'prompt':     ['fg', 'Conditional'],
            \ 'pointer':    ['fg', 'Exception'],
            \ 'marker':     ['fg', 'Keyword'],
            \ 'spinner':    ['fg', 'Label'],
            \ 'header':     ['fg', 'Comment'] }


" :LS [path]
command! -bang -complete=dir -nargs=? LS
    \ call fzf#run(fzf#wrap({'source': 'ls', 'dir': <q-args>}, <bang>0))A


" Emmet Vim shortcuts
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_leader_key=',' "To remap the default <C-Y> leader:


let g:jellybeans_overrides = {
            \    'background': { 'ctermbg': 'none', '256ctermbg': 'none' },
            \}
if has('termguicolors') && &termguicolors
        let g:jellybeans_overrides['background']['guibg'] = 'none'
endif


" Specific colorscheme settings (must come before setting your colorscheme).
"let g:gruvbox_contrast_dark='hard'
"hi Normal guibg=NONE ctermbg=NONE

" Make the background transparent
let g:codedark_transparent=1

colorscheme codedark
"colorscheme jellybeans
"colorscheme breezy
highlight clear SignColumn




" STATUS LINE ------------------------------------------------------------


"function! s:statusline_expr()
"    let mod = "%{&modified ? '[+] ' : !&modifiable ? '[x] ' : ''}"
"    let ro  = "%{&readonly ? '[RO] ' : ''}"
"    let ft  = "%{len(&filetype) ? '['.&filetype.'] ' : ''}"
"    let fug = "%{exists('g:loaded_fugitive') ? fugitive#statusline() : ''}"
"    let sep = ' %= '
"    let pos = ' %-12(%l : %c%V%) '
"    let pct = ' %P'
"
"    return '[%n] %f %<'.mod.ro.ft.fug.sep.pos.'%*'.pct
"endfunction

"let &statusline = s:statusline_expr()


function! StatuslineGitBranch()
    let b:gitbranch=""
    if &modifiable
        try
            let l:dir=expand('%:p:h')
            let l:gitrevparse = system("git -C ".l:dir." rev-parse --abbrev-ref HEAD")
            if !v:shell_error
                let b:gitbranch=" ".substitute(l:gitrevparse, '\n', '', 'g')." "
            endif
        catch
        endtry
    endif
endfunction


augroup GetGitBranch
    autocmd!
    autocmd VimEnter,WinEnter,BufEnter * call StatuslineGitBranch()
augroup END

function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? ' OK ' : printf(
                \   ' %dW %dE ',
                \   all_non_errors,
                \   all_errors
                \)
endfunction

function! ReadOnly()
    if &readonly || !&modifiable
        return ''
    else
        return ''
endfunction
"

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=%#DiffChange#               " colour
set statusline+=\ %n\                       " buffer number
set statusline+=%{&paste?'\ PASTE\ ':''}
set statusline+=%{&spell?'\ SPELL\ ':''}%*

set statusline+=%#DiffAdd#                   " colour
set statusline+=%{b:gitbranch}%*
set statusline+=%#CursorColumn#                   " colour
set statusline+=\ %f\ %m\ %{ReadOnly()}\ %r\ %w\ %h\    "kj

" Use a divider to separate the left side from the right side.
set statusline+=%=                          " right align

" Status line right side
set statusline+=%{v:register}               " copy  registry
set statusline+=\ %Y\                       " file type
set statusline+=%#ErrorMsg#%{(LinterStatus()!='\ OK\ ')?LinterStatus():''}%*
set statusline+=%#DiffAdd#%{(LinterStatus()=='\ OK\ ')?LinterStatus():''}%*

set statusline+=%#FoldColumn#               " colour
set statusline+=\ [%{&ff}:%{&fenc!=''?&fenc:&enc}\]\  "kj
set statusline+=\ \ %1l,%3L:%-2c\ %3P\      " line,lines:column   percentage
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\  "ji
"set statusline+=\%{strftime(\"%H:%M\")}\    " Time

" Show the status on the second to last line.
set laststatus=2

"set statusline+=\ %{LinterStatus()}\  "
"set statusline+=\ %{StatuslineMode()}\  "ds
"set statusline+=\%{winnr()}
"set statusline+=%#Visual#        " colour

"set statusline+=%#ErrorMsg#%{&modified?expand('%'):''}%#CursorColumn#%{&mod?'':expand('%')}

" Status bar code goes here.

"set statusline+=%#ToolbarButton#%{(mode()=='n')?'\ \ NORMAL\ ':''}
"set statusline+=%#StatusLineTerm#%{(mode()=='i')?'\ \ INSERT\ ':''}
"set statusline+=%#ModeMsg#%{(mode()=='r')?'\ \ RPLACE\ ':''}
"set statusline+=%#ModeMsg#%{(mode()=='v')?'\ \ VISUAL\ ':''}
"set statusline+=%#ModeMsg#%{(IsCv())?'\ \ VISUAL\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='s')?'\ \ SELECT\ ':''}
"set statusline+=%#ToolbarButton#%{(mode()=='t')?'\ \ TERMINAL\ ':''}
"set statusline+=%#ToolbarButton#%{(mode()=='c')?'\ \ COMMAND\ ':''}
"set statusline+=%#DiffChange#%{(mode()=='#')?'\ \ SHELL\ ':''}



"set statusline+=\ %{&filetype}\  " file type (%Y and %y are too ugly)
":set statusline=%F%m%r%h%w [FORMAT=%{&ff}] [TYPE=%Y] [ASCII=%03.3b] [HEX=%02.2B] [POS=%04l,%04v][%p%%] [LEN=%L]
"set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ %Y\ %p%%
"set statusline+=%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'\ [%v][%t]\   "j
"set statusline+=%{&hlsearch?'+':'-'}
"%f%m%r%h%w\
"%f short file name %F full file path %t last tail

"set statusline+=\[%{&fileformat}\]
"set statusline+=\ %{&fileencoding?&fileencoding:&encoding}\   "jkjkjkjkjkjkjkj



"set statusline+=%w               " preview flag
"set statusline+=%h               " help flag
"set statusline+=%r               " readonly flag %R
"set statusline+=%m               " modified [+] flag %M for +


" custom highlight groups
"highlight IsModified    ctermbg=red
"highlight IsNotModified ctermbg=green

" Dynamic status line
"set statusline+=%#IsModified#%{&mod?expand('%'):''}%*%#IsNotModified#%{&mod?'':expand('%')}%*
"               \______________ Part A _____________/\______________ Part B ________________/


"function! StatuslineMode()
"    let l:mode=mode()
"    if l:mode==#"n"
"        return "NORMAL"
"    elseif l:mode==?"v"
"        return "VISUAL"
"    elseif l:mode==#"i"
"        return "INSERT"
"    elseif l:mode==#"R"
"        return "REPLACE"
"    elseif l:mode==?"s"
"        return "SELECT"
"    elseif l:mode==#"t"
"        return "TERMINAL"
"    elseif l:mode==#"c"
"        return "COMMAND"
"    elseif l:mode==#"!"
"        return "SHELL"
"    endif
"endfunction

"function! IsCv()
"  return "\<C-v>" == mode()  " because \" is a comment, we need a function for this…
"endfunction



"##############################################################################
"	Following is a description of the possible statusline items.  The
"	second character in 'item" is the type:
"		N for number
"		S for string
"		F for flags as described below
"		- not applicable
"
"	item  meaning ~
"	f S   Path to the file in the buffer, as typed or relative to current
"	      directory.
"	F S   Full path to the file in the buffer.
"	t S   File name (tail) of file in the buffer.
"	m F   Modified flag, text is '[+]"; ;[-]" if 'modifiable' is off.
"	M F   Modified flag, text is ',+" or ;,-".
"	r F   Readonly flag, text is '[RO]".
"	R F   Readonly flag, text is ',RO".
"	h F   Help buffer flag, text is '[help]".
"	H F   Help buffer flag, text is ',HLP".
"	w F   Preview window flag, text is '[Preview]".
"	W F   Preview window flag, text is ',PRV".
"	y F   Type of file in the buffer, e.g., '[vim]".  See 'filetype'.
"	Y F   Type of file in the buffer, e.g., ',VIM".  See 'filetype'.
"	q S   [Quickfix List]", [Location List]" or empty.
"	k S   Value of b:keymap_name" or 'keymap' when |:lmap| mappings are
"	      being used: <keymap>"
"	n N   Buffer number.
"	b N   Value of character under cursor.
"	B N   As above, in hexadecimal.
"	o N   Byte number in file of byte under cursor, first byte is 1.
"	      Mnemonic Offset from start of file (with one added)
"	      {not available when compiled without |+byte_offset| feature}
"	O N   As above, in hexadecimal.
"	N N   Printer page number.  (Only works in the 'printheader' option.)
"	l N   Line number.
"	L N   Number of lines in buffer.
"	c N   Column number (byte index).
"	v N   Virtual column number (screen column).
"	V N   Virtual column number as -{num}.  Not displayed if equal to 'c'.
"	p N   Percentage through file in lines as in |CTRL-G|.
"	P S   Percentage through file of displayed window.  This is like the
"	      percentage described for 'ruler'.  Always 3 in length, unless
"	      translated.
"	S S   'showcmd' content, see 'showcmdloc'.
"	a S   Argument list status as in default title.  ({current} of {max})
"	      Empty if the argument file count is zero or one.
"	{ NF  Evaluate expression between '%{' and '}' and substitute result.
"	      Note that there is no '%' before the closing '}'.  The
"	      expression cannot contain a '}' character, call a function to
"	      work around that.  See |stl-%{| below.
"	{% -  This is almost same as { except the result of the expression is
"	      re-evaluated as a statusline format string.  Thus if the
"	      return value of expr contains % items they will get expanded.
"	      The expression can contain the } character, the end of
"	      expression is denoted by %}.
"	      For example: >
"		func! Stl_filename() abort
"		    return '%t"
"		endfunc
"<	        `stl=%{Stl_filename()}`   results in `"%t"`
"	        `stl=%{%Stl_filename()%}` results in `"Name of current file"`
"	%} -  End of `{%` expression
"	( -   Start of item group.  Can be used for setting the width and
"	      alignment of a section.  Must be followed by %) somewhere.
"	) -   End of item group.  No width fields allowed.
"	T N   For 'tabline': start of tab page N label.  Use %T after the last
"	      label.  This information is used for mouse clicks.
"	X N   For 'tabline': start of close tab N label.  Use %X after the
"	      label, e.g.: %3Xclose%X.  Use %999X for a 'close current tab"
"	      mark.  This information is used for mouse clicks.
"	< -   Where to truncate line if too long.  Default is at the start.
"	      No width fields allowed.
"	= -   Separation point between alignment sections.  Each section will
"	      be separated by an equal number of spaces.  With one %= what
"	      comes after it will be right-aligned.  With two %= there is a
"	      middle part, with white space left and right of it.
"	      No width fields allowed.
"	# -   Set highlight group.  The name must follow and then a # again.
"	      Thus use %#HLname# for highlight group HLname.  The same
"	      highlighting is used, also for the statusline of non-current
"	      windows.
"	* -   Set highlight group to User{N}, where {N} is taken from the
"	      minwid field, e.g. %1*.  Restore normal highlight with %* or %0*.
"	      The difference between User{N} and StatusLine will be applied to
"	      StatusLineNC for the statusline of non-current windows.
"	      The number N must be between 1 and 9.  See |hl-User1..9|
"
"	When displaying a flag, Vim removes the leading comma, if any, when
"	that flag comes right after plaintext.  This will make a nice display
"	when flags are used like in the examples below.
"
"	When all items in a group becomes an empty string (i.e. flags that are
"	not set) and a minwid is not set for the group, the whole group will
"	become empty.  This will make a group like the following disappear
"	completely from the statusline when none of the flags are set. >
"		:set statusline=...%(\ [%M%R%H]%)...
"<	Beware that an expression is evaluated each and every time the status
"	line is displayed.
"				*stl-%{* *g:actual_curbuf* *g:actual_curwin*
"	While evaluating %{} the current buffer and current window will be set
"	temporarily to that of the window (and buffer) whose statusline is
"	currently being drawn.  The expression will evaluate in this context.
"	The variable ;g:actual_curbuf" is set to the `bufnr()` number of the
"	real current buffer and ;g:actual_curwin" to the |window-ID| of the
"	real current window.  These values are strings.
"
"	The 'statusline' option will be evaluated in the |sandbox| if set from
"	a modeline, see |sandbox-option|.
"	This option cannot be set in a modeline when 'modelineexpr' is off.
"
"	It is not allowed to change text or jump to another window while
"	evaluating 'statusline' |textlock|.
"
"	If the statusline is not updated when you want it (e.g., after setting
"	a variable that's used in an expression), you can force an update by
"	using `:redrawstatus`.
"
"	A result of all digits is regarded a number for display purposes.
"	Otherwise the result is taken as flag text and applied to the rules
"	described above.
"
"	Watch out for errors in expressions.  They may render Vim unusable!
"	If you are stuck, hold down ':' or 'Q' to get a prompt, then quit and
"	edit your .vimrc or whatever with 'vim --clean" to get it right.
"
"	Examples
"	Emulate standard status line with 'ruler' set >
"	  :set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
"<	Similar, but add ASCII value of char under the cursor (like 'ga') >
"	  :set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
"<	Display byte count and byte value, modified flag in red. >
"	  :set statusline=%<%f%=\ [%1*%M%*%n%R%H]\ %-19(%3l,%02c%03V%)%O'%02b'
"	  :hi User1 term=inverse,bold cterm=inverse,bold ctermfg=red
"<	Display a ,GZ flag if a compressed file is loaded >
"	  :set statusline=...%r%{VarExists('b:gzflag','\ [GZ]')}%h...
"<	In the |:autocmd|'s: >
"	  :let b:gzflag = 1
"<	And: >
"	  :unlet b:gzflag
"<	And define this function: >
"	  :function VarExists(var, val)
"	  :    if exists(a:var) | return a:val | else | return '' | endif
"	  :endfunction
"
"
"
"
"
"
"
