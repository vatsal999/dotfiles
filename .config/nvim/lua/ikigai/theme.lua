local ikigai = require("ikigai.colors")

local theme = {}

theme.loadSyntax = function()
	-- Syntax highlight groups

	local syntax = {
		Type = { fg = ikigai.orange, style = "bold" }, -- int, long, char, etc.
		StorageClass = { fg = ikigai.yellow }, -- static, register, volatile, etc.
		Structure = { fg = ikigai.yellow }, -- struct, union, enum, etc.
		Constant = { fg = ikigai.dessert }, -- any constant
		Character = { fg = ikigai.blue }, -- any character constant: 'c', '\n'
		Number = { fg = ikigai.dessert }, -- a number constant: 5
		Boolean = { fg = ikigai.dessert }, -- a boolean constant: TRUE, false
		Float = { fg = ikigai.dessert }, -- a floating point constant: 2.3e10
		Statement = { fg = ikigai.green }, -- any statement
		Label = { fg = ikigai.green }, -- case, default, etc.
		Operator = { fg = ikigai.yellow }, -- sizeof", "+", "*", etc.
		Exception = { fg = ikigai.red }, -- try, catch, throw
		PreProc = { fg = ikigai.red }, -- generic Preprocessor
		Include = { fg = ikigai.blue }, -- preprocessor #include
		Define = { fg = ikigai.red }, -- preprocessor #define
		Macro = { fg = ikigai.red }, -- same as Define
		Typedef = { fg = ikigai.yellow }, -- A typedef
		PreCondit = { fg = ikigai.orange }, -- preprocessor #if, #else, #endif, etc.
		Special = { fg = ikigai.green }, -- any special symbol
		SpecialChar = { fg = ikigai.green }, -- special character in a constant
		Tag = { fg = ikigai.purple }, -- you can use CTRL-] on this
		Delimiter = { fg = ikigai.orange }, -- character that needs attention like , or .
		SpecialComment = { fg = ikigai.purple }, -- special things inside a comment
		Debug = { fg = ikigai.ikigai11_gui }, -- debugging statements
		Underlined = { fg = ikigai.purple, bg = ikigai.none, style = "underline" }, -- text that stands out, HTML links
		Ignore = { fg = ikigai.ikigai1_gui }, -- left blank, hidden
		Error = { fg = ikigai.red, bg = ikigai.none, style = "bold,underline" }, -- any erroneous construct
		Todo = { fg = ikigai.yellow, bg = ikigai.none, style = "bold,italic" }, -- anything that needs extra attention; mostly the keywords TODO FIXME and XXX
		Conceal = { fg = ikigai.none, bg = ikigai.ikigai0_gui },

		htmlLink = { fg = ikigai.ikigai14_gui, style = "underline" },
		htmlH1 = { fg = ikigai.ikigai8_gui, style = "bold" },
		htmlH2 = { fg = ikigai.ikigai11_gui, style = "bold" },
		htmlH3 = { fg = ikigai.ikigai14_gui, style = "bold" },
		htmlH4 = { fg = ikigai.ikigai15_gui, style = "bold" },
		htmlH5 = { fg = ikigai.ikigai9_gui, style = "bold" },
		markdownH1 = { fg = ikigai.ikigai8_gui, style = "bold" },
		markdownH2 = { fg = ikigai.ikigai11_gui, style = "bold" },
		markdownH3 = { fg = ikigai.ikigai14_gui, style = "bold" },
		markdownH1Delimiter = { fg = ikigai.ikigai8_gui },
		markdownH2Delimiter = { fg = ikigai.ikigai11_gui },
		markdownH3Delimiter = { fg = ikigai.ikigai14_gui },
	}

	-- Italic comments
	if vim.g.ikigai_italic == false then
		syntax.Comment = { fg = ikigai.brightbg2 } -- normal comments
		syntax.Conditional = { fg = ikigai.ikigai9_gui } -- normal if, then, else, endif, switch, etc.
		syntax.Function = { fg = ikigai.yellow } -- normal function names
		syntax.Identifier = { fg = ikigai.yellow } -- any variable name
		syntax.Keyword = { fg = ikigai.red } -- normal for, do, while, etc.
		syntax.Repeat = { fg = ikigai.ikigai9_gui } -- normal any other keyword
		syntax.String = { fg = ikigai.green } -- any string
	else
		syntax.Comment = { fg = ikigai.brightbg2 , bg = ikigai.none, style = "italic" } -- italic comments
		syntax.Conditional = { fg = ikigai.ikigai9_gui, bg = ikigai.none, style = "italic" } -- italic if, then, else, endif, switch, etc.
		syntax.Function = { fg = ikigai.yellow, bg = ikigai.none, style = "italic" } -- italic funtion names
		syntax.Identifier = { fg = ikigai.yellow, bg = ikigai.none, style = "italic" } -- any variable name
		syntax.Keyword = { fg = ikigai.red, bg = ikigai.none, style = "italic" } -- italic for, do, while, etc.
		syntax.Repeat = { fg = ikigai.ikigai9_gui, bg = ikigai.none, style = "italic" } -- italic any other keyword
		syntax.String = { fg = ikigai.green, bg = ikigai.none, style = "italic" } -- any string
	end

	return syntax
