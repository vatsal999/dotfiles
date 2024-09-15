" Name:         rusticated
" Author:       haystackandroid
" Maintainer:   haystackandroid
" License:      MIT

if !(has('termguicolors') && &termguicolors) && !has('gui_running')
   \ && (!exists('&t_Co') || &t_Co < 256)
  echoerr '[rusticated] There are not enough colors.'
  finish
endif

set background=light

hi clear
if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'rusticated'

hi Bold ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Conceal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Directory ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi EndOfBuffer ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Ignore ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Italic ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,italic gui=NONE,italic
hi ModeMsg ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi MoreMsg ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Question ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi NonText ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Normal ctermfg=238 ctermbg=252 guifg=#444136 guibg=#d3d2ce guisp=NONE cterm=NONE gui=NONE
hi Terminal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Title ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,bold gui=NONE,bold
hi Underlined ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=NONE cterm=NONE,underline gui=NONE,underline
hi Comment ctermfg=240 ctermbg=NONE guifg=#5f5a4c guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi CursorLineNr ctermfg=240 ctermbg=NONE guifg=#5f5a4c guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi LineNr ctermfg=240 ctermbg=NONE guifg=#5f5a4c guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi FoldColumn ctermfg=238 ctermbg=NONE guifg=#444136 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PmenuSel ctermfg=238 ctermbg=252 guifg=#444136 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi SignColumn ctermfg=238 ctermbg=NONE guifg=#444136 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi StatusLine ctermfg=238 ctermbg=252 guifg=#444136 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi StatusLineTerm ctermfg=238 ctermbg=252 guifg=#444136 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi TabLineSel ctermfg=238 ctermbg=252 guifg=#444136 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi VisualNOS ctermfg=240 ctermbg=252 guifg=#5f5a4c guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Cursor ctermfg=236 ctermbg=252 guifg=#312d23 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi IncSearch ctermfg=236 ctermbg=252 guifg=#312d23 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi ColorColumn ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi CursorLine ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi DiffChange ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi Folded ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi MatchParen ctermfg=236 ctermbg=246 guifg=#312d23 guibg=#989387 guisp=NONE cterm=NONE gui=NONE
hi Pmenu ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi QuickFixLine ctermfg=NONE ctermbg=250 guifg=NONE guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi StatusLineNC ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi StatusLineTermNC ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi TabLine ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi ToolbarButton ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE,bold gui=NONE,bold
hi WildMenu ctermfg=238 ctermbg=250 guifg=#444136 guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi PmenuSbar ctermfg=246 ctermbg=246 guifg=#989387 guibg=#989387 guisp=NONE cterm=NONE gui=NONE
hi PmenuThumb ctermfg=238 ctermbg=238 guifg=#444136 guibg=#444136 guisp=NONE cterm=NONE gui=NONE
hi TabLineFill ctermfg=250 ctermbg=250 guifg=#c3c0ba guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi ToolbarLine ctermfg=250 ctermbg=250 guifg=#c3c0ba guibg=#c3c0ba guisp=NONE cterm=NONE gui=NONE
hi VertSplit ctermfg=246 ctermbg=246 guifg=#989387 guibg=#989387 guisp=NONE cterm=NONE gui=NONE
hi SpellBad ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#90001b cterm=NONE,underline gui=NONE,undercurl
hi SpellCap ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#004ba9 cterm=NONE,underline gui=NONE,undercurl
hi SpellLocal ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#005a76 cterm=NONE,underline gui=NONE,undercurl
hi SpellRare ctermfg=NONE ctermbg=NONE guifg=NONE guibg=NONE guisp=#800c78 cterm=NONE,underline gui=NONE,undercurl
hi StorageClass ctermfg=96 ctermbg=NONE guifg=#784872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Structure ctermfg=96 ctermbg=NONE guifg=#784872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Type ctermfg=96 ctermbg=NONE guifg=#784872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Typedef ctermfg=96 ctermbg=NONE guifg=#784872 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi TooLong ctermfg=96 ctermbg=252 guifg=#784872 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi WarningMsg ctermfg=96 ctermbg=252 guifg=#784872 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Function ctermfg=95 ctermbg=NONE guifg=#834742 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Identifier ctermfg=95 ctermbg=NONE guifg=#834742 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi DiffDelete ctermfg=95 ctermbg=252 guifg=#834742 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi DiffRemoved ctermfg=95 ctermbg=252 guifg=#834742 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Error ctermfg=95 ctermbg=252 guifg=#834742 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi ErrorMsg ctermfg=95 ctermbg=252 guifg=#834742 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Debug ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Delimiter ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Special ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpecialChar ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpecialComment ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi SpecialKey ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Tag ctermfg=58 ctermbg=NONE guifg=#645826 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi DiffChanged ctermfg=58 ctermbg=252 guifg=#645826 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi DiffText ctermfg=58 ctermbg=252 guifg=#645826 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Search ctermfg=143 ctermbg=236 guifg=#bca964 guibg=#312d23 guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Conditional ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Exception ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Keyword ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Label ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Operator ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Repeat ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Statement ctermfg=22 ctermbg=NONE guifg=#2c633f guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi DiffAdd ctermfg=22 ctermbg=252 guifg=#2c633f guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi DiffAdded ctermfg=22 ctermbg=252 guifg=#2c633f guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Define ctermfg=23 ctermbg=NONE guifg=#006470 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Include ctermfg=23 ctermbg=NONE guifg=#006470 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Macro ctermfg=23 ctermbg=NONE guifg=#006470 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreCondit ctermfg=23 ctermbg=NONE guifg=#006470 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi PreProc ctermfg=23 ctermbg=NONE guifg=#006470 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Todo ctermfg=23 ctermbg=252 guifg=#006470 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse
hi Boolean ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Character ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Constant ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Float ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Number ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi String ctermfg=25 ctermbg=NONE guifg=#3c5a89 guibg=NONE guisp=NONE cterm=NONE gui=NONE
hi Visual ctermfg=25 ctermbg=252 guifg=#3c5a89 guibg=#d3d2ce guisp=NONE cterm=NONE,reverse gui=NONE,reverse


highlight BufferInactive guibg=#c3c0ba
highlight BufferInactiveSign guibg=#c3c0ba
highlight BufferInactiveIndex guibg=#c3c0ba

highlight VertSplit    guifg=#989387 guibg=bg gui=bold cterm=bold

highlight StatusLine   guifg=#989387 guibg=bg gui=bold cterm=bold

highlight StatusLineNC guifg=#989387 guibg=bg gui=bold cterm=bold
highlight TablineFill guifg=#989387 guibg=bg  gui=bold cterm=bold

highlight StatusLineTerm   guifg=#989387 guibg=bg gui=bold cterm=bold
highlight StatusLineTermNC guifg=#989387 guibg=bg gui=bold cterm=bold

highlight WinSeparator guifg=#989387 guibg=bg gui=bold cterm=bold

highlight CursorLine   guibg=#c3c0ba

highlight EndOfBuffer guifg=bg  guibg=bg


if has("nvim")
  let g:terminal_color_0 = "#d3d2ce"
  let g:terminal_color_1 = "#834742"
  let g:terminal_color_2 = "#2c633f"
  let g:terminal_color_3 = "#645826"
  let g:terminal_color_4 = "#3c5a89"
  let g:terminal_color_5 = "#784872"
  let g:terminal_color_6 = "#006470"
  let g:terminal_color_7 = "#444136"
  let g:terminal_color_8 = "#c3c0ba"
  let g:terminal_color_9 = "#834742"
  let g:terminal_color_10 = "#2c633f"
  let g:terminal_color_11 = "#645826"
  let g:terminal_color_12 = "#3c5a89"
  let g:terminal_color_13 = "#784872"
  let g:terminal_color_14 = "#006470"
  let g:terminal_color_15 = "#312d23"
elseif has("terminal")
  let g:terminal_ansi_colors = [
     \ "#d3d2ce",
     \ "#834742",
     \ "#2c633f",
     \ "#645826",
     \ "#3c5a89",
     \ "#784872",
     \ "#006470",
     \ "#444136",
     \ "#c3c0ba",
     \ "#834742",
     \ "#2c633f",
     \ "#645826",
     \ "#3c5a89",
     \ "#784872",
     \ "#006470",
     \ "#312d23"
     \ ]
endif
finish

" Background: light
" Color:      gry0 #d3d2ce ~
" Color:      gry1 #c3c0ba ~
" Color:      gry2 #5f5a4c ~
" Color:      gry3 #444136 ~
" Color:      gryc #312d23 ~
" Color:      srch #bca964 ~
" Color:      grys #312d23 ~
" Color:      gryp #989387 ~
" Color:      sprd #90001b ~
" Color:      spbl #004ba9 ~
" Color:      spcy #005a76 ~
" Color:      spmg #800c78 ~
" Color:      red_ #834742 ~
" Color:      gold #645826 ~
" Color:      gren #2c633f ~
" Color:      cyan #006470 ~
" Color:      blue #3c5a89 ~
" Color:      mgnt #784872 ~
" Bold               none   none   bold
" Conceal            none   none
" Directory          none   none   bold
" EndOfBuffer        none   none
" Ignore             none   none
" Italic             none   none   italic
" ModeMsg            none   none
" MoreMsg            none   none
" Question           none   none
" NonText            none   none
" Normal             gry3   gry0
" Terminal           none   none
" Title              none   none   bold
" Underlined         none   none   underline
" Comment            gry2   none
" CursorLineNr       gry2   none
" LineNr             gry2   none
" FoldColumn         gry3   none
" PmenuSel           gry3   gry0   reverse
" SignColumn         gry3   none
" StatusLine         gry3   gry0   reverse
" StatusLineTerm     gry3   gry0   reverse
" TabLineSel         gry3   gry0   reverse
" VisualNOS          gry2   gry0   reverse
" Cursor             gryc   gry0   reverse
" IncSearch          gryc   gry0   reverse
" ColorColumn        none   gry1
" CursorColumn       none   gry1
" CursorLine         none   gry1
" DiffChange         none   gry1
" Folded             none   gry1
" MatchParen         gryc   gryp
" Pmenu              gry3   gry1
" QuickFixLine       none   gry1
" StatusLineNC       gry3   gry1
" StatusLineTermNC   gry3   gry1
" TabLine            gry3   gry1
" ToolbarButton      gry3   gry1   bold
" WildMenu           gry3   gry1
" PmenuSbar          gryp   gryp
" PmenuThumb         gry3   gry3
" TabLineFill        gry1   gry1
" ToolbarLine        gry1   gry1
" VertSplit          gryp   gryp
" SpellBad           none   none   g=undercurl   s=sprd   t=underline
" SpellCap           none   none   g=undercurl   s=spbl   t=underline
" SpellLocal         none   none   g=undercurl   s=spcy   t=underline
" SpellRare          none   none   g=undercurl   s=spmg   t=underline
" StorageClass       mgnt   none
" Structure          mgnt   none
" Type               mgnt   none
" Typedef            mgnt   none
" TooLong            mgnt   gry0   reverse
" WarningMsg         mgnt   gry0   reverse
" Function           red_   none
" Identifier         red_   none
" DiffDelete         red_   gry0   reverse
" DiffRemoved        red_   gry0   reverse
" Error              red_   gry0   reverse
" ErrorMsg           red_   gry0   reverse
" Debug              gold   none
" Delimiter          gold   none
" Special            gold   none
" SpecialChar        gold   none
" SpecialComment     gold   none
" SpecialKey         gold   none
" Tag                gold   none
" DiffChanged        gold   gry0   reverse
" DiffText           gold   gry0   reverse
" Search             srch   grys   reverse
" Conditional        gren   none
" Exception          gren   none
" Keyword            gren   none
" Label              gren   none
" Operator           gren   none
" Repeat             gren   none
" Statement          gren   none
" DiffAdd            gren   gry0   reverse
" DiffAdded          gren   gry0   reverse
" Define             cyan   none
" Include            cyan   none
" Macro              cyan   none
" PreCondit          cyan   none
" PreProc            cyan   none
" Todo               cyan   gry0   reverse
" Boolean            blue   none
" Character          blue   none
" Constant           blue   none
" Float              blue   none
" Number             blue   none
" String             blue   none
" Visual             blue   gry0   reverse
