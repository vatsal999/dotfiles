" -----------------------------------------------------------------------------
" Name:         Salvation
" Description:  Western-like colorscheme for vim
" Author:       Brandon Wright
" Website:      https://codeberg.com/exorcist/salvation-vim
" License:      MIT
" -----------------------------------------------------------------------------

scriptencoding utf-8

set background=dark

if v:version > 580
  hi clear
  if exists('syntax_on')
    syntax reset
  endif
endif

let g:colors_name='salvation'

if !has('gui_running') && &t_Co != 256
  finish
endif

" Palette {{{

let s:black          = ['#1f1f1f', 0]
let s:red            = ['#734541', 1]
let s:green          = ['#5c604b', 2]
let s:yellow         = ['#8f6840', 3]
let s:blue           = ['#535c5c', 4]
let s:magenta        = ['#775759', 5]
let s:cyan           = ['#6d715e', 6]
let s:white          = ['#c0b18b', 7]
let s:bright_black   = ['#4a3637', 8]
let s:bright_red     = ['#734541', 9]
let s:bright_green   = ['#63684d', 10]
let s:bright_yellow  = ['#8f6840', 11]
let s:bright_blue    = ['#535c5c', 12]
let s:bright_magenta = ['#775759', 13]
let s:bright_cyan    = ['#585c49', 14]
let s:bright_white   = ['#978965', 15]

" xterm colors.
let s:orange        = ['#585c49', 202]
let s:bright_orange = ['#6d715e', 208]
let s:hard_black    = ['#121212', 233]
let s:xgray1        = ['#262626', 235]
let s:xgray2        = ['#303030', 236]
let s:xgray3        = ['#3A3A3A', 237]
let s:xgray4        = ['#444444', 238]
let s:xgray5        = ['#4E4E4E', 239]
let s:xgray6        = ['#585858', 240]

"}}}
" Setup Variables: {{{

let s:none = ['NONE', 'NONE']

if !exists('g:salvation_bold')
  let g:salvation_bold=1
endif

if !exists('g:salvation_italic')
  if has('gui_running') || $TERM_ITALICS ==? 'true'
    let g:salvation_italic=1
  else
    let g:salvation_italic=0
  endif
endif

if !exists('g:salvation_transparent_background')
  let g:salvation_transparent_background=0
endif

if !exists('g:salvation_undercurl')
  let g:salvation_undercurl=1
endif

if !exists('g:salvation_underline')
  let g:salvation_underline=1
endif

if !exists('g:salvation_inverse')
  let g:salvation_inverse=1
endif

if !exists('g:salvation_inverse_matches')
  let g:salvation_inverse_matches=0
endif

if !exists('g:salvation_inverse_match_paren')
  let g:salvation_inverse_match_paren=0
endif

if !exists('g:salvation_dim_lisp_paren')
  let g:salvation_dim_lisp_paren=0
endif

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:salvation_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:salvation_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:salvation_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:salvation_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:salvation_inverse == 0
  let s:inverse = ''
endif

" }}}
" Highlighting Function: {{{

function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let l:fg = a:fg

  " background
  if a:0 >= 1
    let l:bg = a:1
  else
    let l:bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let l:emstr = a:2
  else
    let l:emstr = 'NONE,'
  endif

  let l:histring = [ 'hi', a:group,
        \ 'guifg=' . l:fg[0], 'ctermfg=' . l:fg[1],
        \ 'guibg=' . l:bg[0], 'ctermbg=' . l:bg[1],
        \ 'gui=' . l:emstr[:-2], 'cterm=' . l:emstr[:-2]
        \ ]

  " special
  if a:0 >= 3
    call add(l:histring, 'guisp=' . a:3[0])
  endif

  execute join(l:histring, ' ')
endfunction
"}}}
" Salvation Hi Groups: {{{

" memoize common hi groups
call s:HL('SalvationWhite', s:white)
call s:HL('SalvationRed', s:red)
call s:HL('SalvationGreen', s:green)
call s:HL('SalvationYellow', s:yellow)
call s:HL('SalvationBlue', s:blue)
call s:HL('SalvationMagenta', s:magenta)
call s:HL('SalvationCyan', s:cyan)
call s:HL('SalvationBlack', s:black)

