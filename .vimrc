" Plugins {{{1
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()	" initialize vim-plug

		Plug 'bling/vim-airline', Cond(!exists('g:vscode'))
		Plug 'vim-airline/vim-airline-themes', Cond(!exists('g:vscode'))
    Plug 'sainnhe/gruvbox-material'
    Plug 'junegunn/rainbow_parentheses.vim', Cond(!exists('g:vscode'))
		Plug 'tpope/vim-fugitive', Cond(!exists('g:vscode'))
		Plug 'scrooloose/nerdcommenter', Cond(!exists('g:vscode'))
		Plug 'tpope/vim-surround'
		Plug 'mbbill/undotree', Cond(!exists('g:vscode'))

    Plug 'neoclide/coc.nvim', Cond(!exists('g:vscode'), {'branch': 'release'})
    let g:coc_global_extensions = ['coc-css', 'coc-eslint', 'coc-html', 'coc-json', 'coc-markdownlint', 'coc-prettier', 'coc-tsserver', 'coc-styled-components']

    " Required for telescope
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'

    Plug 'pangloss/vim-javascript'
    " Or
    " Plug 'yuezk/vim-js'
    Plug 'maxmellon/vim-jsx-pretty'
    " Or
    " Plug 'neoclide/vim-jsx-improve' 
    Plug 'styled-components/vim-styled-components'
    
    Plug 'ggandor/leap.nvim'

    " Testing
    "Plug 'vim-test/vim-test'
    "Plug 'rcarriga/vim-ultest'
    "Plug 'David-Kunz/jester'

    " Terminal/code runners
    Plug 'kassio/neoterm'
    "Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
    "Plug 'akinsho/toggleterm.nvim', tag = 'v1.*'
    
    Plug 'ThePrimeagen/harpoon'
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'folke/which-key.nvim'

    Plug 'mfussenegger/nvim-dap'

    "Testing
    "Plug 'nvim-neotest/neotest'
    "Plug 'vim-test/vim-test'

    " Documentation
    " howdoi requires python
    "Plug Zane-/howdoi.nvim
    "Plug laurentgoudet/vim-howdoi
    "Plug 'vmchale/howdoi-vim' , {'do' : './install.sh' }
    " Cheatsheets
    "Plug 'dbeniamine/cheat.sh-vim'
    "Plug 'Djancyp/cheat-sheet'
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-cheat.sh'

    " Smooth scrolling
    "Plug 'declancm/cinnamon.nvim'
    "Plug 'psliwka/vim-smoothie'
    Plug 'karb94/neoscroll.nvim'


call plug#end()

" Settings {{{1

  "set autochdir	" automatically change working directory to current file's location

  " Show as much as possible of the last line
  set display+=lastline

	" Control where new splits open
	"set splitright
	set splitbelow

	set whichwrap+=h,l	" Allow h and l to move onto the previous/next line when on first/last character of line

	set scrolloff=999	" Keep current line centered

	" Increase spacing between lines for legibility
	set linespace=1
	
  set timeoutlen=1000
	"set notimeout
	"set ttimeout

  set laststatus=2	" Show the status line in the last window (e.g. when starting Vim)

  set showcmd	" Show entered commands in the last line of the screen

  set number	" Show current line number
  "set relativenumber	" Show line numbers relative to current line
  set numberwidth=3	" Minimum number of lines to use for line number

  " Remove | in vert split dividers
  set fillchars+=vert:\ 

	set ignorecase	" Ignore case when searching
	set smartcase	" Over ride ignorecase setting when search pattern has upper case characters

	" Show matching brackets when text indicator is over them
	set showmatch
	" How many tenths of a second to blink when matching brackets
	set mat=2

  set wrap " Turn on soft wrap
  set linebreak " Only soft wrap between words
  "let &showbreak='↳ '	" Indicate soft wrapped line with a symbol
  set breakindent	" Take indentation into account when soft wrapping

  set tabstop=2	" How many spaces a tab should consist of
  set shiftwidth=2	" How many spaces each step of auto indent should consist of
  set expandtab

  set undofile " Required for persistent undo
  "set clipboard=unnamedplus " Copy and paste to system clipboard
  
  " Autosave
  "autocmd TextChanged,FocusLost,BufEnter * silent update
  "
  "augroup AutoSave
  "  autocmd CursorHoldI,FocusLost,TextChanged <buffer>
  "    \ if &readonly == 0 && filereadable(bufname('%')) | silent! update | endif
  "augroup END
  "
  "autocmd TextChanged,TextChangedI <buffer> silent update
  " Might be necessary for Coc?
  autocmd InsertLeave,TextChanged * if &readonly == 0 && filereadable(bufname('%'))
                                 \ | silent update | endif
  " prevent broken syntax in js
  " might also need to change redraw time?
  autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear


  " Using <C-u> or <C-w> in insert mode undoes the last change, potentially deleting text that can't be recovered with <C-r>. <C-g>u creates a new change before undoing.
  imap <C-u> <C-g>u<C-u>
  imap <C-w> <C-g>u<C-w>

