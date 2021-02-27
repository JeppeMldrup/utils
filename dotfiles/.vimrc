let mapleader=','

set t_Co=256

set number
set relativenumber

set expandtab
set tabstop=2
set shiftwidth=4

set ai
set si

syntax on

set so=7
set wildmenu
set ruler

set noerrorbells
set novisualbell

"""Netrw setup
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

"""Statusline

set laststatus=2

hi statusStart ctermfg=Black ctermbg=LightBlue
hi statusMiddle ctermfg=Black ctermbg=Blue
hi statusEnd ctermfg=White ctermbg=DarkGrey

set stl=%(%#statusStart#\ %m\ %y\ %r\ %)
set stl+=%(%#statusMiddle#\ %F\ %)
set stl+=%(%#statusEnd#\ %{GetMode()}\ %)
set stl+=%=
set stl+=%(%#statusMiddle#\ %b(%B)\ -\ %o(%O)\ %)
set stl+=%(%#statusStart#\ %c,\ %l/%L\ [%p%%]\ %)

function GetMode()
    let mode = mode()
    if mode == 'n'
        return 'Normal'
    elseif mode == 'i'
        return 'Insert'
    elseif mode == 'v'
        return 'Visual'
    else
        return 'Unknown'
    endif
endfunction

"""General mappings

inoremap <leader>n <esc>/<++><cr>c4l
inoremap <leader>w <esc>:w!<cr>i

inoremap {<CR> {<CR>}<ESC>O
inoremap <C-Space> 

nnoremap ,note :-1read ~/.templates/.mdnote<CR>

nnoremap <C-n> :Lex<CR>

"""MarkDown
autocmd FileType md nnoremap ,w \| ! pandoc expand("%:t") -o expand("%:t:r").html

"""Csharp
autocmd FileType cs inoremap cw<TAB> Console.WriteLine();<ESC>hi
autocmd FileType cs inoremap for<TAB> for (int i = 0; i < ; i++)<CR>{<CR>}<ESC>kkf<la
autocmd FileType cs inoremap forr<TAB> for (int i = ; i >= 0; i++)<CR>{<CR>}<ESC>kkf=la
autocmd FileType cs inoremap prop<TAB> public { get; set; }<ESC>0wwi
autocmd FileType cs inoremap <leader>reg #region <CR>#endregion<ESC>kA

autocmd FileType cs set foldmethod=marker
autocmd FileType cs set foldmarker=#region,#endregion

nmap ,man "*yiw:!st -e man $(xclip -o) &<CR>
nmap ,hman "*yiw:!st -e man -Hsurf $(xclip -o) &<CR>