end

theme.loadEditor = function()
	-- Editor highlight groups

	local editor = {
		NormalFloat = { fg = ikigai.fg, bg = ikigai.brightbg }, -- normal text and background color
		FloatBorder = { fg = ikigai.ikigai4_gui, bg = ikigai.float }, -- normal text and background color
		ColorColumn = { fg = ikigai.none, bg = ikigai.darkbg }, --  used for the columns set with 'colorcolumn'
		Conceal = { fg = ikigai.ikigai1_gui }, -- placeholder characters substituted for concealed text (see 'conceallevel')
		Cursor = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "reverse" }, -- the character under the cursor
		CursorIM = { fg = ikigai.ikigai5_gui, bg = ikigai.none, style = "reverse" }, -- like Cursor, but used when in IME mode
		Directory = { fg = ikigai.ikigai7_gui, bg = ikigai.none }, -- directory names (and other special names in listings)
		DiffAdd = { fg = ikigai.ikigai14_gui, bg = ikigai.none, style = "reverse" }, -- diff mode: Added line
		DiffChange = { fg = ikigai.ikigai13_gui, bg = ikigai.none, style = "reverse" }, --  diff mode: Changed line
		DiffDelete = { fg = ikigai.ikigai11_gui, bg = ikigai.none, style = "reverse" }, -- diff mode: Deleted line
		DiffText = { fg = ikigai.ikigai15_gui, bg = ikigai.none, style = "reverse" }, -- diff mode: Changed text within a changed line
		EndOfBuffer = { fg = ikigai.bg},
		ErrorMsg = { fg = ikigai.none },
		Folded = { fg = ikigai.ikigai3_gui_bright, bg = ikigai.none, style = "italic" },
		FoldColumn = { fg = ikigai.ikigai7_gui },
		IncSearch = { fg = ikigai.bg, bg = ikigai.yellow },
		LineNr = { fg = ikigai.brightbg2 },
		CursorLineNr = { fg = ikigai.fg, bg = ikigai.brightbg },
		MatchParen = { fg = ikigai.ikigai15_gui, bg = ikigai.none, style = "bold" },
		ModeMsg = { fg = ikigai.ikigai4_gui },
		MoreMsg = { fg = ikigai.ikigai4_gui },
		NonText = { fg = ikigai.ikigai1_gui },
		Pmenu = { fg = ikigai.greycomments, bg = ikigai.brightbg },
		PmenuSel = { fg = ikigai.fg, bg = ikigai.brightbg2 , style = "bold" },
		PmenuSbar = { fg = ikigai.brightbg, bg = ikigai.brightbg },
		PmenuThumb = { fg = ikigai.brightbg, bg = ikigai.brightbg2 },
		Question = { fg = ikigai.ikigai14_gui },
		QuickFixLine = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "reverse" },
		qfLineNr = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "reverse" },
		Search = { fg = ikigai.ikigai10_gui, bg = ikigai.ikigai6_gui, style = "reverse" },
		SpecialKey = { fg = ikigai.ikigai9_gui },
		SpellBad = { fg = ikigai.ikigai11_gui, bg = ikigai.none, style = "italic,undercurl" },
		SpellCap = { fg = ikigai.ikigai7_gui, bg = ikigai.none, style = "italic,undercurl" },
		SpellLocal = { fg = ikigai.ikigai8_gui, bg = ikigai.none, style = "italic,undercurl" },
		SpellRare = { fg = ikigai.ikigai9_gui, bg = ikigai.none, style = "italic,undercurl" },

		StatusLine = { fg = ikigai.fg, bg = ikigai.bg },
		StatusLineNC = { fg = ikigai.greycomments, bg = ikigai.darkbg },
		StatusLineTerm = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai2_gui },
		StatusLineTermNC = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui },
        StatusInsert = { fg = ikigai.green, bg = ikigai.bg},
        StatusCommand = { fg = ikigai.yellow, bg = ikigai.bg, style = "bold"},
        StatusVisual = { fg = ikigai.dessert, bg = ikigai.bg , style = "bold"},


		TabLineFill = { fg = ikigai.ikigai4_gui, bg = ikigai.none },
		TablineSel = { fg = ikigai.ikigai1_gui, bg = ikigai.ikigai9_gui },
		Tabline = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui },
		Title = { fg = ikigai.ikigai14_gui, bg = ikigai.none, style = "bold" },
		Visual = { fg = ikigai.none, bg = ikigai.brightbg },
		VisualNOS = { fg = ikigai.none, bg = ikigai.ikigai2_gui },
		WarningMsg = { fg = ikigai.ikigai15_gui },
		WildMenu = { fg = ikigai.ikigai12_gui, bg = ikigai.none, style = "bold" },
		CursorColumn = { fg = ikigai.none, bg = ikigai.brightbg },
		CursorLine = { fg = ikigai.none, bg = ikigai.brightbg },
		ToolbarLine = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui },
		ToolbarButton = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "bold" },
		NormalMode = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "reverse" },
		InsertMode = { fg = ikigai.ikigai14_gui, bg = ikigai.none, style = "reverse" },
		ReplacelMode = { fg = ikigai.ikigai11_gui, bg = ikigai.none, style = "reverse" },
		VisualMode = { fg = ikigai.ikigai9_gui, bg = ikigai.none, style = "reverse" },
		CommandMode = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "reverse" },
		Warnings = { fg = ikigai.ikigai15_gui },

		healthError = { fg = ikigai.ikigai11_gui },
		healthSuccess = { fg = ikigai.ikigai14_gui },
		healthWarning = { fg = ikigai.ikigai15_gui },

		-- dashboard
		DashboardShortCut = { fg = ikigai.ikigai7_gui },
		DashboardHeader = { fg = ikigai.ikigai9_gui },
		DashboardCenter = { fg = ikigai.ikigai8_gui },
		DashboardFooter = { fg = ikigai.ikigai14_gui, style = "italic" },

		-- BufferLine
		BufferLineIndicatorSelected = { fg = ikigai.brightbg2 },
		BufferLineFill = { bg = ikigai.bg },
	}

	-- Options:

	--Set transparent background
	if vim.g.ikigai_disable_background then
		editor.Normal = { fg = ikigai.fg, bg = ikigai.none } -- normal text and background color
		editor.SignColumn = { fg = ikigai.fg, bg = ikigai.none }
	else
		editor.Normal = { fg = ikigai.fg, bg = ikigai.bg } -- normal text and background color
		editor.SignColumn = { fg = ikigai.fg, bg = ikigai.bg }
	end

	-- Remove window split borders
	if vim.g.ikigai_borders then
		editor.VertSplit = { fg = ikigai.grey }
	else
		editor.VertSplit = { fg = ikigai.bg }
	end

	return editor
