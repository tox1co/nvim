" Tecla lider
let mapleader=" "

" dir plugins
call plug#begin('~/.config/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree' " nav
Plug 'airblade/vim-gitgutter' " git changes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'morhetz/gruvbox'
Plug 'lilydjwg/colorizer'
Plug 'HerringtonDarkholme/yats.vim'
call plug#end()

inoremap jk <ESC> 
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle

"vim-airline config 
let g:airline_theme = 'deus'
let g:airline#entensions#tabline#left_sep = ' '
let g:airline#entensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_powerline_fonts = 1

" NerdTree
let g:NERDTreeIgnore = ['^node_modules$']

" comando mas bonito para coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k moverá líneas virtuales (líneas que se envuelven)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set number relativenumber
set smarttab
set cindent
set tabstop=2
set clipboard=unnamed
set encoding=utf-8
set mouse=a
set shiftwidth=2
set noshowmode
set sw=2
set expandtab
set encoding=UTF-8

colorscheme gruvbox
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]
" si no se establece oculto, TextEdit puede fallar.
set hidden " Algunos servidores tienen problemas con los archivos de respaldo, consulte # 649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " Tendrá una mala experiencia con los mensajes de diagnóstico cuando el valor predeterminado es 4000.
set updatetime=300
set shortmess+=c
set signcolumn=yes

  "Use el comando ': verbose imap <tab>' para asegurarse de que la pestaña no esté asignada por otro complemento.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Utilice <c-space> para activar la finalización.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> para confirmar la finalización,` <C-g> u` significa romper la cadena de deshacer en la posición actual.
  "Coc solo hace un fragmento y una edición adicional al confirmar.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" O use` complete_info` si su vim lo admite, como:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Utilice` [g` y `] g` para navegar por los diagnósticos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Reasignar claves para gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>+ <Plug>(coc-rpc.enable)

" Utilice K para mostrar la documentación en la ventana de vista previa
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Resalte el símbolo debajo del cursor en CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Reasignar para cambiar el nombre de la palabra actual
nmap <F2> <Plug>(coc-rename)
let g:NERDTreeDirArrowExpandable = '>'
let g:NERDTreeDirArrowCollapsible = '⌄'
let NERDTreeQuitOnOpen=1
" teclas custom 

" Salir
nmap <leader>0 :q!<cr>
" Guardar y salir
nmap <leader>9 :wq<cr>
" Guardar
nmap <leader>1 :w<cr>
" nerdtree
nmap <leader>n :NERDTreeToggle<cr>
" Ir a la deficion
nmap <leader>2 gd
" ir al archivo de definicor
nmap <leader>3 gf
" ir atras 
nmap <leader>7 <C-o>
" ir adelante
nmap <leader>8 <C-i>
" eliminar linea
nmap <leader>6 d$
"change word
nmap <leader>4 ciw
" siguiente buffer
nmap <leader>5 :bnext<cr>
nmap <leader>d :bd<cr> 
nmap <leader>v :e $MYVIMRC<cr>
  
" formatear selecionada
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Configure los tipos de archivo especificados en formatexpr.
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  "Actualizar la ayuda de la firma en el marcador de posición de salto
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Reasignar para hacer codeAction de la región seleccionada, por ejemplo:` <leader> aap` para el párrafo actual
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Reasignar para hacer codeAction de la línea actual
nmap <leader>ac  <Plug>(coc-codeaction)
" Soluciona el problema de reparación automática de la línea actual
nmap <leader>qf  <Plug>(coc-fix-current)

" Crear asignaciones para el objeto de texto de función, requiere la característica de símbolos de documento de languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> para seleccionar rangos de selección, necesita soporte de servidor, como: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use`: Format` para formatear el búfer actual
command! -nargs=0 Format :call CocAction('format')

" Use`: Fold` para doblar el búfer actual
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use`: OR` para organizar la importación del búfer actual
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

"Agregue soporte de línea de estado, para integración con otro complemento, che ckout`: h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

 "Usando CocList
  "Mostrar todos los diagnósticos
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Administrar extensiones
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"Mostrar comandos
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Buscar símbolo del documento actual
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Buscar símbolos del espacio de trabajo
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Realizar la acción predeterminada para el siguiente elemento
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Realizar la acción predeterminada para el elemento anterior.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Reanudar la última lista de coc
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" BACKUP
set writebackup
set backupdir=.,~/.local/share/nvim/backup
set dir=.,~/.local/share/nvim/swaps
