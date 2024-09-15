" lessthan.vim -- vim colorscheme
"
" Name:       lessthan
" Maintainer: Maxim Kim <habamax@gmail.com>
" License:    MIT, but who cares? This is colorscheme.
"
" Description:
"
" Black background colorscheme.
" There are tons of awesome `dark background` colorschemes...
" This is not one of them.
"
" But when the night comes upon you
" Caught unsleep
" You better be prepared
"
" Helpers:
"
" :h 'hl' 
" or
" :h highlight-default 
" to get vim default highlight group names
"
" :h group-name
" to see current syntax highlight of default syntax groups

set background=dark

hi clear
if exists('syntax_on')
	syntax reset
endif

let g:colors_name = 'lessthan'

"" Helper color groups
hi LessThanBold guibg=NONE guifg=#bcbcbc gui=bold ctermfg=250 ctermbg=NONE cterm=bold
hi LessThanNormal guibg=#000000 guifg=#bcbcbc gui=NONE ctermbg=0 ctermfg=250

"" General
hi Normal guibg=#000000 guifg=#bcbcbc gui=NONE ctermbg=0 ctermfg=250
hi Cursor guibg=#bcbcbc ctermbg=250
hi lCursor guibg=#ff0000 ctermbg=12
hi NonText guibg=NONE guifg=#303030 gui=NONE ctermfg=236 cterm=NONE
hi! link SpecialKey NonText
hi Visual guibg=#103040 guifg=#bcbcbc ctermbg=4 ctermfg=250

hi Directory guibg=NONE guifg=#767676 gui=bold ctermfg=243 ctermbg=NONE cterm=bold
hi Title guibg=NONE guifg=#eeeeee gui=bold ctermfg=255 cterm=bold
hi! link Todo Title

"" UI
hi Statusline guibg=#5c5c5c guifg=#d0d0d0 gui=NONE ctermbg=241 ctermfg=252 cterm=NONE
hi StatuslineNC guibg=#3a3a3a guifg=#9e9e9e gui=NONE ctermbg=237 ctermfg=247 cterm=NONE
hi StatuslineTerm guibg=#005f87 guifg=#d0d0d0 gui=NONE ctermbg=24 ctermfg=252 cterm=NONE
hi StatuslineTermNC guibg=#005f87 guifg=#9b9b9b gui=NONE ctermbg=24 ctermfg=237 cterm=NONE
hi VertSplit guibg=#3a3a3a guifg=#3a3a3a gui=NONE ctermbg=237 ctermfg=237 cterm=NONE
hi! link TabLine StatusLineNC
hi! link TabLineFill TabLine
hi! link TabLineSel LessThanNormal
hi WildMenu guibg=#ffff00 guifg=#000000 gui=NONE ctermbg=11 ctermfg=16
hi Folded guibg=#252525 guifg=#909090 gui=NONE ctermbg=235 ctermfg=246 cterm=NONE
hi! link FoldColumn Folded
hi CursorLine guibg=#1c1c1c guifg=NONE ctermbg=234 ctermfg=NONE cterm=NONE 
hi! link CursorColumn CursorLine
hi LineNr guibg=NONE guifg=#909090 ctermbg=NONE ctermfg=246
hi CursorLineNr guibg=#1c1c1c guifg=#d0d0d0 gui=NONE ctermbg=NONE ctermfg=252 cterm=NONE
hi SignColumn guibg=NONE cterm=NONE
hi Pmenu guibg=#262626 guifg=#bcbcbc gui=NONE ctermbg=235 ctermfg=250
hi PmenuSel guibg=#bcbcbc guifg=#262626 gui=NONE ctermbg=250 ctermfg=235
hi PmenuSbar guibg=#3a3a3a ctermbg=237
hi PmenuThumb guibg=#808080 ctermbg=244
hi QuickFixLine guibg=#707070 guifg=#d0d0d0 gui=none ctermbg=3 ctermfg=252
hi! link ColorColumn CursorLine
hi EndOfBuffer guibg=NONE guifg=#444444 ctermbg=0 ctermfg=238
hi MatchParen guibg=#262626 ctermbg=235


