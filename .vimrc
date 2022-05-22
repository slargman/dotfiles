" Plugins {{{1

function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()	" initialize vim-plug

	" How things look {{{2
		" Fancy status bar
		Plug 'bling/vim-airline', Cond(!exists('g:vscode'))
		Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))

		" Show which lines have been added, modified, and removed
		"Plug 'airblade/vim-gitgutter'

    "Dracula theme
    "Plug 'dracula/vim', { 'as': 'dracula' }, Cond(!exists('g:vscode'))
    Plug 'dracula/vim', { 'as': 'dracula' }

		" Two-pane outliner
		"Plug 'vim-scripts/VOoM'

	" How things work {{{2
    Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})
    let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-html', 'coc-json', 'coc-markdownlint', 'coc-prettier', 'coc-tsserver']
    
		"Plug 'scrooloose/neerdtree', Cond(!exists('g:vscode'))
		"Plug 'ryanoasis/vim-devicons', Cond(!exists('g:vscode'))

		"Plug 'ctrlpvim/ctrlp.vim', Cond(!exists('g:vscode'))

		" Align text at delimiters
		"Plug 'junegunn/vim-easy-align', Cond(!exists('g:vscode'))

		" Rainbow parentheses
		Plug 'junegunn/rainbow_parentheses.vim', Cond(!exists('g:vscode'))

		" Git integration
		Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))

		" Expanded git integration
		"Plug 'gregsexton/gitv', Cond(!exists('g:vscode'))


		" Commands for (un)commenting
		Plug 'scrooloose/nerdcommenter', Cond(!exists('g:vscode'))

		" Thesaurus
		" requires python
		"Plug 'ron89/thesaurus_query.vim'

		" Table mode
		"Plug 'dhruvasagar/vim-table-mode', Cond(!exists('g:vscode'))

		" Do completions with Tab
		"Plug 'ervandew/supertab', Cond(!exists('g:vscode'))

		" Commands for (un)surrounding text with delimiters
		Plug 'tpope/vim-surround'

		" Graph undo tree
		Plug 'mbbill/undotree', Cond(!exists('g:vscode'))
		

	" Language plug-ins

		" R
		"Plug 'jalvesaq/nvim-r'
		"Plug 'gaalcaras/ncm-R'
		"Plug 'chrisbra/csv.vim'

		" Python


call plug#end()

if exists('g:vscode')

  set encoding=utf-8

  " Set location of swap files used for recovery
  set directory=~/.vim/tmp/swap

  " Set location of undo files for persistent undo
  "set undodir=~/.vim/tmp/undo

  "" Set location for backup files
  set backupdir=~/.vim/tmp/backup

  set autochdir	" automatically change working directory to current file's location

  filetype plugin indent on	" recognize filetype, load associated plugins, and use associated indentation

  set hidden	" Hides buffers instead of closing them

  " Show as much as possible of the last line
  set display+=lastline

	" Control where new splits open
	set splitright
	set splitbelow

	" Configure backspace so it acts as it should act
	set backspace=eol,start,indent

	set whichwrap+=h,l	" Allow h and l to move onto the previous/next line when on first/last character of line

	set scrolloff=999	" Keep current line centered