" General keybindings {{{1

	map <Space> <Leader>
  "let mapleader="\<Space>"

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

  " Make Y yank to end of line instead of yanking the whole line
  nnoremap Y y$

  " Using <C-u> or <C-w> in insert mode undoes the last change, potentially deleting text that can't be recovered with <C-r>. <C-g>u creates a new change before undoing.
  inoremap <C-u> <C-g>u<C-u>
  inoremap <C-w> <C-g>u<C-w>

	" Make vim-style editing available in cmd-line
	nnoremap : q:i
	nnoremap q: :
	set cmdwinheight=3

	" Map jk as esc in insert mode
	inoremap jk <esc>
	tnoremap jk <C-\><C-n>

  " Terminal go back to normal mode
  tnoremap :q! <C-\><C-n>:q!<CR>

	" Clear search highlighting easily
	nmap <Leader>h :nohlsearch<CR>

if !exists('g:vscode')

" Non VS Code Keybindings {{{1

" Easier window navigation
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l

	" Fast saving
	"nnoremap <Leader>w :w!<cr>

	" Opens my .vimrc for editing
	nnoremap <Leader>ve :e ~/.vimrc<CR>

	" MYVIMRC reloads the saved $MYVIMRC
	nnoremap <Leader>vs :source $MYVIMRC<CR>
  