end

theme.loadTerminal = function()
	vim.g.terminal_color_0 = ikigai.bg
	vim.g.terminal_color_1 = ikigai.red
	vim.g.terminal_color_2 = ikigai.green
	vim.g.terminal_color_3 = ikigai.yellow
	vim.g.terminal_color_4 = ikigai.blue
	vim.g.terminal_color_5 = ikigai.purple
	vim.g.terminal_color_6 = ikigai.cyan
	vim.g.terminal_color_7 = ikigai.fg
	vim.g.terminal_color_8 = ikigai.darkbg
	vim.g.terminal_color_9 = ikigai.red
	vim.g.terminal_color_10 = ikigai.green
	vim.g.terminal_color_11 = ikigai.yellow
	vim.g.terminal_color_12 = ikigai.blue
	vim.g.terminal_color_13 = ikigai.purple
	vim.g.terminal_color_14 = ikigai.cyan
	vim.g.terminal_color_15 = ikigai.fg
end

theme.loadTreeSitter = function()
	-- TreeSitter highlight groups

	local treesitter = {
		TSAnnotation = { fg = ikigai.ikigai12_gui }, -- For C++/Dart attributes, annotations thatcan be attached to the code to denote some kind of meta information.
		TSConstructor = { fg = ikigai.ikigai9_gui }, -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
		TSConstant = { fg = ikigai.dessert }, -- For constants
		TSFloat = { fg = ikigai.dessert }, -- For floats
		TSNumber = { fg = ikigai.dessert }, -- For all number

		TSAttribute = { fg = ikigai.ikigai15_gui }, -- (unstable) TODO: docs
		TSVariable = { fg = ikigai.fg }, -- Any variable name that does not have another highlight.
		TSVariableBuiltin = { fg = ikigai.ikigai4_gui, style = "bold" },
		TSBoolean = { fg = ikigai.dessert, style = "bold" }, -- For booleans.
		TSConstBuiltin = { fg = ikigai.ikigai7_gui, style = "bold" }, -- For constant that are built in the language: `nil` in Lua.
		TSConstMacro = { fg = ikigai.ikigai7_gui, style = "bold" }, -- For constants that are defined by macros: `NULL` in C.
		TSError = { fg = ikigai.brightbg2 }, -- For syntax/parser errors.
		TSException = { fg = ikigai.ikigai15_gui }, -- For exception related keywords.
		TSFuncMacro = { fg = ikigai.ikigai7_gui }, -- For macro defined fuctions (calls and definitions): each `macro_rules` in Rust.
		TSInclude = { fg = ikigai.blue }, -- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require` in Lua.
		TSLabel = { fg = ikigai.ikigai15_gui }, -- For labels: `label:` in C and `:label:` in Lua.
		TSOperator = { fg = ikigai.dessert }, -- For any operator: `+`, but also `->` and `*` in C.
		TSParameter = { fg = ikigai.blue }, -- For parameters of a function.
		TSParameterReference = { fg = ikigai.ikigai10_gui }, -- For references to parameters of a function.
		TSPunctDelimiter = { fg = ikigai.fg }, -- For delimiters ie: `.`
		TSPunctBracket = { fg = ikigai.fg }, -- For brackets and parens.
		TSPunctSpecial = { fg = ikigai.ikigai8_gui }, -- For special punctutation that does not fall in the catagories before.
		TSSymbol = { fg = ikigai.ikigai15_gui }, -- For identifiers referring to symbols or atoms.
		TSType = { fg = ikigai.orange }, -- For types.
		TSTypeBuiltin = { fg = ikigai.ikigai9_gui }, -- For builtin types.
		TSTag = { fg = ikigai.orange }, -- Tags like html tag names.
		TSTagDelimiter = { fg = ikigai.ikigai15_gui }, -- Tag delimiter like `<` `>` `/`
		TSText = { fg = ikigai.fg }, -- For strings consideikigai11_gui text in a markup language.
		TSTextReference = { fg = ikigai.ikigai15_gui }, -- FIXME
		TSEmphasis = { fg = ikigai.ikigai10_gui }, -- For text to be represented with emphasis.
		TSUnderline = { fg = ikigai.ikigai4_gui, bg = ikigai.none, style = "underline" }, -- For text to be represented with an underline.
		TSTitle = { fg = ikigai.ikigai10_gui, bg = ikigai.none, style = "bold" }, -- Text that is part of a title.
		TSLiteral = { fg = ikigai.ikigai4_gui }, -- Literal text.
		TSURI = { fg = ikigai.ikigai14_gui }, -- Any URI like a link or email.
		TSAnnotation = { fg = ikigai.ikigai11_gui }, -- For C++/Dart attributes, annotations that can be attached to the code to denote some kind of meta information.
	}

	if vim.g.ikigai_italic == false then
		-- Comments
		treesitter.TSComment = { fg = ikigai.brightbg2 }
		-- Conditionals
		treesitter.TSConditional = { fg = ikigai.blue } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = ikigai.yellow } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = ikigai.ikigai7_gui } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = ikigai.ikigai8_gui }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = ikigai.ikigai4_gui } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = ikigai.ikigai4_gui } -- For fields in literals
		treesitter.TSProperty = { fg = ikigai.ikigai10_gui } -- Same as `TSField`
		-- Language keywords
		treesitter.TSKeyword = { fg = ikigai.ikigai9_gui } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = ikigai.ikigai8_gui }
		treesitter.TSKeywordReturn = { fg = ikigai.ikigai8_gui }
		treesitter.TSKeywordOperator = { fg = ikigai.ikigai8_gui }
		treesitter.TSRepeat = { fg = ikigai.ikigai9_gui } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = ikigai.green } -- For strings.
		treesitter.TSStringRegex = { fg = ikigai.purple } -- For regexes.
		treesitter.TSStringEscape = { fg = ikigai.purple } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = ikigai.ikigai14_gui } -- For characters.
	else
		-- Comments
		treesitter.TSComment = { fg = ikigai.brightbg2, style = "italic" }
		-- Conditionals
		treesitter.TSConditional = { fg = ikigai.blue, style = "italic" } -- For keywords related to conditionnals.
		-- Function names
		treesitter.TSFunction = { fg = ikigai.yellow, style = "italic" } -- For fuction (calls and definitions).
		treesitter.TSMethod = { fg = ikigai.ikigai7_gui, style = "italic" } -- For method calls and definitions.
		treesitter.TSFuncBuiltin = { fg = ikigai.ikigai8_gui, style = "italic" }
		-- Namespaces and property accessors
		treesitter.TSNamespace = { fg = ikigai.yellow, style = "italic" } -- For identifiers referring to modules and namespaces.
		treesitter.TSField = { fg = ikigai.ikigai4_gui, style = "italic" } -- For fields.
		treesitter.TSProperty = { fg = ikigai.ikigai10_gui, style = "italic" } -- Same as `TSField`, but when accessing, not declaring.
		-- Language keywords
		treesitter.TSKeyword = { fg = ikigai.ikigai9_gui, style = "italic" } -- For keywords that don't fall in other categories.
		treesitter.TSKeywordFunction = { fg = ikigai.ikigai8_gui, style = "italic" }
		treesitter.TSKeywordReturn = { fg = ikigai.ikigai8_gui, style = "italic" }
		treesitter.TSKeywordOperator = { fg = ikigai.ikigai8_gui, style = "italic" }
		treesitter.TSRepeat = { fg = ikigai.ikigai9_gui, style = "italic" } -- For keywords related to loops.
		-- Strings
		treesitter.TSString = { fg = ikigai.green, style = "italic" } -- For strings.
		treesitter.TSStringRegex = { fg = ikigai.purple, style = "italic" } -- For regexes.
		treesitter.TSStringEscape = { fg = ikigai.purple, style = "italic" } -- For escape characters within a string.
		treesitter.TSCharacter = { fg = ikigai.ikigai14_gui, style = "italic" } -- For characters.
	end

	return treesitter
end

theme.loadLSP = function()
	-- Lsp highlight groups

	local lsp = {
		LspDiagnosticsDefaultError = { fg = ikigai.red }, -- used for "Error" diagnostic virtual text
		LspDiagnosticsSignError = { fg = ikigai.red }, -- used for "Error" diagnostic signs in sign column
		LspDiagnosticsFloatingError = { fg = ikigai.red }, -- used for "Error" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextError = { fg = ikigai.brightbg2 }, -- Virtual text "Error"
		LspDiagnosticsUnderlineError = { style = "undercurl", sp = ikigai.red }, -- used to underline "Error" diagnostics.
		LspDiagnosticsDefaultWarning = { fg = ikigai.orange }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsSignWarning = { fg = ikigai.orange }, -- used for "Warning" diagnostic signs in sign column
		LspDiagnosticsFloatingWarning = { fg = ikigai.orange }, -- used for "Warning" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextWarning = { fg = ikigai.brightbg2 }, -- Virtual text "Warning"
		LspDiagnosticsUnderlineWarning = { style = "undercurl", sp = ikigai.orange }, -- used to underline "Warning" diagnostics.
		LspDiagnosticsDefaultInformation = { fg = ikigai.yellow }, -- used for "Information" diagnostic virtual text
		LspDiagnosticsSignInformation = { fg = ikigai.yellow }, -- used for "Information" diagnostic signs in sign column
		LspDiagnosticsFloatingInformation = { fg = ikigai.yellow }, -- used for "Information" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextInformation = { fg = ikigai.yellow }, -- Virtual text "Information"
		LspDiagnosticsUnderlineInformation = { style = "undercurl", sp = ikigai.yellow }, -- used to underline "Information" diagnostics.
		LspDiagnosticsDefaultHint = { fg = ikigai.blue }, -- used for "Hint" diagnostic virtual text
		LspDiagnosticsSignHint = { fg = ikigai.blue }, -- used for "Hint" diagnostic signs in sign column
		LspDiagnosticsFloatingHint = { fg = ikigai.blue }, -- used for "Hint" diagnostic messages in the diagnostics float
		LspDiagnosticsVirtualTextHint = { fg = ikigai.blue }, -- Virtual text "Hint"
		LspDiagnosticsUnderlineHint = { style = "undercurl", sp = ikigai.blue }, -- used to underline "Hint" diagnostics.
		LspReferenceText = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui }, -- used for highlighting "text" references
		LspReferenceRead = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui }, -- used for highlighting "read" references
		LspReferenceWrite = { fg = ikigai.ikigai4_gui, bg = ikigai.ikigai1_gui }, -- used for highlighting "write" references

		DiagnosticError = { link = "LspDiagnosticsDefaultError" },
		DiagnosticWarn = { link = "LspDiagnosticsDefaultWarning" },
		DiagnosticInfo = { link = "LspDiagnosticsDefaultInformation" },
		DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
		DiagnosticVirtualTextWarn = { link = "LspDiagnosticsVirtualTextWarning" },
		DiagnosticUnderlineWarn = { link = "LspDiagnosticsUnderlineWarning" },
		DiagnosticFloatingWarn = { link = "LspDiagnosticsFloatingWarning" },
		DiagnosticSignWarn = { link = "LspDiagnosticsSignWarning" },
		DiagnosticVirtualTextError = { link = "LspDiagnosticsVirtualTextError" },
		DiagnosticUnderlineError = { link = "LspDiagnosticsUnderlineError" },
		DiagnosticFloatingError = { link = "LspDiagnosticsFloatingError" },
		DiagnosticSignError = { link = "LspDiagnosticsSignError" },
		DiagnosticVirtualTextInfo = { link = "LspDiagnosticsVirtualTextInformation" },
		DiagnosticUnderlineInfo = { link = "LspDiagnosticsUnderlineInformation" },
		DiagnosticFloatingInfo = { link = "LspDiagnosticsFloatingInformation" },
		DiagnosticSignInfo = { link = "LspDiagnosticsSignInformation" },
		DiagnosticVirtualTextHint = { link = "LspDiagnosticsVirtualTextHint" },
		DiagnosticUnderlineHint = { link = "LspDiagnosticsUnderlineHint" },
		DiagnosticFloatingHint = { link = "LspDiagnosticsFloatingHint" },
		DiagnosticSignHint = { link = "LspDiagnosticsSignHint" },
	}

	return lsp
end

theme.loadPlugins = function()
	-- Plugins highlight groups

	local plugins = {

		-- LspTrouble
		-- LspTroubleText = { fg = ikigai.ikigai4_gui },
		-- LspTroubleCount = { fg = ikigai.ikigai9_gui, bg = ikigai.ikigai10_gui },
		-- LspTroubleNormal = { fg = ikigai.ikigai4_gui, bg = ikigai.sidebar },

		-- Diff
		-- diffAdded = { fg = ikigai.ikigai14_gui },
		-- diffRemoved = { fg = ikigai.ikigai11_gui },
		-- diffChanged = { fg = ikigai.ikigai15_gui },
		-- diffOldFile = { fg = ikigai.yelow },
		-- diffNewFile = { fg = ikigai.ikigai12_gui },
		-- diffFile = { fg = ikigai.ikigai7_gui },
		-- diffLine = { fg = ikigai.ikigai3_gui },
		-- diffIndexLine = { fg = ikigai.ikigai9_gui },

		-- Neogit
		-- NeogitBranch = { fg = ikigai.ikigai10_gui },
		-- NeogitRemote = { fg = ikigai.ikigai9_gui },
		-- NeogitHunkHeader = { fg = ikigai.ikigai8_gui },
		-- NeogitHunkHeaderHighlight = { fg = ikigai.ikigai8_gui, bg = ikigai.ikigai1_gui },
		-- NeogitDiffContextHighlight = { bg = ikigai.ikigai1_gui },
		-- NeogitDiffDeleteHighlight = { fg = ikigai.ikigai11_gui, style = "reverse" },
		-- NeogitDiffAddHighlight = { fg = ikigai.ikigai14_gui, style = "reverse" },

		-- GitGutter
		-- GitGutterAdd = { fg = ikigai.ikigai14_gui }, -- diff mode: Added line |diff.txt|
		-- GitGutterChange = { fg = ikigai.ikigai15_gui }, -- diff mode: Changed line |diff.txt|
		-- GitGutterDelete = { fg = ikigai.ikigai11_gui }, -- diff mode: Deleted line |diff.txt|

		-- GitSigns
		-- GitSignsAdd = { fg = ikigai.ikigai14_gui }, -- diff mode: Added line |diff.txt|
		-- GitSignsAddNr = { fg = ikigai.ikigai14_gui }, -- diff mode: Added line |diff.txt|
		-- GitSignsAddLn = { fg = ikigai.ikigai14_gui }, -- diff mode: Added line |diff.txt|
		-- GitSignsChange = { fg = ikigai.ikigai15_gui }, -- diff mode: Changed line |diff.txt|
		-- GitSignsChangeNr = { fg = ikigai.ikigai15_gui }, -- diff mode: Changed line |diff.txt|
		-- GitSignsChangeLn = { fg = ikigai.ikigai15_gui }, -- diff mode: Changed line |diff.txt|
		-- GitSignsDelete = { fg = ikigai.ikigai11_gui }, -- diff mode: Deleted line |diff.txt|
		-- GitSignsDeleteNr = { fg = ikigai.ikigai11_gui }, -- diff mode: Deleted line |diff.txt|
		-- GitSignsDeleteLn = { fg = ikigai.ikigai11_gui }, -- diff mode: Deleted line |diff.txt|

		-- Telescope
        TelescopeNormal = { bg = ikigai.darkbg },
        TelescopeBorder = { fg = ikigai.darkbg, bg = ikigai. darkbg },
        TelescopePromptNormal = { fg = ikigai.fg, bg = ikigai.brightbg},
		TelescopePromptBorder = { fg = ikigai.brightbg, bg = ikigai.brightbg },
        TelescopePromptPrefix = { fg = ikigai.dessert, bg = ikigai.darkbg},
        TelescopePromptTitle = { fg = ikigai.yellow, bg = ikigai.brightbg },
        TelescopePreviewTitle = { fg = ikigai.grey, bg = ikigai.darkbg},
		-- TelescopeSelectionCaret = { fg = ikigai.yellow },
		-- TelescopeSelection = { fg = ikigai.yellow },
		-- TelescopeMatching = { fg = ikigai.dessert },

		-- NvimTree
        NvimTreeNormal = { fg = ikigai.fg , bg = ikigai.darkbg },
		NvimTreeRootFolder = { fg = ikigai.brightbg2, style = "bold" },
		NvimTreeGitDirty = { fg = ikigai.yellow },
		NvimTreeGitNew = { fg = ikigai.blue },
		NvimTreeImageFile = { fg = ikigai.white },
		NvimTreeExecFile = { fg = ikigai.yellow },
		NvimTreeSpecialFile = { fg = ikigai.red, style = "underline" },
		NvimTreeFolderName = { fg = ikigai.fg },
		NvimTreeEmptyFolderName = { fg = ikigai.fg },
        NvimTreeOpenedFolderName = { fg = ikigai.fg},
		NvimTreeFolderIcon = { fg = ikigai.brightbg2 },
		NvimTreeIndentMarker = { fg = ikigai.brightbg2 },
		LspDiagnosticsError = { fg = ikigai.red },
		LspDiagnosticsWarning = { fg = ikigai.orange },
		LspDiagnosticsInformation = { fg = ikigai.yellow },
		LspDiagnosticsHint = { fg = ikigai.blue },

		-- WhichKey
		-- WhichKey = { fg = ikigai.ikigai4_gui, style = "bold" },
		-- WhichKeyGroup = { fg = ikigai.ikigai4_gui },
		-- WhichKeyDesc = { fg = ikigai.ikigai7_gui, style = "italic" },
		-- WhichKeySeperator = { fg = ikigai.ikigai4_gui },
		-- WhichKeyFloating = { bg = ikigai.float },
		-- WhichKeyFloat = { bg = ikigai.float },

		-- LspSaga
		-- DiagnosticError = { fg = ikigai.ikigai11_gui },
		-- DiagnosticWarning = { fg = ikigai.ikigai15_gui },
		-- DiagnosticInformation = { fg = ikigai.ikigai10_gui },
		-- DiagnosticHint = { fg = ikigai.ikigai9_gui },
		-- DiagnosticTruncateLine = { fg = ikigai.ikigai4_gui },
		-- LspFloatWinNormal = { bg = ikigai.ikigai2_gui },
		-- LspFloatWinBorder = { fg = ikigai.ikigai9_gui },
		-- LspSagaBorderTitle = { fg = ikigai.ikigai8_gui },
		-- LspSagaHoverBorder = { fg = ikigai.ikigai10_gui },
		-- LspSagaRenameBorder = { fg = ikigai.ikigai14_gui },
		-- LspSagaDefPreviewBorder = { fg = ikigai.ikigai14_gui },
		-- LspSagaCodeActionBorder = { fg = ikigai.ikigai7_gui },
		-- LspSagaFinderSelection = { fg = ikigai.ikigai14_gui },
		-- LspSagaCodeActionTitle = { fg = ikigai.ikigai10_gui },
		-- LspSagaCodeActionContent = { fg = ikigai.ikigai9_gui },
		-- LspSagaSignatureHelpBorder = { fg = ikigai.ikigai13_gui },
		-- ReferencesCount = { fg = ikigai.ikigai9_gui },
		-- DefinitionCount = { fg = ikigai.ikigai9_gui },
		-- DefinitionIcon = { fg = ikigai.ikigai7_gui },
		-- ReferencesIcon = { fg = ikigai.ikigai7_gui },
		-- TargetWord = { fg = ikigai.ikigai8_gui },

		-- Cmp
        CmpItemAbbr = { fg = ikigai.grey2 }, -- e.g. [Snippets]
		CmpItemKind = { fg = ikigai.fg }, -- kind icons
		CmpItemMenu = { fg = ikigai.fg },
		CmpItemAbbrMatch = { fg = ikigai.fg, style = "bold" },
		CmpItemAbbrMatchFuzzy = { fg = ikigai.fg, style = "bold" },

        CmpItemKindText = { fg = ikigai.greycomments },
        CmpItemKindFile = { fg = ikigai.greycomments },
        CmpItemKindFolder = { fg = ikigai.greycomments },
        CmpItemKindFunction = { fg = ikigai.blue },
        CmpItemKindClass = { fg = ikigai.yellow },
        CmpItemKindConstant = { fg = ikigai.yellow },
        CmpItemKindVariable = { fg = ikigai.yellow },
        CmpItemKindInterface = { fg = ikigai.yellow },
        CmpItemKindModule = { fg = ikigai.red },
        CmpItemKindSnippet = { fg = ikigai.dessert },

		-- Indent Blankline
		IndentBlanklineChar = { fg = ikigai.grey },
		IndentBlanklineContextChar = { fg = ikigai.fg },

		-- Statusline
		-- StatusLineDull = { fg = ikigai.ikigai3_gui, bg = ikigai.ikigai1_gui },
		-- StatusLineAccent = { fg = ikigai.ikigai0_gui, bg = ikigai.ikigai13_gui },
	}
	-- Options:

	-- Disable nvim-tree background
	if vim.g.ikigai_disable_background then
		plugins.NvimTreeNormal = { fg = ikigai.fg, bg = ikigai.none }
	else
		plugins.NvimTreeNormal = { fg = ikigai.fg, bg = ikigai.darkbg }
	end

	-- if vim.g.ikigai_enable_sidebar_background then
	-- 	plugins.NvimTreeNormal = { fg = ikigai.fg, bg = ikigai.sidebar }
	-- else
	-- 	plugins.NvimTreeNormal = { fg = ikigai.fg, bg = ikigai.none }
	-- end

	return plugins
end

return theme