" Looks {{{1


	syntax enable	" Enable syntax highlighting

	"" Increase spacing between lines for legibility
	set linespace=1
	
	""noremap <Esc>O[ <Esc>
	""noremap! <Esc>O[ <C-c>

	set notimeout
	set ttimeout

	"" UI Layout {{{2

		set laststatus=2	" Show the status line in the last window (e.g. when starting Vim)

		set showcmd	" Show entered commands in the last line of the screen

		""set number	" Show current line number
		""set relativenumber	" Show line numbers relative to current line
		set numberwidth=4	" Minimum number of lines to use for line number

		"" Remove | in vert split dividers
		set fillchars+=vert:\ 

"" Search {{{1

	set hlsearch	" Highlight search results

	set incsearch	" Search incrementally as letters are added

	set ignorecase	" Ignore case when searching

	set smartcase	" Over ride ignorecase setting when search pattern has upper case characters

"" Matching {{{1

	" Show matching brackets when text indicator is over them
	set showmatch
	" How many tenths of a second to blink when matching brackets
	set mat=2

"" Text {{{1

	"" Text Formatting {{{2

		"" Text Wrapping {{{2

			set wrap " Turn on soft wrap
			set linebreak " Only soft wrap between words
			""let &showbreak='↳ '	" Indicate soft wrapped line with a symbol
			set breakindent	" Take indentation into account when soft wrapping

		"" Tabs and Spaces {{{3

			set tabstop=2	" How many spaces a tab should consist of
			set shiftwidth=2	" How many spaces each step of auto indent should consist of
			set expandtab

		"" Indenting {{{3

			set autoindent

	" Text Editing {{{2

		" Using <C-u> or <C-w> in insert mode undoes the last change, potentially deleting text that can't be recovered with <C-r>. <C-g>u creates a new change before undoing.
		imap <C-u> <C-g>u<C-u>
		imap <C-w> <C-g>u<C-w>

" Keybindings {{{1

	map <Space> <Leader>
  "let mapleader="\<Space>"

	" Move  by visual line
	nmap j gj
	nmap k gk
	nmap 0 g0
	nmap $ g$
	nmap ^ g^

	vmap j gj
	vmap k gk
	vmap 0 g0
	vmap $ g$
	vmap ^ g^

	" Easier window navigation
	"nnoremap <C-h> <C-w>h
	"nnoremap <C-j> <C-w>j
	"nnoremap <C-k> <C-w>k
	"nnoremap <C-l> <C-w>l

	" Make Y yank to end of line instead of yanking the whole line
	map Y y$

	" Map jk as esc in insert mode
	"inoremap jk <esc>
	"tnoremap jk <C-\><C-n>

	"" Opens my .vimrc for editing
	"nnoremap <Leader>v :e ~/.vimrc<CR>

	"" MYVIMRC reloads the saved $MYVIMRC
	"nnoremap <Leader>s :source $MYVIMRC<CR>

	"" Fast saving
	"nnoremap <Leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
	nmap <Leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
	""nnoremap <Leader>w :w!<cr>
 
	" Clear search highlighting easily
	nmap <Leader>h :nohlsearch<CR>

	" Make vim-style editing available in cmd-line
	nmap : q:i
	nmap q: :
	set cmdwinheight=3

	"" Plugin Keybindings {{{2

		" Undotree {{{3

			" Toggle Undotree
			"nnoremap <Leader>u :UndotreeToggle<CR>

"" Plugin settings {{{1

	" airline {{{2

		"" Check if dictionary for symbols exists then define it (required)
		"if !exists('g:airline_symbols')
			"let g:airline_symbols = {}
		"endif

		"" No separators used
		"let g:airline_left_sep=''
		"let g:airline_right_sep=''

		"let g:airline#extensions#tabline#enabled=1	" Display buffer list across top of window
		"let g:airline#extensions#tabline#fnamemod = ':t'	" Only show filename (no path) in tabline
		"let g:airline#extensions#tabline#buffer_idx_mode=1	" Numbers displayed in tabline to allow switching to a buffer directly
		"" Don't check for whitespace errors
		"let g:airline#extensions#whitespace#enabled = 0

		"" set theme
		"let g:airline_theme='dracula'

		"" Mappings to switch to buffers
		"nmap <leader>1 <Plug>AirlineSelectTab1
		"nmap <leader>2 <Plug>AirlineSelectTab2
		"nmap <leader>3 <Plug>AirlineSelectTab3
		"nmap <leader>4 <Plug>AirlineSelectTab4
		"nmap <leader>5 <Plug>AirlineSelectTab5
		"nmap <leader>6 <Plug>AirlineSelectTab6
		"nmap <leader>7 <Plug>AirlineSelectTab7
		"nmap <leader>8 <Plug>AirlineSelectTab8
		"nmap <leader>9 <Plug>AirlineSelectTab9

	"" CtrlP {{{2

		"" Set location for cache files
		""let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp'
		""let g:ctrlp_cache_dir = '~/vimfiles/ctrlp'
		"let g:ctrlp_cmd='CtrlPMRU'	" Open CtrlP to most recently used file list

	"" Undotree {{{2

		"" Tree to the left and diff window below
		"let g:undotree_WindowLayout = 2

		"" Give undotree window focus when opening
		"let g:undotree_SetFocusWhenToggle = 1

		"" Tree node shape
		"let g:undotree_TreeNodeShape = 'o'

else
" Settings {{{1

	set encoding=utf-8

	" Makes bash open in the working directory
	"let $CHERE_INVOKING=1
	"set shellredir=>%s\ 2>&1
	"set shellpipe=2>&1\|\ tee
	"set shellcmdflag=-c
	"set shellquote=
	"set shellxquote=\"
	" set shellxquote='"'
	"set shellslash

	
	" below is to try to get netrw working over scp
	"set nocompatible
	"let g:netrw_list_cmd='ssh HOSTNAME ls -FLa'
	"let g:netrw_silent = 1
	"let g:netrw_cygwin = 1
	"let g:netrw_use_nt_rcp = 0

  " Allows for using same .viminfo file for vim and nvim
  "if !has('nvim')
  "  set viminfo+=n~/.vim/viminfo
  "endif

	" Enable persistent undo
	set undofile

	" Set location of viminfo
  " This will cause problems with nvim
	"set viminfo+=n~/.vim/_viminfo

	" Set location of swap files used for recovery
	set directory=~/.vim/tmp/swap

	" Set location of undo files for persistent undo
	"set undodir=~/.vim/tmp/undo

	" Set location for backup files
	" set backupdir=~/.vim/tmp/backup

	set autochdir	" automatically change working directory to current file's location

	" Disable menu bar, tool bar, and scroll bar
	set guioptions=""

	filetype plugin indent on	" recognize filetype, load associated plugins, and use associated indentation

	set hidden	" Hides buffers instead of closing them

	" Show as much as possible of the last line
	set display+=lastline

	" Control where new splits open
	set splitright
	set splitbelow

	" Configure backspace so it acts as it should act
	set backspace=eol,start,indent

	set whichwrap+=h,l	" Allow h and l to move onto the previous/next line when on first/last character of line

	set scrolloff=999	" Keep current line centered

" For Coc
"
  " Some servers have issues with backup files, see #649.
  set nobackup
  set nowritebackup

  " Give more space for displaying messages.
  set cmdheight=2

  " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  " delays and poor user experience.
  set updatetime=300

  " Don't pass messages to |ins-completion-menu|.
  set shortmess+=c

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("nvim-0.5.0") || has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " Use tab for trigger completion with characters ahead and navigate.
  " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
  " other plugin before putting this into your config.
  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ CheckBackspace() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

  function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  " Use <c-space> to trigger completion.
  "if has('nvim')
  "  inoremap <silent><expr> <c-space> coc#refresh()
  "else
  "  inoremap <silent><expr> <c-@> coc#refresh()
  "endif

  " Make <CR> auto-select the first completion item and notify coc.nvim to
  " format on enter, <cr> could be remapped by other vim plugin
  inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                                \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

  " Use `[g` and `]g` to navigate diagnostics
  " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)

  " GoTo code navigation.
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)

  " Use K to show documentation in preview window.
  nnoremap <silent> K :call ShowDocumentation()<CR>

  function! ShowDocumentation()
    if CocAction('hasProvider', 'hover')
      call CocActionAsync('doHover')
    else
      call feedkeys('K', 'in')
    endif
  endfunction

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  " Symbol renaming.
  nmap <leader>rn <Plug>(coc-rename)

  " Formatting selected code.
  xmap <leader>f  <Plug>(coc-format-selected)
  nmap <leader>f  <Plug>(coc-format-selected)

  augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType javascript,javascriptreact,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder.
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  augroup end

  " Applying codeAction to the selected region.
  " Example: `<leader>aap` for current paragraph
  xmap <leader>a  <Plug>(coc-codeaction-selected)
  nmap <leader>a  <Plug>(coc-codeaction-selected)

  " Remap keys for applying codeAction to the current buffer.
  nmap <leader>ac  <Plug>(coc-codeaction)
  " Apply AutoFix to problem on the current line.
  nmap <leader>qf  <Plug>(coc-fix-current)

  " Run the Code Lens action on the current line.
  nmap <leader>cl  <Plug>(coc-codelens-action)

  " Map function and class text objects
  " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
  xmap if <Plug>(coc-funcobj-i)
  omap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap af <Plug>(coc-funcobj-a)
  xmap ic <Plug>(coc-classobj-i)
  omap ic <Plug>(coc-classobj-i)
  xmap ac <Plug>(coc-classobj-a)
  omap ac <Plug>(coc-classobj-a)

  " Remap <C-f> and <C-b> for scroll float windows/popups.
  if has('nvim-0.4.0') || has('patch-8.2.0750')
    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  endif

  " Use CTRL-S for selections ranges.
  " Requires 'textDocument/selectionRange' support of language server.
  nmap <silent> <C-s> <Plug>(coc-range-select)
  xmap <silent> <C-s> <Plug>(coc-range-select)

  " Add `:Format` command to format current buffer.
  command! -nargs=0 Format :call CocActionAsync('format')

  " Add `:Fold` command to fold current buffer.
  command! -nargs=? Fold :call     CocAction('fold', <f-args>)

  " Add `:OR` command for organize imports of the current buffer.
  command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

  " Add (Neo)Vim's native statusline support.
  " NOTE: Please see `:h coc-status` for integrations with external plugins that
  " provide custom statusline: lightline.vim, vim-airline.
  set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
  " Show commands.
  nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
" Looks {{{1

	"set guifont=Consolas:h11 " Use Source Code Pro with symbols for Powerline at size 12 as font in GUI

	syntax enable	" Enable syntax highlighting

	" Increase spacing between lines for legibility
	set linespace=1
	
	" Change insert mode cursor to line in mintty
	"let &t_ti.="\e[1 q"
	"let &t_SI.="\e[5 q"
	"let &t_EI.="\e[1 q"
	"let &t_te.="\e[0 q"

	"let &t_ti.="\e[?7727h"
	"let &t_te.="\e[?7727l"
	noremap <Esc>O[ <Esc>
	noremap! <Esc>O[ <C-c>

	set notimeout
	set ttimeout

	" Colors {{{{2

		" Change colors for cursor line number
		"highlight! CursorLineNr gui=bold guibg=#073642 guifg=#b58900

	" UI Layout {{{2

		set laststatus=2	" Show the status line in the last window (e.g. when starting Vim)

		set showcmd	" Show entered commands in the last line of the screen

		"set number	" Show current line number
		"set relativenumber	" Show line numbers relative to current line
		set numberwidth=4	" Minimum number of lines to use for line number

		" Remove | in vert split dividers
		set fillchars+=vert:\ 

" Search {{{1

	set hlsearch	" Highlight search results

	set incsearch	" Search incrementally as letters are added

	set ignorecase	" Ignore case when searching

	set smartcase	" Over ride ignorecase setting when search pattern has upper case characters

" Matching {{{1

	" Show matching brackets when text indicator is over them
	set showmatch
	" How many tenths of a second to blink when matching brackets
	set mat=2

" Text {{{1

	" Text Formatting {{{2

		" Text Wrapping {{{2

			set wrap " Turn on soft wrap
			set linebreak " Only soft wrap between words
			"let &showbreak='↳ '	" Indicate soft wrapped line with a symbol
			set breakindent	" Take indentation into account when soft wrapping

			" Function to create two pad buffers on either side of  current buffer to allow for a soft wrap of 80 chars
			function! WrapMargin()
				" Set vertical split divider to same color as background
				highlight! VertSplit guifg=#002b36 guibg=#002b36

				" Open vertical split on right and switch back to buffer
				set splitright
				vnew
				execute "normal \<C-w>\<C-p>"

				" Open vertical split on left
				set nosplitright
				vnew

				" Add 78 blank lines to left pad buffer (full height)
				call append(0, map(range(1,78), '""'))

				" Make buffer as invisible as possible
				setlocal buftype=nofile bufhidden=wipe nomodifiable nobuflisted noswapfile
							\ nonu nornu nocursorline nocursorcolumn winfixwidth winfixheight statusline=\

				" Set proper width
				vertical resize 23

				" Move to previous buffer, then right pad buffer
				execute "normal \<C-w>\<C-p>"
				execute "normal \<C-w>l"

				" Add 78 blank lines to left pad buffer (full height)
				call append(0, map(range(1,78), '""'))

				" Make buffer as invisible as possible
				setlocal buftype=nofile bufhidden=wipe nomodifiable nobuflisted noswapfile
							\ nonu nornu nocursorline nocursorcolumn winfixwidth winfixheight statusline=\
				vertical resize 23

				" Move to previous buffer
				execute "normal \<C-w>\<C-p>"
			endfunction

			" Undoes WrapMargin() by closing the pad buffers on either side
			function! UnWrapMargin()
				" Delete right buffer
				execute "normal \<C-w>l"
				bd

				" Deleter left buffer
				execute "normal \<C-w>h"
				bd
			endfunction

			" Shortcuts for setting soft wrap
			"nnoremap <Leader>m :call WrapMargin()<CR>
			"nnoremap <Leader>f :call UnWrapMargin()<CR>

		" Tabs and Spaces {{{3

			set tabstop=2	" How many spaces a tab should consist of
			set shiftwidth=2	" How many spaces each step of auto indent should consist of
			set expandtab

		" Indenting {{{3

			set autoindent

	" Text Editing {{{2

		" Using <C-u> or <C-w> in insert mode undoes the last change, potentially deleting text that can't be recovered with <C-r>. <C-g>u creates a new change before undoing.
		inoremap <C-u> <C-g>u<C-u>
		inoremap <C-w> <C-g>u<C-w>

" Keybindings {{{1

	map <Space> <Leader>

	" Move  by visual line
	nnoremap j gj
	nnoremap k gk
	nnoremap 0 g0
	nnoremap $ g$
	nnoremap ^ g^

	vnoremap j gj
	vnoremap k gk
	vnoremap 0 g0
	vnoremap $ g$
	vnoremap ^ g^

	" Easier window navigation
	nnoremap <C-h> <C-w>h
	nnoremap <C-j> <C-w>j
	nnoremap <C-k> <C-w>k
	nnoremap <C-l> <C-w>l

	" Make Y yank to end of line instead of yanking the whole line
	map Y y$

	" Map jk as esc in insert mode
	inoremap jk <esc>
	tnoremap jk <C-\><C-n>

	" Opens my .vimrc for editing
	nnoremap <Leader>v :e ~/.vimrc<CR>

	" MYVIMRC reloads the saved $MYVIMRC
	nnoremap <Leader>s :source $MYVIMRC<CR>

	" Fast saving
	nnoremap <Leader>w :w!<cr>

	" Clear search highlighting easily
	nnoremap <Leader>h :nohlsearch<CR>

	" Make vim-style editing available in cmd-line
	nnoremap : q:i
	nnoremap q: :
	set cmdwinheight=3

	" Plugin Keybindings {{{2

		" Undotree {{{3

			" Toggle Undotree
			nnoremap <Leader>u :UndotreeToggle<CR>

" Plugin settings {{{1

	" airline {{{2

		" Check if dictionary for symbols exists then define it (required)
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif

		" No separators used
		let g:airline_left_sep=''
		let g:airline_right_sep=''

		let g:airline#extensions#tabline#enabled=1	" Display buffer list across top of window
		let g:airline#extensions#tabline#fnamemod = ':t'	" Only show filename (no path) in tabline
		let g:airline#extensions#tabline#buffer_idx_mode=1	" Numbers displayed in tabline to allow switching to a buffer directly
		" Don't check for whitespace errors
		let g:airline#extensions#whitespace#enabled = 0

		" set theme
		let g:airline_theme='dracula'

		" Mappings to switch to buffers
		nmap <leader>1 <Plug>AirlineSelectTab1
		nmap <leader>2 <Plug>AirlineSelectTab2
		nmap <leader>3 <Plug>AirlineSelectTab3
		nmap <leader>4 <Plug>AirlineSelectTab4
		nmap <leader>5 <Plug>AirlineSelectTab5
		nmap <leader>6 <Plug>AirlineSelectTab6
		nmap <leader>7 <Plug>AirlineSelectTab7
		nmap <leader>8 <Plug>AirlineSelectTab8
		nmap <leader>9 <Plug>AirlineSelectTab9

	" CtrlP {{{2

		" Set location for cache files
		"let g:ctrlp_cache_dir = $HOME.'/vimfiles/ctrlp'
		"let g:ctrlp_cache_dir = '~/vimfiles/ctrlp'
		let g:ctrlp_cmd='CtrlPMRU'	" Open CtrlP to most recently used file list

	" gitgutter {{{2

		" Sign column always present
		"set signcolumn=yes
		"GitGutterDisable

		"highlight clear SignColumn " Sign Column color set by solarized is ugly, clear it

		" Set GitGutter background color manually
		"highlight! SignColumn guibg=#073642
		"highlight! GitGutterAddDefault guibg=#073642
		"highlight! GitGutterChangeDefault guibg=#073642
		"highlight! GitGutterDeleteDefault guibg=#073642
		"highlight! GitGutterAddInvisible guibg=#073642
		"highlight! GitGutterChangeInvisible guibg=#073642
		"highlight! GitGutterDeleteInvisible guibg=#073642
		"call gitgutter#highlight#define_highlights()	" Reload gitgutter Sign Column Colors

	" nvim-r {{{2
	
		let g:R_hl_term = 1
	    let R_OutDec = ','
		let g:rout_follow_colorscheme = 1
		let g:Rout_more_colors = 1
		let g:R_assign = 3
		let r_syntax_folding = 1
		"let R_commented_lines = 1

		"nmap <LocalLeader>; :RSend 
		"nmap <LocalLeader>: :RSend 
		"nmap <LocalLeader> :RSend 

		" Setup Vim to use the remote R only if the output of df includes
		" the string 'remoteR', that is, the remote file system is mounted:
		"if system('df') =~ 'remoteR'
			"let $NVIM_IP_ADDRESS = substitute(system("hostname -I"), " .*", "", "")
			"let R_app = '/home/locallogin/bin/sshR'
			"let R_cmd = '/home/locallogin/bin/sshR'
			"let R_compldir = '/home/locallogin/.remoteR/NvimR_cache'
			"let R_tmpdir = '/home/locallogin/.remoteR/NvimR_cache/tmp'
			"let R_remote_tmpdir = '/home/remotelogin/.cache/NvimR_cache/tmp'
			"let R_nvimcom_home = '/home/locallogin/.remoteR/R_library/nvimcom'
		"endif

	" Rainbow Parentheses {{{2

		" Make braces rainbow
		let g:rainbow#pairs = [['{','}']]

		" Activate when entering tex file type
		augroup rainbow_lisp
			autocmd!
			autocmd FileType tex RainbowParentheses
		augroup END

	" thesaurus_query {{{2

		" Shortcut for thesaurus 	
		"nnoremap <Leader>t :ThesaurusQueryReplaceCurrentWord<CR>

		" Shortcut for visual mode thesaurus
		"vnoremap <Leader>t y:ThesaurusQueryReplace <C-r>"<CR>
		
		" Set location of OpenOffice thesaurus
		"let g:tq_openoffice_en_file="~\Downloads\thesaurus\th_en_US_new"

		" Set location for gutenberg thesaurus
		"let g:tq_mthesaur_file="~\Downloads\thesaurus\mthesaur.txt"
	" VOoM {{{2

		" Open Voom for latex and resize correctly
		function! WrapVoom()
			highlight! VertSplit guifg=#002b36 guibg=#002b36
			Voom latex
			execute "normal \<C-w>\<C-p>\<C-w>H"
			vertical resize 86
		endfunction

		" Close Voom
		function! CloseVoom()
			execute "normal \<C-w>l"
			bd
		endfunction

		" Shortcut for opening Voom
		"nnoremap <Leader>o :call WrapVoom()<CR>

		" Shortcut for closing Voom
		"nnoremap <Leader>c :call CloseVoom()<CR>

	" Undotree {{{2

		" Tree to the left and diff window below
		let g:undotree_WindowLayout = 2

		" Give undotree window focus when opening
		let g:undotree_SetFocusWhenToggle = 1

		" Tree node shape
		let g:undotree_TreeNodeShape = 'o'

endif
" vim: foldmethod=marker:tw=0:
