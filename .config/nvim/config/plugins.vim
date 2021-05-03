" Fzf + Telescope {{{

let g:fzf_history_dir = '~/.config/nvim/fzf-history'
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.4, 'yoffset': 1, 'border': 'none' } }

" Maps
nnoremap <silent> <C-p> :Files<cr>
nnoremap <silent> <leader><leader> :Files<cr>
nnoremap <silent> <leader>. :exec 'Files ' . getcwd() . '/' . expand('%:h')<cr>
" nnoremap <silent> <leader>sb :lua require('baldore.telescope').buffer_lines()<cr>
nnoremap <silent> <leader>sb :BLines<cr>
nnoremap <silent> <leader>sc :History:<cr>
nnoremap <silent> <leader>ss :Telescope ultisnips<cr>
nnoremap <silent> <leader>bb :Buffers<cr>
nnoremap <silent> <leader>fr :History<cr>
" nnoremap <silent> <leader>t :BTags<cr>
nnoremap <silent> <leader>rg :Rg!<cr>
nnoremap <silent> <leader>* :Rg <C-R><C-W><cr>
vnoremap <silent> <leader>* y:Rg <C-r>0<cr>
cnoremap <C-e> <C-c>:Commands<cr>

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-l> <plug>(fzf-complete-line)

" }}}

" Git {{{
let g:gitgutter_sign_added = '▌'
let g:gitgutter_sign_modified = '▌'
let g:gitgutter_sign_removed = '▁'
let g:gitgutter_sign_removed_first_line = '▌'
let g:gitgutter_sign_modified_removed = '▌'
let g:gitgutter_realtime = 1
highlight GitGutterDelete guifg=#F97CA9
highlight GitGutterAdd    guifg=#BEE275
highlight GitGutterChange guifg=#96E1EF

let g:gitgutter_map_keys = 0

nnoremap ]g :GitGutterNextHunk<cr>
nnoremap [g :GitGutterPrevHunk<cr>

nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPreviewHunk)

" }}}

" Emmet {{{
let g:user_emmet_settings = {
      \  'javascript' : {
      \      'extends' : 'jsx',
      \  },
      \}
let g:user_emmet_expandabbr_key = '<C-y><Space>'
" }}}

" Tmux nav {{{
let g:tmux_navigator_save_on_switch = 1
" }}}

" IndentLine {{{
let g:indentLine_concealcursor = 'ic'
let g:indentLine_conceallevel = 2
" }}}

" Fugitive {{{
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gb :Gblame<cr>
" }}}

" incsearch {{{
let g:asterisk#keeppos = 1
" }}}

" MatchTagAlways {{{
let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xhtml' : 1,
      \ 'xml' : 1,
      \ 'jinja' : 1,
      \ 'javascript' : 1,
      \}
" }}}

" Tagalong {{{
let g:tagalong_additional_filetypes = ['javascript']
" }}}

" Test {{{
let test#strategy = "neovim"
" }}}

" Yank Highlight {{{
let g:highlightedyank_highlight_duration = 400
"}}}

" Vim Asterisk {{{
map *  <Plug>(asterisk-z*)
"}}}

" vim-sandwich {{{
runtime macros/sandwich/keymap/surround.vim
" }}}


" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsSnippetDirectories=["own_snippets"]

nnoremap <space>ee :UltiSnipsEdit<cr>
" }}}

" ALE {{{
let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_javascript_eslint_use_global = 1
let g:ale_linters = {
      \   'javascript': ['eslint'],
      \   'javascriptreact': ['eslint'],
      \   'typescript': ['eslint'],
      \   'typescriptreact': ['eslint'],
      \   'go': ['golangci-lint'],
      \}
let g:ale_fixers = {
      \   'vue': ['eslint'],
      \   'javascript': ['eslint'],
      \   'javascriptreact': ['eslint'],
      \   'typescript': ['eslint'],
      \   'typescriptreact': ['eslint'],
      \   'python': ['black'],
      \   'go': ['goimports'],
      \   'dart': ['dartfmt'],
      \   'rust': ['rustfmt'],
      \}
let g:ale_fix_on_save = 1
let g:ale_hover_to_preview = 1
let g:ale_set_loclist = 0

" Custom Highlights
hi ALEError gui=underline

nnoremap ]a :ALENext<cr>
nnoremap [a :ALEPrevious<cr>

" }}}

" Lightline {{{
let g:lightline = {
      \  'colorscheme': 'dracula',
      \  'active': {
      \    'left':  [ [ 'mode', 'paste' ], [ 'readonly', 'filenameOrLastFolderOfIndex', 'modified' ] ],
      \    'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ] ]
      \  },
      \  'component_function': {
      \    'gitbranch': 'fugitive#head',
      \    'filenameOrLastFolderOfIndex': 'LightLineFixIndexFiles',
      \  },
      \  'tab_component_function': {
      \    'cwdtail': 'GetCWDTail'
      \  },
      \  'mode_map': {
      \    'n' : 'N',
      \    'i' : 'I',
      \    'R' : 'R',
      \    'v' : 'V',
      \    'V' : 'VL',
      \    "\<C-v>": 'VB',
      \    'c' : 'C',
      \    's' : 'S',
      \    'S' : 'S',
      \    "\<C-s>": 'SB',
      \    't': 'T',
      \  },
      \  'tab': {
      \     'active': [ 'cwdtail', 'modified' ],
      \     'inactive': [ 'cwdtail', 'modified' ]
      \   }
      \ }

function! GetCWDTail(n) abort
  return fnamemodify(getcwd(tabpagewinnr(a:n), a:n), ':t')
endfunction

function! LightLineFixIndexFiles()
  let filenameonly = split(expand('%:t:r'), '\.')

  if !len(filenameonly)
    return ''
  endif

  if filenameonly[0] ==? 'index'
    return remove(split(expand('%:h'), '/'), -1) . '/' . expand('%:t')
  else
    return expand('%:t')
  endif
endfunction
" }}}

" FIXME: Disabled until bug changing other working directories is fixed...
" for now use <C-z> and run what you need. Go back with fg
" Floaterm {{{
" let g:floaterm_autoclose = 1
" let g:floaterm_width = 0.95
" let g:floaterm_height = 0.95

" nnoremap <leader>gl :<C-u>FloatermNew lazygit<cr>

" command Conf FloatermNew lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME
" }}}

" Markdown Preview {{{
let g:mkdp_auto_close = 0
" }}}

" Illuminate {{{
highlight LspIlluminate gui=underline

hi def link LspReferenceText LspIlluminate
hi def link LspReferenceWrite LspIlluminate
hi def link LspReferenceRead LspIlluminate

nnoremap [d <cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>
nnoremap ]d <cmd>lua require"illuminate".next_reference{jrap=true}<cr>
" }}}

" Tmux navigator {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" }}}

" Vim Sneak {{{
let g:sneak#label = 0
let g:sneak#s_next = 1

map f <Plug>Sneak_f
map F <Plug>Sneak_F
map t <Plug>Sneak_t
map T <Plug>Sneak_T

nnoremap <silent> <c-j> :<C-U>call sneak#wrap('', 2, 0, 2, 2)<CR>
xnoremap <silent> <c-j> :<C-U>call sneak#wrap(visualmode(), 2, 0, 2, 2)<CR>
onoremap <silent> <c-j> :<C-U>call sneak#wrap(v:operator, 2, 0, 2, 2)<CR>

" }}}

" Explainshell {{{
" ❯ docker container run --name explainshell --restart always -p 5000:5000 -d spaceinvaderone/explainshell
let $EXPLAINSHELL_ENDPOINT = "http://localhost:5000"
" }}}