call s:HL('SalvationRedBold', s:red, s:none, s:bold)
call s:HL('SalvationGreenBold', s:green, s:none, s:bold)
call s:HL('SalvationYellowBold', s:yellow, s:none, s:bold)
call s:HL('SalvationBlueBold', s:blue, s:none, s:bold)
call s:HL('SalvationMagentaBold', s:magenta, s:none, s:bold)
call s:HL('SalvationCyanBold', s:cyan, s:none, s:bold)

call s:HL('SalvationBrightRed', s:bright_red, s:none)
call s:HL('SalvationBrightGreen', s:bright_green, s:none)
call s:HL('SalvationBrightYellow', s:bright_yellow, s:none)
call s:HL('SalvationBrightBlue', s:bright_blue, s:none)
call s:HL('SalvationBrightMagenta', s:bright_magenta, s:none)
call s:HL('SalvationBrightCyan', s:bright_cyan, s:none)
call s:HL('SalvationBrightBlack', s:bright_black, s:none)
call s:HL('SalvationBrightWhite', s:bright_white)

" special
call s:HL('SalvationOrange', s:orange)
call s:HL('SalvationBrightOrange', s:bright_orange)
call s:HL('SalvationOrangeBold', s:orange, s:none, s:bold)
call s:HL('SalvationHardBlack', s:hard_black)
call s:HL('SalvationXgray1', s:xgray1)
call s:HL('SalvationXgray2', s:xgray2)
call s:HL('SalvationXgray3', s:xgray3)
call s:HL('SalvationXgray4', s:xgray4)
call s:HL('SalvationXgray5', s:xgray5)
call s:HL('SalvationXgray6', s:xgray6)

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:black[0]
  let g:terminal_color_8 = s:bright_black[0]

  let g:terminal_color_1 = s:red[0]
  let g:terminal_color_9 = s:bright_red[0]

  let g:terminal_color_2 = s:green[0]
  let g:terminal_color_10 = s:bright_green[0]

  let g:terminal_color_3 = s:yellow[0]
  let g:terminal_color_11 = s:bright_yellow[0]

  let g:terminal_color_4 = s:blue[0]
  let g:terminal_color_12 = s:bright_blue[0]

  let g:terminal_color_5 = s:magenta[0]
  let g:terminal_color_13 = s:bright_magenta[0]

  let g:terminal_color_6 = s:cyan[0]
  let g:terminal_color_14 = s:bright_cyan[0]

  let g:terminal_color_7 = s:white[0]
  let g:terminal_color_15 = s:bright_white[0]
endif

" }}}
" Setup Terminal Colors For Vim with termguicolors: {{{

if exists('*term_setansicolors')
  let g:terminal_ansi_colors = repeat([0], 16)

  let g:terminal_ansi_colors[0] = s:black[0]
  let g:terminal_ansi_colors[8] = s:bright_black[0]

  let g:terminal_ansi_colors[1] = s:red[0]
  let g:terminal_ansi_colors[9] = s:bright_red[0]

  let g:terminal_ansi_colors[2] = s:green[0]
  let g:terminal_ansi_colors[10] = s:bright_green[0]

  let g:terminal_ansi_colors[3] = s:yellow[0]
  let g:terminal_ansi_colors[11] = s:bright_yellow[0]

  let g:terminal_ansi_colors[4] = s:blue[0]
  let g:terminal_ansi_colors[12] = s:bright_blue[0]

  let g:terminal_ansi_colors[5] = s:magenta[0]
  let g:terminal_ansi_colors[13] = s:bright_magenta[0]

  let g:terminal_ansi_colors[6] = s:cyan[0]
  let g:terminal_ansi_colors[14] = s:bright_cyan[0]

  let g:terminal_ansi_colors[7] = s:white[0]
  let g:terminal_ansi_colors[15] = s:bright_white[0]
endif

" }}}

" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

" Normal text

if g:salvation_transparent_background == 1 && !has('gui_running')
  call s:HL('Normal', s:bright_white, s:none)
 else
  call s:HL('Normal', s:bright_white, s:black)
endif

if v:version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:xgray2)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine


  if g:salvation_transparent_background == 1 && !has('gui_running')
    " Tab pages line filler
    call s:HL('TabLineFill', s:green, s:none)
    " Active tab page label
    call s:HL('TabLineSel', s:red, s:none, s:bold)
  else
    call s:HL('TabLineFill', s:green, s:black)
    call s:HL('TabLineSel', s:red, s:black, s:bold)
  endif

  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  "
  if g:salvation_inverse_match_paren == 1
    call s:HL('MatchParen', s:bright_magenta, s:none, s:inverse . s:bold)
  else
    call s:HL('MatchParen', s:bright_magenta, s:none, s:bold)
  endif
endif

if v:version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:xgray2)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  if g:salvation_transparent_background == 1 && !has('gui_running')
    call s:HL('CursorLineNr', s:yellow, s:none)
  else
    call s:HL('CursorLineNr', s:yellow, s:black)
  endif

endif

hi! link NonText SalvationXgray4
hi! link SpecialKey SalvationXgray4

if g:salvation_inverse == 1
  call s:HL('Visual', s:none, s:none, s:inverse)
else
  call s:HL('Visual', s:none, s:xgray2, s:bold)
endif

hi! link VisualNOS Visual

if g:salvation_inverse == 1 && g:salvation_inverse_matches == 1
  call s:HL('Search', s:none, s:none, s:inverse)
  call s:HL('IncSearch', s:none, s:none, s:inverse)
else
  call s:HL('Search', s:none, s:xgray5, s:bold)
  call s:HL('IncSearch', s:none, s:xgray5, s:underline . s:bold)
endif

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bright_white, s:xgray2)

if g:salvation_transparent_background == 1 && !has('gui_running')
  call s:HL('StatusLineNC', s:bright_black, s:none, s:underline)

  " The column separating vertically split windows
  call s:HL('VertSplit', s:bright_white, s:none)

  " Current match in wildmenu completion
  call s:HL('WildMenu', s:blue, s:none, s:bold)
else
  call s:HL('StatusLineNC', s:bright_black, s:black, s:underline)
  call s:HL('VertSplit', s:bright_white, s:black)
  call s:HL('WildMenu', s:blue, s:black, s:bold)
endif

" Directory names, special names in listing
hi! link Directory SalvationGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title SalvationGreenBold

" Error messages on the command line
call s:HL('ErrorMsg', s:bright_white, s:red)
" More prompt: -- More --
hi! link MoreMsg SalvationYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg SalvationYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question SalvationOrangeBold
" Warning messages
hi! link WarningMsg SalvationRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bright_black)

if g:salvation_transparent_background == 1 && !has('gui_running')
  " Column where signs are displayed
  " TODO Possibly need to fix  SignColumn
  call s:HL('SignColumn', s:none, s:none)
  " Line used for closed folds
  call s:HL('Folded', s:bright_black, s:none, s:italic)
  " Column where folds are displayed
  call s:HL('FoldColumn', s:bright_black, s:none)
else
  call s:HL('SignColumn', s:none, s:black)
  call s:HL('Folded', s:bright_black, s:black, s:italic)
  call s:HL('FoldColumn', s:bright_black, s:black)
endif

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:black, s:yellow)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

hi! link Special SalvationOrange

call s:HL('Comment', s:bright_black, s:none, s:italic)

if g:salvation_transparent_background == 1 && !has('gui_running')
  call s:HL('Todo', s:bright_white, s:none, s:bold . s:italic)
else
  call s:HL('Todo', s:bright_white, s:black, s:bold . s:italic)
endif

call s:HL('Error', s:bright_white, s:red, s:bold)

" String constant: "this is a string"
call s:HL('String',  s:bright_green)

" Generic statement
hi! link Statement SalvationRed
" if, then, else, endif, swicth, etc.
hi! link Conditional SalvationRed
" for, do, while, etc.
hi! link Repeat SalvationRed
" case, default, etc.
hi! link Label SalvationRed
" try, catch, throw
hi! link Exception SalvationRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword SalvationRed

" Variable name
hi! link Identifier SalvationCyan
" Function name
hi! link Function SalvationYellow

" Generic preprocessor
hi! link PreProc SalvationCyan
" Preprocessor #include
hi! link Include SalvationCyan
" Preprocessor #define
hi! link Define SalvationCyan
" Same as Define
hi! link Macro SalvationOrange
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit SalvationCyan

" Generic constant
hi! link Constant SalvationBrightMagenta
" Character constant: 'c', '/n'
hi! link Character SalvationBrightMagenta
" Boolean constant: TRUE, false
hi! link Boolean SalvationBrightMagenta
" Number constant: 234, 0xff
hi! link Number SalvationBrightMagenta
" Floating point constant: 2.3e10
hi! link Float SalvationBrightMagenta

" Generic type
hi! link Type SalvationBrightBlue
" static, register, volatile, etc
hi! link StorageClass SalvationOrange
" struct, union, enum, etc.
hi! link Structure SalvationCyan
" typedef
hi! link Typedef SalvationMagenta

if g:salvation_dim_lisp_paren == 1
  hi! link Delimiter SalvationXgray6
else
  hi! link Delimiter SalvationBrightBlack
endif

" }}}
" Completion Menu: {{{

if v:version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:bright_white, s:xgray2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bright_white, s:magenta, s:bold)

  if g:salvation_transparent_background == 1 && !has('gui_running')
    " Popup menu: scrollbar
    call s:HL('PmenuSbar', s:none, s:none)
    " Popup menu: scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:none)
  else
    call s:HL('PmenuSbar', s:none, s:black)
    call s:HL('PmenuThumb', s:none, s:black)
  endif
endif

" }}}
" Diffs: {{{

if g:salvation_transparent_background == 1 && !has('gui_running')
  call s:HL('DiffDelete', s:red, s:none)
  call s:HL('DiffAdd',    s:green, s:none)
  call s:HL('DiffChange', s:cyan, s:none)
  call s:HL('DiffText',   s:yellow, s:none)
else
  call s:HL('DiffDelete', s:red, s:black)
  call s:HL('DiffAdd',    s:green, s:black)
  call s:HL('DiffChange', s:cyan, s:black)
  call s:HL('DiffText',   s:yellow, s:black)
endif

" }}}
" Spelling: {{{

if has('spell')
  " Not capitalised word, or compile warnings
  call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:cyan)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:magenta)
endif

" }}}
" Terminal: {{{

if has('terminal')
  " Must set an explicit background as NONE won't work
  " Therefore not useful with transparent background option
  call s:HL('Terminal', s:bright_white, s:hard_black)
endif

" }}}

" Plugin specific -------------------------------------------------------------
" Sneak: {{{

hi! link Sneak Search
call s:HL('SneakScope', s:none, s:hard_black)
hi! link SneakLabel Search

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue',  '#2C78BF'], ['202',  '#FF5F00'],
      \ ['red',  '#EF2F27'], ['magenta', '#E02C6D']
    \ ]
endif

let g:rainbow_guifgs = [ '#E02C6D', '#EF2F27', '#D75F00', '#2C78BF']
let g:rainbow_ctermfgs = [ 'magenta', 'red', '202', 'blue' ]

if !exists('g:rainbow_conf')
  let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
  let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
  let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd SalvationGreen
hi! link GitGutterChange SalvationYellow
hi! link GitGutterDelete SalvationRed
hi! link GitGutterChangeDelete SalvationYellow

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile SalvationGreen
hi! link gitcommitDiscardedFile SalvationRed

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign SalvationRed
hi! link ALEWarningSign SalvationYellow
hi! link ALEInfoSign SalvationBlue

" }}}
" vim-indent-guides: {{{

call s:HL('IndentGuidesEven', s:none, s:xgray3)
call s:HL('IndentGuidesOdd',  s:none, s:xgray4)

" }}}
" vim-startify {{{

hi! link StartifyNumber Statement
hi! link StartifyFile Normal
hi! link StartifyPath String
hi! link StartifySlash Normal
hi! link StartifyBracket Comment
hi! link StartifyHeader Type
hi! link StartifyFooter Normal
hi! link StartifySpecial Comment
hi! link StartifySection Identifier

" }}}
" fzf: {{{

call s:HL('fzf1', s:magenta, s:xgray2)
call s:HL('fzf2', s:bright_green, s:xgray2)
call s:HL('fzf3', s:bright_white, s:xgray2)

"}}}
" Netrw: {{{

hi! link netrwDir SalvationCyan
hi! link netrwClassify SalvationCyan
hi! link netrwLink SalvationBrightBlack
hi! link netrwSymLink SalvationWhite
hi! link netrwExe SalvationYellow
hi! link netrwComment SalvationBrightBlack
hi! link netrwList SalvationBlue
hi! link netrwTreeBar SalvationBrightBlack
hi! link netrwHelpCmd SalvationCyan
hi! link netrwVersion SalvationGreen
hi! link netrwCmdSep SalvationBrightBlack

"}}}
" coc.nvim: {{{

hi! link CocErrorSign SalvationRed
hi! link CocWarningSign SalvationBrightOrange
hi! link CocInfoSign SalvationYellow
hi! link CocHintSign SalvationBlue
hi! link CocErrorFloat SalvationRed
hi! link CocWarningFloat SalvationOrange
hi! link CocInfoFloat SalvationYellow
hi! link CocHintFloat SalvationBlue
hi! link CocDiagnosticsError SalvationRed
hi! link CocDiagnosticsWarning SalvationOrange
hi! link CocDiagnosticsInfo SalvationYellow
hi! link CocDiagnosticsHint SalvationBlue

hi! link CocSelectedText SalvationRed
hi! link CocCodeLens SalvationWhite

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:bright_orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
" CtrlP: "{{{
hi! link CtrlPMatch SalvationMagenta
hi! link CtrlPLinePre SalvationBrightGreen
call s:HL('CtrlPMode1', s:bright_white, s:xgray3)
call s:HL('CtrlPMode2', s:bright_white, s:xgray5)
call s:HL('CtrlPStats', s:yellow, s:xgray2)
" }}}

" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded SalvationGreen
hi! link diffRemoved SalvationRed
hi! link diffChanged SalvationCyan

hi! link diffFile SalvationOrange
hi! link diffNewFile SalvationYellow

hi! link diffLine SalvationBlue

" }}}
" Html: {{{

hi! link htmlTag SalvationBlue
hi! link htmlEndTag SalvationBlue

hi! link htmlTagName SalvationBlue
hi! link htmlTag SalvationBrightBlack
hi! link htmlArg SalvationYellow

hi! link htmlScriptTag SalvationRed
hi! link htmlTagN SalvationBlue
hi! link htmlSpecialTagName SalvationBlue

call s:HL('htmlLink', s:bright_white, s:none, s:underline)

hi! link htmlSpecialChar SalvationYellow

if g:salvation_transparent_background == 1 && !has('gui_running')
  call s:HL('htmlBold', s:bright_white, s:none, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:none, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:none, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:none, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:none, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:none, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:none, s:italic)
else
  call s:HL('htmlBold', s:bright_white, s:black, s:bold)
  call s:HL('htmlBoldUnderline', s:bright_white, s:black, s:bold . s:underline)
  call s:HL('htmlBoldItalic', s:bright_white, s:black, s:bold . s:italic)
  call s:HL('htmlBoldUnderlineItalic', s:bright_white, s:black, s:bold . s:underline . s:italic)
  call s:HL('htmlUnderline', s:bright_white, s:black, s:underline)
  call s:HL('htmlUnderlineItalic', s:bright_white, s:black, s:underline . s:italic)
  call s:HL('htmlItalic', s:bright_white, s:black, s:italic)
endif


" }}}
" Xml: {{{

hi! link xmlTag SalvationBlue
hi! link xmlEndTag SalvationBlue
hi! link xmlTagName SalvationBlue
hi! link xmlEqual SalvationBlue
hi! link docbkKeyword SalvationCyanBold

hi! link xmlDocTypeDecl SalvationBrightBlack
hi! link xmlDocTypeKeyword SalvationMagenta
hi! link xmlCdataStart SalvationBrightBlack
hi! link xmlCdataCdata SalvationMagenta
hi! link dtdFunction SalvationBrightBlack
hi! link dtdTagName SalvationMagenta

hi! link xmlAttrib SalvationCyan
hi! link xmlProcessingDelim SalvationBrightBlack
hi! link dtdParamEntityPunct SalvationBrightBlack
hi! link dtdParamEntityDPunct SalvationBrightBlack
hi! link xmlAttribPunct SalvationBrightBlack

hi! link xmlEntity SalvationYellow
hi! link xmlEntityPunct SalvationYellow
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:bright_white, s:none, s:bold . s:italic)

hi! link vimNotation SalvationYellow
hi! link vimBracket SalvationYellow
hi! link vimMapModKey SalvationYellow
hi! link vimFuncSID SalvationBrightWhite
hi! link vimSetSep SalvationBrightWhite
hi! link vimSep SalvationBrightWhite
hi! link vimContinue SalvationBrightWhite

" }}}
" Lisp dialects: {{{
if g:salvation_dim_lisp_paren == 1
  hi! link schemeParentheses SalvationXgray6
  hi! link clojureParen SalvationXgray6
else
  hi! link schemeParentheses SalvationBrightBlack
  hi! link clojureParen SalvationBrightBlack
endif

hi! link clojureKeyword SalvationBlue
hi! link clojureCond SalvationRed
hi! link clojureSpecial SalvationRed
hi! link clojureDefine SalvationRed

hi! link clojureFunc SalvationYellow
hi! link clojureRepeat SalvationYellow
hi! link clojureCharacter SalvationCyan
hi! link clojureStringEscape SalvationCyan
hi! link clojureException SalvationRed

hi! link clojureRegexp SalvationCyan
hi! link clojureRegexpEscape SalvationCyan
call s:HL('clojureRegexpCharClass', s:bright_white, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureAnonArg SalvationYellow
hi! link clojureVariable SalvationBlue
hi! link clojureMacro SalvationOrangeBold

hi! link clojureMeta SalvationYellow
hi! link clojureDeref SalvationYellow
hi! link clojureQuote SalvationYellow
hi! link clojureUnquote SalvationYellow
" }}}
" C: {{{

hi! link cOperator SalvationMagenta
hi! link cStructure SalvationYellow

" }}}
" Python: {{{

hi! link pythonBuiltin SalvationYellow
hi! link pythonBuiltinObj SalvationYellow
hi! link pythonBuiltinFunc SalvationYellow
hi! link pythonFunction SalvationCyan
hi! link pythonDecorator SalvationRed
hi! link pythonInclude SalvationBlue
hi! link pythonImport SalvationBlue
hi! link pythonRun SalvationBlue
hi! link pythonCoding SalvationBlue
hi! link pythonOperator SalvationRed
hi! link pythonExceptions SalvationMagenta
hi! link pythonBoolean SalvationMagenta
hi! link pythonDot SalvationBrightWhite

" }}}
" CSS/SASS: {{{

hi! link cssBraces SalvationBrightWhite
hi! link cssFunctionName SalvationYellow
hi! link cssIdentifier SalvationBlue
hi! link cssClassName SalvationBlue
hi! link cssClassNameDot SalvationBlue
hi! link cssColor SalvationBrightMagenta
hi! link cssSelectorOp SalvationBlue
hi! link cssSelectorOp2 SalvationBlue
hi! link cssImportant SalvationGreen
hi! link cssVendor SalvationBlue
hi! link cssMediaProp SalvationYellow
hi! link cssBorderProp SalvationYellow
hi! link cssAttrComma SalvationBrightWhite

hi! link cssTextProp SalvationYellow
hi! link cssAnimationProp SalvationYellow
hi! link cssUIProp SalvationYellow
hi! link cssTransformProp SalvationYellow
hi! link cssTransitionProp SalvationYellow
hi! link cssPrintProp SalvationYellow
hi! link cssPositioningProp SalvationYellow
hi! link cssBoxProp SalvationYellow
hi! link cssFontDescriptorProp SalvationYellow
hi! link cssFlexibleBoxProp SalvationYellow
hi! link cssBorderOutlineProp SalvationYellow
hi! link cssBackgroundProp SalvationYellow
hi! link cssMarginProp SalvationYellow
hi! link cssListProp SalvationYellow
hi! link cssTableProp SalvationYellow
hi! link cssFontProp SalvationYellow
hi! link cssPaddingProp SalvationYellow
hi! link cssDimensionProp SalvationYellow
hi! link cssRenderProp SalvationYellow
hi! link cssColorProp SalvationYellow
hi! link cssGeneratedContentProp SalvationYellow
hi! link cssTagName SalvationBrightBlue

" SASS
hi! link sassClass SalvationBlue
hi! link sassClassChar SalvationBlue
hi! link sassVariable SalvationCyan
hi! link sassIdChar SalvationBrightBlue

" }}}
" JavaScript: {{{

hi! link javaScriptMember SalvationBlue
hi! link javaScriptNull SalvationMagenta

" }}}
" YAJS: {{{

hi! link javascriptParens SalvationBrightCyan
hi! link javascriptFuncArg Normal
hi! link javascriptDocComment SalvationGreen
hi! link javascriptArrayMethod Function
hi! link javascriptReflectMethod Function
hi! link javascriptStringMethod Function
hi! link javascriptObjectMethod Function
hi! link javascriptObjectStaticMethod Function
hi! link javascriptObjectLabel SalvationBlue

hi! link javascriptProp SalvationBlue

hi! link javascriptVariable SalvationBrightBlue
hi! link javascriptOperator SalvationBrightCyan
hi! link javascriptFuncKeyword SalvationBrightRed
hi! link javascriptFunctionMethod SalvationYellow
hi! link javascriptReturn SalvationBrightRed
hi! link javascriptEndColons Normal

" }}}
" CoffeeScript: {{{

hi! link coffeeExtendedOp SalvationBrightWhite
hi! link coffeeSpecialOp SalvationBrightWhite
hi! link coffeeCurly SalvationYellow
hi! link coffeeParen SalvationBrightWhite
hi! link coffeeBracket SalvationYellow

" }}}
" Ruby: {{{

hi! link rubyStringDelimiter SalvationGreen
hi! link rubyInterpolationDelimiter SalvationCyan
hi! link rubyDefine Keyword

" }}}
" ObjectiveC: {{{

hi! link objcTypeModifier SalvationRed
hi! link objcDirective SalvationBlue

" }}}
" Go: {{{

hi! link goDirective SalvationCyan
hi! link goConstants SalvationMagenta
hi! link goDeclaration SalvationRed
hi! link goDeclType SalvationBlue
hi! link goBuiltins SalvationYellow

" }}}
" Lua: {{{

hi! link luaIn SalvationRed
hi! link luaFunction SalvationCyan
hi! link luaTable SalvationYellow

" }}}
" MoonScript: {{{

hi! link moonSpecialOp SalvationBrightWhite
hi! link moonExtendedOp SalvationBrightWhite
hi! link moonFunction SalvationBrightWhite
hi! link moonObject SalvationYellow

" }}}
" Java: {{{

hi! link javaAnnotation SalvationBlue
hi! link javaDocTags SalvationCyan
hi! link javaCommentTitle vimCommentTitle
hi! link javaParen SalvationBrightWhite
hi! link javaParen1 SalvationBrightWhite
hi! link javaParen2 SalvationBrightWhite
hi! link javaParen3 SalvationBrightWhite
hi! link javaParen4 SalvationBrightWhite
hi! link javaParen5 SalvationBrightWhite
hi! link javaOperator SalvationYellow

hi! link javaVarArg SalvationGreen

" }}}
" Elixir: {{{

hi! link elixirDocString Comment

hi! link elixirStringDelimiter SalvationGreen
hi! link elixirInterpolationDelimiter SalvationCyan

" }}}
" Scala: {{{

" NB: scala vim syntax file is kinda horrible
hi! link scalaNameDefinition SalvationBlue
hi! link scalaCaseFollowing SalvationBlue
hi! link scalaCapitalWord SalvationBlue
hi! link scalaTypeExtension SalvationBlue

hi! link scalaKeyword SalvationRed
hi! link scalaKeywordModifier SalvationRed

hi! link scalaSpecial SalvationCyan
hi! link scalaOperator SalvationBlue

hi! link scalaTypeDeclaration SalvationYellow
hi! link scalaTypeTypePostDeclaration SalvationYellow

hi! link scalaInstanceDeclaration SalvationBlue
hi! link scalaInterpolation SalvationCyan

" }}}
" Markdown: {{{

call s:HL('markdownItalic', s:bright_white, s:none, s:italic)

hi! link markdownH1 SalvationGreenBold
hi! link markdownH2 SalvationGreenBold
hi! link markdownH3 SalvationYellowBold
hi! link markdownH4 SalvationYellowBold
hi! link markdownH5 SalvationYellow
hi! link markdownH6 SalvationYellow

hi! link markdownCode SalvationCyan
hi! link markdownCodeBlock SalvationCyan
hi! link markdownCodeDelimiter SalvationCyan

hi! link markdownBlockquote SalvationBrightBlack
hi! link markdownListMarker SalvationBrightBlack
hi! link markdownOrderedListMarker SalvationBrightBlack
hi! link markdownRule SalvationBrightBlack
hi! link markdownHeadingRule SalvationBrightBlack

hi! link markdownUrlDelimiter SalvationBrightWhite
hi! link markdownLinkDelimiter SalvationBrightWhite
hi! link markdownLinkTextDelimiter SalvationBrightWhite

hi! link markdownHeadingDelimiter SalvationYellow
hi! link markdownUrl SalvationMagenta
hi! link markdownUrlTitleDelimiter SalvationGreen

call s:HL('markdownLinkText', s:bright_black, s:none, s:underline)
hi! link markdownIdDeclaration markdownLinkText

" }}}
" Haskell: {{{

" hi! link haskellType SalvationYellow
" hi! link haskellOperators SalvationYellow
" hi! link haskellConditional SalvationCyan
" hi! link haskellLet SalvationYellow

hi! link haskellType SalvationBlue
hi! link haskellIdentifier SalvationBlue
hi! link haskellSeparator SalvationBlue
hi! link haskellDelimiter SalvationBrightWhite
hi! link haskellOperators SalvationBlue

hi! link haskellBacktick SalvationYellow
hi! link haskellStatement SalvationYellow
hi! link haskellConditional SalvationYellow

hi! link haskellLet SalvationCyan
hi! link haskellDefault SalvationCyan
hi! link haskellWhere SalvationCyan
hi! link haskellBottom SalvationCyan
hi! link haskellBlockKeywords SalvationCyan
hi! link haskellImportKeywords SalvationCyan
hi! link haskellDeclKeyword SalvationCyan
hi! link haskellDeriving SalvationCyan
hi! link haskellAssocType SalvationCyan

hi! link haskellNumber SalvationMagenta
hi! link haskellPragma SalvationMagenta

hi! link haskellString SalvationGreen
hi! link haskellChar SalvationGreen

" }}}
" Json: {{{

hi! link jsonKeyword SalvationGreen
hi! link jsonQuote SalvationGreen
hi! link jsonBraces SalvationBlue
hi! link jsonString SalvationBlue

" }}}
" Rust: {{{
"https://github.com/rust-lang/rust.vim/blob/master/syntax/rust.vim
hi! link rustCommentLineDoc SalvationGreen
hi! link rustModPathSep SalvationBrightBlack
" }}}
" Make: {{{
hi! link makePreCondit SalvationRed
hi! link makeCommands SalvationBrightWhite
hi! link makeTarget SalvationYellow
" }}}
" Misc: {{{
call s:HL('shParenError', s:bright_white, s:bright_red)
call s:HL('ExtraWhitespace', s:none, s:red)
" }}}

" vim:sw=2:ts=2:sts=2:et:tw=80:ft=vim:fdm=marker
