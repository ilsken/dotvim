let g:dotvim_settings = {}
if has('gui_running')
  let g:dotvim_settings.colorscheme = 'luna'
else 
  let g:dotvim_settings.colorscheme = 'luna-term'
endif
let g:dotvim_settings.autocomplete_method = 'ycm'
let g:dotvim_settings.plugin_groups_include = ['web', 'javascript']
let g:dotvim_settings.disabled_plugins=['NERDTree']
let g:dotvim_settings.version = 1


source ~/.vim/vimrc
set nolazyredraw

"
" Node JS
"
set wildignore+=\*/node_modules/\*

"===============================================================================
" Hotkeys
"===============================================================================

" Tagbar
noremap <silent> <Leader>t :TagbarToggle<CR>

" Quick Fix Bar
nnoremap <silent> <Leader>f :botright copen<CR>

" NerdTree
nnoremap <silent> <Leader>e :Explore<CR>

" <Leader>q Close Buffer
nnoremap <silent> <Leader>q :call CloseWindowOrKillBuffer()<cr>

" Clear Highlights on Enter
nnoremap <CR> :nohlsearch<CR>/<BS>

" OSX Movement Hotkeys (With Smart Home/End)
let macvim_skip_cmd_opt_movement = 1

map  <D-Left>       <Home>
map! <D-Left>       <Home>
no   <M-Left>       <C-Left>
no!  <M-Left>       <C-Left>

map  <D-Right>      <End>
map! <D-Right>      <End>
no   <M-Right>      <C-Right>
no!  <M-Right>      <C-Right>

map  <D-Up>         <C-Home>
imap <D-Up>         <C-Home>
no   <M-Up>         {
ino  <M-Up>         <C-o>{

no  <D-Down>       <C-End>
ino <D-Down>       <C-End>
no  <M-Down>       }
ino <M-Down>       <C-o>}

ino   <M-BS>         <C-w>
ino   <D-BS>         <C-u>

" Selection Hotkeys (Smart Home/End)
nmap <S-D-Left>     v<Home>
vmap <S-D-Left>     <Home>
imap <S-D-Left>     <C-\><C-n>gh<Home>

nn   <S-M-Left>     v<C-Left>
vn   <S-M-Left>     <C-Left>
ino  <S-M-Left>     <C-\><C-n>gh<C-Left>

nmap  <S-D-Right>    v<End>
vmap  <S-D-Right>    <End>
imap  <S-D-Right>    <C-\><C-n>gh<End>

nn   <S-M-Right>    v<C-Right>
vn   <S-M-Right>    <C-Right>
ino  <S-M-Right>    <C-\><C-n>gh<C-Right>

nn   <S-D-Up>       v<C-Home>
vn   <S-D-Up>       <C-Home>
ino  <S-D-Up>       <C-\><C-n>gh<C-Home>

nn   <S-M-Up>       v{
vn   <S-M-Up>       {
ino  <S-M-Up>       <C-\><C-n>gh{

nn   <S-D-Down>     v<S-C-End>
vn   <S-D-Down>     <S-C-End>
ino  <S-D-Down>     <C-\><C-n>gh<S-C-End>

nn   <S-M-Down>       v}
vn   <S-M-Down>       }
ino  <S-M-Down>       <C-\><C-n>gh}



"===============================================================================
" NERDTree
"===============================================================================

let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1

"===============================================================================
" NERDCommenter
"===============================================================================

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1

NeoBundle 'jtratner/vim-flavored-markdown'
NeoBundle 'joonty/vdebug.git'
NeoBundle 'troydm/shellasync.vim'
NeoBundle 'heavenshell/vim-jsdoc'

" javascript tab spaces/autocomplete
" Close after lookup
let g:ycm_autoclose_preview_window_after_completion = 1
" Enable tab for selection

" Disable ugly scroll  bars
set guioptions-=L
set guioptions-=r

" Node hotkeys
autocmd User Node 
 \ if &filetype == "javascript" | 
 \ setlocal expandtab | 
 \ setlocal tabstop=2 |
 \ setlocal shiftwidth=2 |
 \ noremap <buffer> <Leader>re :TernRename<CR> |
 \ noremap <buffer> <Leader><Leader>t :TernType<CR> |
 \ noremap <buffer> <Leader>td :TernDoc<CR> |
 \ noremap <buffer> <Leader>tf :TernRefs<CR> |
 \ endif



function! GetMarkbookTopic()
  let start = "School Notes/"
  let path = expand("%:p")
  return substitute(strpart(path, strridx(path, start)+strlen(start))," ", "-", "g" )
endfunction

function! OpenMarkbook() 
  let url = "http://localhost:3000/".GetMarkbookTopic()
  silent exec "! open ".shellescape(url)
endfunction

command! MarkbookOpen call OpenMarkbook()
map <Leader>mb :call OpenMarkbook()<CR>