"" Syntax

" generic group-names
hi Comment guifg=#4e4e4e gui=NONE ctermfg=239

hi String guifg=#949494 gui=NONE ctermfg=246

hi Statement guifg=#767676 gui=NONE ctermfg=243

hi! link Constant Statement

hi! link Identifier LessThanNormal

hi! link PreProc Statement

hi! link Type LessThanNormal

hi! link Special Statement

hi Underlined guifg=#8a8a8a gui=underline ctermbg=0 ctermfg=245

" The same as comment
" Defined separately to be able to redefine comments without affecting conceal
" Say, you want to make Comments italic, but not Conceal
hi Conceal guifg=#4e4e4e guibg=NONE gui=NONE ctermfg=239 ctermbg=NONE cterm=NONE

" vim
hi link vimFuncName Statement
hi link vimHighlight Statement
hi link vimVar LessThanNormal
hi link vimOper LessThanNormal
hi link vimParenSep LessThanNormal
hi link vimMapModKey Special
hi link vimMapMod vimMapModKey
hi link vimAutoEvent Constant
hi link vimHiAttrib Constant
hi link vimHiCtermColor Constant
hi link vimCommentTitle Constant
hi link vimLet Statement
hi link vimLineComment Comment
hi link vimCommentString Comment
hi link vimOption LessThanNormal
hi link vimSubstPat LessThanNormal
hi link vimCmdSep LessThanNormal

" python
hi link pythonInclude Statement
hi link pythonBuiltin Statement
hi link pythonConditional Statement
hi link pythonRepeat Statement
hi link pythonOperator Statement
hi link pythonException Statement

" ruby
hi link rubyInclude Statement
hi link rubyModule Statement
hi link rubyClass Statement
hi link rubyMacro Statement
hi link rubyStringDelimiter String
hi link rubyDefine Statement
hi link rubyMethodName LessThanNormal

" lua
hi link luaFunction Statement

" elixir
hi link elixirModuleDefine Statement
hi link elixirPrivateDefine Statement
hi link elixirMacroDefine Statement
hi link elixirInclude Statement
hi link elixirDefine Statement
hi link elixirAtom Constant
hi link elixirExUnitMacro Statement
hi link elixirBlockDefinition Statement
hi link elixirFunctionDeclaration LessThanNormal
hi link elixirStringDelimiter String
hi link elixirMapDelimiter Special
hi link elixirOperator Identifier
hi link elixirDocString Comment
hi link elixirDocStringDelimiter Comment
hi link elixirDocTest Identifier
hi link elixirVariable Constant
hi link elixirUnusedVariable Comment
hi link elixirKeyword Statement
hi link elixirId LessThanNormal


" properties
hi link jpropertiesIdentifier Statement
hi link jpropertiesString LessThanNormal

" kotlin
hi link ktStructure Statement
hi link ktModifier Statement

" Go
hi link goDirective Statement
hi link goDeclaration Statement
hi link goType Statement
hi link goDeclType Statement
hi link goSignedInts Statement
hi link goConstants Constant
hi link goBuiltins Statement

" C
hi link cInclude Constant
hi link cPreCondit Constant
hi link cDefine Constant
hi link cType Statement
hi link cStructure Statement
hi link cStorageClass Statement

" Cpp
hi link cppStructure Statement
hi link cppModifier Statement
hi link cppType Statement

" TCL
hi link tclProcCommand Statement
hi link tclVarRef Identifier
hi link tcltkWidgetColor Statement

" xml
hi link xmlTagName Statement
hi link xmlTagN Statement
hi link xmlTag Statement
hi link xmlEndTag Statement
hi link xmlEntity Statement
hi link xmlEntityPunct Statement
hi link xmlAttrib Constant

" html
hi link htmlTagName Statement
hi link htmlTag Statement
hi link htmlTagN Statement
hi link htmlEndTag Statement
hi link htmlArg Statement
hi link htmlSpecialTagName Statement
hi link htmlSpecialChar SpecialChar

" css
hi link cssColor Constant
hi link cssPseudoClassId Identifier
hi link cssClassName Identifier
hi link cssIdentifier Identifier
hi link cssAtRule Identifier

" javascript
hi link javaScriptIdentifier Statement
hi link javaScriptFunction Statement
hi link javaScriptOperator Statement
hi link javaScriptType Identifier
hi link javaScriptNumber Constant

" yaml
hi link yamlBlockMappingKey Statement
hi link yamlKeyValueDelimiter Statement
hi link yamlDocumentStart Comment

" json
hi link jsonKeyword Statement
hi link jsonKeywordMatch Statement
hi link jsonString String
hi link jsonQuote LessThanNormal
hi link yamlKeyValueDelimiter Statement

" sql
hi link sqlKeyword Statement

" java
hi javaCommentTitle guifg=#5e5e5e gui=bold ctermfg=lightgrey
hi link javaExternal Statement
hi link javaScopeDecl Statement
hi link javaClassDecl Statement
hi link javaStorageClass Statement
hi link javaType Statement
hi link javaOperator Statement
hi link javaConstant Constant
hi link javaDocTags String
hi link javaDocParam Constant
hi link javaDocSeeTagParam Constant

" c#
hi link csUnspecifiedStatement Statement
hi link csStorage Statement
hi link csModifier Statement
hi link csClass Statement
hi link csType Statement
hi link csOpSymbols LessThanNormal
hi link csLogicSymbols LessThanNormal

" clojure
hi link clojureMacro Statement
hi link clojureDefine Statement
hi link clojureFunc Statement

" groovy
hi link groovyExternal Statement
hi link groovyExceptions LessThanNormal
hi link groovyJDKbuiltin Statement

" php
hi link phpDocTags String
hi link phpDocCustomTags String
hi link phpStructure Statement
hi link phpInclude Statement
hi link phpStorageClass Statement
hi link phpDefine Statement
hi link phpVarSelector Identifier
hi link phpSpecialFunction Identifier
hi link phpOperator LessThanNormal
hi link phpComparison LessThanNormal
hi link phpType Constant

" dos batch
hi link dosbatchImplicit Statement

" golang
hi goSpaceError guibg=#302020 ctermbg=236

" sh
hi link shSet Statement
hi link shQuote Identifier
hi link shForPP LessThanNormal

" R
hi link rFunction Statement
hi link rType Statement
hi link rOperator LessThanNormal
hi link rAssign LessThanNormal

" asciidoctor
hi link asciidoctorListMarker Special
hi link asciidoctorOption Special
hi link asciidoctorMacro Special
hi link asciidoctorIndented String
" hi asciidoctorTitle guifg=#eeeeee gui=bold ctermfg=255 cterm=bold
hi link asciidoctorH1 asciidoctorTitle
hi link asciidoctorH2 asciidoctorTitle
hi link asciidoctorH3 asciidoctorTitle
hi link asciidoctorH4 asciidoctorTitle
hi link asciidoctorH5 asciidoctorTitle
hi link asciidoctorH6 asciidoctorTitle

" markdown
hi link markdownH1 asciidoctorTitle
hi link markdownH2 asciidoctorTitle
hi link markdownH3 asciidoctorTitle
hi link markdownH4 asciidoctorTitle
hi link markdownH5 asciidoctorTitle
hi link markdownH6 asciidoctorTitle
hi link markdownHeadingDelimiter Special
hi link markdownHeadingRule Special
hi link markdownUrl Underlined
hi link markdownLinkText String
hi link markdownLinkTextDelimiter Identifier
hi link markdownLinkDelimiter Identifier
hi link markdownUrlDelimiter Identifier
hi link markdownListMarker Special
hi link markdownCode Constant
hi link markdownCodeDelimiter markdownCode

"" Diff
hi diffAdd guibg=#294929 ctermbg=22
hi diffChange guibg=#4f4719 ctermbg=58
hi diffText guibg=#2f2f09 guifg=NONE gui=NONE ctermbg=3 ctermfg=NONE
hi diffDelete guibg=#492929 guifg=#707070 gui=NONE ctermbg=52 ctermfg=239

"" fugitive
hi! link fugitiveUntrackedHeading LessThanBold
hi! link fugitiveUnstagedHeading LessThanBold
hi! link fugitiveStagedHeading LessThanBold
hi! link fugitiveHeader LessThanBold
hi! link fugitiveHeading LessThanBold
hi! link gitKeyword LessThanBold
hi link gitIdentityKeyword gitKeyword
hi link fugitiveUntrackedModifier Statement
hi link fugitiveUnstagedModifier Statement
hi link fugitiveStagedModifier Statement
hi link fugitiveModifier Statement
hi link fugitiveHash Statement
hi link fugitiveSymbolicRef Constant
hi link diffIndexLine Identifier
hi link diffFile Title
hi link diffNewFile Title
hi link diffLine fugitiveHeading
hi link diffSubName diffLine
hi diffAdded guibg=NONE guifg=#00c000 ctermfg=114
hi diffRemoved guibg=NONE guifg=#f04749 ctermfg=196
hi link gitCommitSummary Title
hi link gitCommitBranch String
hi link gitCommitHeader fugitiveHeader
hi link gitCommitSelectedType Constant
hi link gitCommitSelectedFile LessThanNormal
hi link gitCommitSelected Comment
hi link gitCommitComment Comment

"" Flog
hi! link flogDate Identifier
hi! link flogHash Constant
hi! link flogAuthor String
hi! link flogGraphEdge0 Special
hi! link flogGraphEdge1 Constant
hi! link flogGraphEdge2 String
hi! link flogGraphEdge3 Statement
hi! link flogGraphEdge4 Special
hi! link flogGraphEdge5 Constant
hi! link flogGraphEdge6 String
hi! link flogGraphEdge7 Statement
hi! link flogGraphEdge8 Special
hi! link flogGraphEdge9 Constant

"" minpac
hi link minpacName Statement
hi link minpacSha Constant
hi link minpacStatus String
hi link minpacStar Special

"" UltiSnips
hi link snipSnippetTrigger LessThanNormal
hi link snipMirror Special
hi link snipTabStop Special

"" help
hi link helpVim Title
hi link helpHeader Title
hi link helpHeadLine Title
hi link helpHyperTextEntry Statement
hi link helpHyperTextJump Underlined
hi link helpExample Constant
hi link helpURL Underlined
hi helpSectionDelim guifg=#909090 ctermfg=245
hi link helpOption Constant

"" netrw
hi link netrwDateSep LessThanNormal
hi link netrwTimeSep LessThanNormal
hi link netrwExe Constant
hi link netrwDir Directory
hi link netrwClassify Directory
hi link netrwTreeBar Delimiter
hi netrwMarkFile guifg=#ffff00 ctermfg=11

"" dirvish
hi link dirvishSuffix String
hi link dirvishColumnHead Comment
hi link dirvishPathHead Comment

"" quickfix
hi link qfFilename Comment
hi link qfSeparator Special
hi link qfLineNr Special

"" CtrlP
hi! link CtrlPMode1 StatusLine
hi! link CtrlPMode2 StatusLine
hi CtrlPMatch guifg=#0087d7 gui=bold ctermfg=33 cterm=bold
hi link CtrlPNoEntries WarningMsg
hi! link CtrlPPrtText LessThanNormal
hi! link CtrlPPrtBase LessThanNormal
hi! link CtrlPBufname Comment
hi! link CtrlPBufferPath Comment
hi! link CtrlPTagKind Statement
hi! link CtrlPTabExtra Comment

"" ALE
hi link ALEWarningSign SignColumn
hi link ALEErrorSign WarningMsg

"" Rest console
hi! link restHost Underlined
hi! link restKeyword Statement

"" vial-http
hi! link vialHttpVerb Statement
hi! link vialHttpHeader Statement

"" Plantuml https://github.com/aklt/plantuml-syntax
hi link plantumlPreProc Statement
hi link plantumlKeyword Statement
hi link plantumlTypeKeyword Statement
hi link plantumlColonLine String
hi link plantumlActivityLabel LessThanNormal
hi link plantumlActivityThing LessThanNormal
hi link plantumlHorizontalArrow Special
hi link plantumlDirectedOrVerticalArrowLR Special
hi link plantumlDirectedOrVerticalArrowRL Special

"" Dart
hi link dartType Statement
hi link dartTypeDef Statement
hi link dartTypeName LessThanNormal
hi link dartCoreClass LessThanNormal
hi link dartStorageClass Statement
hi link dartInterpolation Statement
hi link dartOperator Statement

"" DoOutline
hi link DoOutlineLevel0 Title
hi link DoOutlineLevel1 LessThanNormal
hi link DoOutlineLevel2 String
hi link DoOutlineLevel3 Statement
hi link DoOutlineLevel4 String
hi link DoOutlineLevel5 Statement
hi link DoOutlineLevel6 String
hi link DoOutlineLevel7 Statement
hi link DoOutlineLevel8 String
hi link DoOutlineLevel9 Statement

"" vim-lsp
hi LspErrorHighlight gui=undercurl guisp=red ctermfg=red cterm=bold
hi LspWarningHighlight gui=undercurl guisp=yellow ctermfg=yellow

"" LeaderF
hi link Lf_hl_bufDirname Comment
hi link Lf_hl_funcDirname Comment
hi link Lf_hl_rgFilename Comment
hi link Lf_hl_rgTagFile Comment
hi link Lf_hl_tagFile Comment
hi link Lf_hl_tagType Comment
hi link Lf_hl_tagKeyword Comment
hi link Lf_hl_buftagKind Comment
hi link Lf_hl_buftagScopeType Comment
hi link Lf_hl_buftagScope Comment
hi link Lf_hl_buftagDirname Comment
hi link Lf_hl_buftagCode Comment
hi link Lf_hl_helpTagfile Comment
hi link Lf_hl_gtagsFileName Comment
hi Lf_hl_cursorline guifg=#bcbcbc ctermfg=250 

" Leaderf "chrome"
hi Lf_hl_stlName guibg=#3c3c3c guifg=#909090 gui=bold ctermbg=241 ctermfg=245
hi Lf_hl_stlMode guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlCategory guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlCwd guibg=#5c5c5c guifg=#d0d0d0 gui=NONE ctermbg=241 ctermfg=252
hi Lf_hl_stlSeparator0 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlSeparator1 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlSeparator2 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlSeparator3 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlSeparator4 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlSeparator5 guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlLineInfo guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=252
hi Lf_hl_stlNameOnlyMode guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlRegexMode guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlFullPathMode guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlFuzzyMode guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=245
hi Lf_hl_stlTotal guibg=#3c3c3c guifg=#909090 gui=NONE ctermbg=241 ctermfg=252
hi Lf_hl_stlBlank guibg=#5c5c5c guifg=#909090 gui=NONE ctermbg=241 ctermfg=252

hi! link Lf_hl_popup_window LessThanNormal
hi! link Lf_hl_popup_inputMode StatusLine 
hi! link Lf_hl_popup_inputText StatusLineNC
hi! link Lf_hl_popup_prompt StatusLine
hi! link Lf_hl_popup_spin StatusLine
hi! link Lf_hl_popup_mode StatusLine 
hi! link Lf_hl_popup_category StatusLine
hi! link Lf_hl_popup_cwd StatusLine
hi! link Lf_hl_popup_separator0 StatusLine
hi! link Lf_hl_popup_separator1 StatusLine
hi! link Lf_hl_popup_separator2 StatusLine
hi! link Lf_hl_popup_separator3 StatusLine
hi! link Lf_hl_popup_separator4 StatusLine
hi! link Lf_hl_popup_separator5 StatusLine
hi! link Lf_hl_popup_lineInfo StatusLine
hi! link Lf_hl_popup_nameOnlyMode StatusLine 
hi! link Lf_hl_popup_regexMode StatusLine 
hi! link Lf_hl_popup_fullPathMode StatusLine 
hi! link Lf_hl_popup_fuzzyMode StatusLine 
hi! link Lf_hl_popup_total StatusLine 
hi! link Lf_hl_popup_blank StatusLine