" Plugins {{{1

  " Colorscheme {{{2
  " Important!!
  if has('termguicolors')
    set termguicolors
  endif
  " For dark version.
  set background=dark

  " Set contrast
  " This configuration option should be placed before `colorscheme gruvbox-material`.
  " Available values: 'hard', 'medium'(default), 'soft'
  let g:gruvbox_material_background = 'soft'
  " For better performance
  let g:gruvbox_material_better_performance = 1
  colorscheme gruvbox-material

  " Coc {{{2

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

  "set signcolumn=number

  " Cursor kept disappearing when opening diagnostics list
  let g:coc_disable_transparent_cursor = 1

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
  "set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

  " Mappings for CoCList
  " Show all diagnostics.
  "nnoremap <silent><nowait> <leader>a  :<C-u>CocList diagnostics<cr>
  " Manage extensions.
  "nnoremap <silent><nowait> <leader>e  :<C-u>CocList extensions<cr>
  " Show commands.
  "nnoremap <silent><nowait> <leader>c  :<C-u>CocList commands<cr>
  " Find symbol of current document.
  "nnoremap <silent><nowait> <leader>o  :<C-u>CocList outline<cr>
  " Search workspace symbols.
  "nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
  " Do default action for next item.
  "nnoremap <silent><nowait> <leader>j  :<C-u>CocNext<CR>
  " Do default action for previous item.
  "nnoremap <silent><nowait> <leader>k  :<C-u>CocPrev<CR>
  " Resume latest coc list.
  "nnoremap <silent><nowait> <leader>p  :<C-u>CocListResume<CR>

  " Telescope {{{2
  " Find files using Telescope command-line sugar.
  nnoremap <leader>ff <cmd>Telescope find_files<cr>
  nnoremap <leader>fp <cmd>Telescope git_files<cr>
  nnoremap <leader>fg <cmd>Telescope live_grep<cr>
  nnoremap <leader>fb <cmd>Telescope buffers<cr>
  nnoremap <leader>fh <cmd>Telescope help_tags<cr>
  nnoremap <leader>fo <cmd>Telescope oldfiles<cr>

  nnoremap <C-n> :NvimTreeToggle<CR>
  "nnoremap <leader>r :NvimTreeRefresh<CR>
  "nnoremap <leader>n :NvimTreeFindFile<CR>

  " Harpoon {{{2
  nnoremap <silent><leader>m :lua require("harpoon.mark").add_file()<CR>
  nnoremap <silent><leader>d :lua require("harpoon.ui").toggle_quick_menu()<CR>
  " nnoremap <silent><leader>tc :lua require("harpoon.cmd-ui").toggle_quick_menu()<CR>

  nnoremap <silent><leader>1 :lua require("harpoon.ui").nav_file(1)<CR>
  nnoremap <silent><leader>2 :lua require("harpoon.ui").nav_file(2)<CR>
  nnoremap <silent><leader>3 :lua require("harpoon.ui").nav_file(3)<CR>
  nnoremap <silent><leader>4 :lua require("harpoon.ui").nav_file(4)<CR>

  "Neoterm {{{2
  nnoremap <leader>t :Ttoggle resize=24<CR>
  nnoremap <leader>T :Ttoggle resize=36<CR>
  "tnoremap <leader>t <C-\><C-n>:Ttoggle<CR>
  
  let g:neoterm_default_mod="botright"
  let g:neoterm_autoscroll=1
  let g:neoterm_autoinsert=1

  " send file
  nnoremap <leader>sf :TREPLSendFile<CR>
  " send selection
  vnoremap <leader>ss :TREPLSendSelection<CR>
  " send line
  nnoremap <leader>ss :TREPLSendLine<CR>
  "nmap <leader>ss <Plug>SnipRun
  "nmap <leader>sr <Plug>SnipReset
  "nmap <leader>sc <Plug>SnipClose
  "nmap <leader>sn <Plug>SnipReplMemoryClean
  "nmap <leader>f <Plug>SnipRunOperator
  "For interpreted languages with simple output, :%SnipRun (or a shortcut, wrapping it with let b:caret=winsaveview() and call winrestview(b:caret) in order to keep the cursor at the current position) may be a more convenient way to run your entire file. When running the whole file, SnipRun supports taking arguments on the command line: :%SnipRun 5 "yay" frictionlessly for interpreted languages, and compiled languages with entry point detection implemented (most of them).
  "nmap <leader>sf :%SnipRun<CR>
  "vmap <leader>ss <Plug>SnipRun
  
  " Undotree {{{2

  " Toggle Undotree
  nnoremap <Leader>u :UndotreeToggle<CR>

  " Tree to the left and diff window below
  let g:undotree_WindowLayout = 2

  " Give undotree window focus when opening
  let g:undotree_SetFocusWhenToggle = 1

  " Tree node shape
  let g:undotree_TreeNodeShape = 'o'

	" airline {{{2

		" Check if dictionary for symbols exists then define it (required)
		if !exists('g:airline_symbols')
			let g:airline_symbols = {}
		endif

		" No separators used
		let g:airline_left_sep=''
		let g:airline_right_sep=''

		"let g:airline#extensions#tabline#enabled=1	" Display buffer list across top of window
		"let g:airline#extensions#tabline#fnamemod = ':t'	" Only show filename (no path) in tabline
		"let g:airline#extensions#tabline#buffer_idx_mode=1	" Numbers displayed in tabline to allow switching to a buffer directly
		" Don't check for whitespace errors
		let g:airline#extensions#whitespace#enabled = 0

		" set theme
		let g:airline_theme='gruvbox_material'

		" Mappings to switch to buffers
		"nmap <leader>1 <Plug>AirlineSelectTab1
		"nmap <leader>2 <Plug>AirlineSelectTab2
		"nmap <leader>3 <Plug>AirlineSelectTab3
		"nmap <leader>4 <Plug>AirlineSelectTab4
		"nmap <leader>5 <Plug>AirlineSelectTab5
		"nmap <leader>6 <Plug>AirlineSelectTab6
		"nmap <leader>7 <Plug>AirlineSelectTab7
		"nmap <leader>8 <Plug>AirlineSelectTab8
		"nmap <leader>9 <Plug>AirlineSelectTab9

	" Rainbow Parentheses {{{2

		" Make braces rainbow
		let g:rainbow#pairs = [['{','}']]

		" Activate when entering tex file type
		augroup rainbow_lisp
			autocmd!
			autocmd FileType tex RainbowParentheses
		augroup END


endif
if exists('g:vscode')
  " VS Code configuration {{{1
  nmap <Leader>w <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
endif
" vim: foldmethod=marker:tw=0:
