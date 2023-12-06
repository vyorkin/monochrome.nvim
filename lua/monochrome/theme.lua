local M = {}

local colors = require("monochrome.colors")

M.colors = colors

function M.terminal_color()
	vim.g.terminal_color_0 = colors.gray7
	vim.g.terminal_color_1 = colors.red
	vim.g.terminal_color_2 = colors.blue
	vim.g.terminal_color_3 = colors.fg
	vim.g.terminal_color_4 = colors.white
	vim.g.terminal_color_5 = colors.fg
	vim.g.terminal_color_6 = colors.fg
	vim.g.terminal_color_7 = colors.white
	vim.g.terminal_color_8 = colors.gray7
	vim.g.terminal_color_9 = colors.red
	vim.g.terminal_color_10 = colors.blue
	vim.g.terminal_color_11 = colors.fg
	vim.g.terminal_color_12 = colors.white
	vim.g.terminal_color_13 = colors.fg
	vim.g.terminal_color_14 = colors.fg
	vim.g.terminal_color_15 = colors.white
end

function M.fzf_color()
	vim.g.fzf_colors = {
		fg = { "fg", "Normal" },
		bg = { "bg", "Normal" },
		hl = { "fg", "Todo" },
		["fg+"] = { "fg", "TSString" },
		["bg+"] = { "bg", "Normal" },
		["hl+"] = { "fg", "Todo" },
		info = { "fg", "TSString" },
		border = { "fg", "Ignore" },
		prompt = { "fg", "Normal" },
		pointer = { "fg", "ALEError" },
		marker = { "fg", "TSString" },
		spinner = { "fg", "Label" },
		header = { "fg", "ALEError" },
	}
end

function M.highlight(group, color)
	if color.link then
		vim.api.nvim_command("highlight! link " .. group .. " " .. color.link)
	else
		local style = color.style and "gui=" .. color.style or color.preserve and "" or " gui=NONE cterm=NONE"
		local fg = color.fg and "guifg=" .. color.fg or color.preserve and "" or "guifg=NONE ctermfg=NONE"
		local bg = color.bg and "guibg=" .. color.bg or color.preserve and "" or "guibg=NONE ctermbg=NONE"
		local sp = color.sp and "guisp=" .. color.sp or color.preserve and "" or "guisp=NONE"
		vim.api.nvim_command("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
	end
end

function M.load_syntax()
	local syntax = {

		Normal = { fg = colors.gray8, bg = colors.bg },
		Terminal = { fg = colors.fg, bg = colors.bg },
		Visual = { fg = colors.bg, bg = colors.fg },
		VisualNOS = { fg = colors.bg, bg = colors.fg },

		-- This is a comment
		SpecialComment = { fg = colors.gray6, style = "bold" },
		-- TODO: this is a todo comment
		Todo = { fg = colors.blue, style = "bold" },

		LineNr = { fg = colors.gray4 },
		CursorLineNr = { fg = colors.gray8, bg = colors.bg_alt },

		Cursor = { fg = colors.bg, bg = colors.fg },
		lCursor = { fg = colors.bg, bg = colors.fg },
		CursorIM = { fg = colors.bg, bg = colors.fg },
		CursorColumn = { fg = colors.fg },

		CursorLine = { bg = colors.bg_alt },

		ColorColumn = { bg = colors.bg_alt },
		Conceal = { fg = colors.gray2 },

		IncSearch = { fg = colors.bg, bg = colors.bright_blue, style = "bold" },
		Search = { fg = colors.bg, bg = colors.faded_blue },

		Pmenu = { fg = colors.fg, bg = colors.gray1 },
		PmenuSel = { fg = colors.gray1, bg = colors.fg },
		PmenuSbar = { fg = colors.fg, bg = colors.gray1 },
		PmenuThumb = { fg = colors.bg, bg = colors.gray8 },

		SpellBad = { fg = colors.red, style = "underline" },
		SpellCap = {},
		SpellLocal = {},
		SpellRare = {},

		ModeMsg = {},
		MoreMsg = {},
		StatusLine = { bg = colors.bg_alt },
		StatusLineNC = {},

		MatchParen = { style = "bold" },

		VertSplit = { fg = colors.bg, bg = colors.bg },

		TSAnnotation = {},
		TSAttribute = {},
		TSBoolean = { fg = colors.fg, style = "bold" },
		TSCharacter = { fg = colors.fg },
		-- this is a comment
		TSComment = { fg = colors.gray5 },
		TSConditional = { fg = colors.gray7 },
		TSConstant = { fg = colors.fg },
		TSConstBuiltin = { fg = colors.gray6 },
		TSConstMacro = {},
		TSConstructor = { fg = colors.fg },
		TSError = { style = "underline" },
		TSException = { style = "underline,bold" },
		TSField = { fg = colors.gray5 },
		TSFloat = { fg = colors.fg, style = "bold" },
		TSFunction = { fg = colors.gray9 },
		TSFuncBuiltin = { fg = colors.gray4 },
		TSFuncMacro = { fg = colors.gray6 },
		TSInclude = { fg = colors.gray7 },
		-- TSKeyword = { fg = colors.gray5 },
		TSKeyword = { fg = colors.magenta },
		TSKeywordFunction = { fg = colors.gray4 },
		TSKeywordOperator = { fg = colors.gray4 },
		TSKeywordReturn = { fg = colors.gray4 },
		TSLabel = { fg = colors.fg },
		TSMethod = { fg = colors.gray6 },
		TSNamespace = { fg = colors.gray4 },
		TSNone = { fg = colors.gray3 },
		TSNumber = { fg = colors.fg, style = "bold" },
		TSOperator = { fg = colors.fg },
		TSParameter = { fg = colors.gray7 },
		TSParameterReference = { fg = colors.gray7 },
		TSProperty = { fg = colors.gray5 },
		TSPunctDelimiter = { fg = colors.fg },
		TSPunctBracket = { fg = colors.fg },
		TSPunctSpecial = { fg = colors.fg },
		TSRepeat = { fg = colors.gray4 },
		TSString = { fg = colors.white },
		TSStringRegex = { fg = colors.gray9 },
		TSStringEscape = { fg = colors.gray9 },
		TSSymbol = { fg = colors.fg },
		TSTag = { fg = colors.fg },
		TSTagDelimiter = {},
		TSText = { fg = colors.fg },
		TSStrong = { style = "bold" },
		TSEmphasis = {},
		TSUnderline = { style = "underline" },
		TSStrike = { style = "strikethrough" },
		TSTitle = {},
		TSLiteral = { fg = colors.fg },
		TSURI = {},
		TSMath = {},
		TSTextReference = {},
		TSEnvironment = {},
		TSEnvironmentName = {},
		TSNote = { style = "bold" },
		TSWarning = { style = "bold" },
		TSDanger = { style = "bold" },
		TSType = { fg = colors.fg },
		TSTypeBuiltin = { fg = colors.gray4 },
		TSVariable = { fg = colors.gray8 },
		TSVariableBuiltin = { fg = colors.gray8 },

		Bold = { link = "TSStrong" },
		Boolean = { link = "TSBoolean" },
		Character = { link = "TSCharacter" },
		Comment = { link = "TSComment" },
		Conditional = { link = "TSConditional" },
		Constant = { link = "TSConstant" },
		Define = { link = "TSConstBuiltin" },
		Delimiter = { link = "TSPunctDelimiter" },
		Error = { link = "TSError" },
		Exception = { link = "TSException" },
		Float = { link = "TSFloat" },
		Function = { link = "TSFunction" },
		Identifier = { link = "TSVariable" },
		Include = { link = "TSInclude" },
		Italic = { link = "TSEmphasis" },
		Keyword = { link = "TSKeyword" },
		Label = { link = "TSLabel" },
		Macro = { link = "TSFuncMacro" },
		Number = { link = "TSNumber" },
		Operator = { link = "TSOperator" },
		Repeat = { link = "TSRepeat" },
		SpecialChar = { link = "TSStringEscape" },
		String = { link = "TSString" },
		Structure = { link = "TSAnnotation" },
		Field = { link = "TSProperty" },
		Tag = { link = "TSTag" },
		Title = { link = "TSTitle" },
		Type = { link = "TSType" },
		Underlined = { link = "TSUnderline" },
		asciidocAttributeEntry = { link = "TSAttribute" },
		cIncluded = { link = "TSConstructor" },
		healthError = { link = "TSDanger" },
		healthWarning = { link = "TSWarning" },
		rubySymbol = { link = "TSSymbol" },
		xmlNamespace = { link = "TSNamespace" },

		Directory = {},
		EndOfBuffer = {},
		ErrorMsg = { style = "reverse" },
		FoldColumn = {},
		Folded = {},
		NonText = { fg = colors.green },
		Question = {},
		SignColumn = {},
		SpecialKey = {},
		Substitute = { fg = colors.red, style = "bold,reverse" },
		TabLine = {},
		TabLineFill = {},
		TabLineSel = { style = "reverse" },
		WarningMsg = {},
		WildMenu = { style = "reverse" },
		Ignore = {},
		PreProc = {},
		Special = {},
		ToolbarLine = { bg = colors.bg },
		ToolbarButton = { style = "bold" },
		qfLineNr = {},
		Whitespace = { fg = colors.gray2 },
		PmenuSelBold = {},
		NormalFloat = {},
		FloatBorder = { link = "Normal" },
		QuickFixLine = {},
		Debug = {},
		debugBreakpoint = {},
		PreCondit = {},
		Statement = { link = "Function" },
		Typedef = { fg = colors.gray7 },
	}
	return syntax
end

function M.load_plugin_syntax()
	local plugin_syntax = {

		DashboardShortCut = { fg = colors.fg, bg = colors.bg },
		DashboardHeader = { fg = colors.fg, bg = colors.bg },
		DashboardCenter = { fg = colors.fg, bg = colors.bg },
		DashboardFooter = { fg = colors.fg, bg = colors.bg },

		ALEError = { fg = colors.red },
		ALEWarning = { fg = colors.red },
		ALEInfo = { fg = colors.red },
		ALEErrorSign = { fg = colors.red },
		ALEWarningSign = { fg = colors.red },
		ALEInfoSign = { fg = colors.red },

		DiffAdd = { fg = colors.neutral_green },
		DiffChange = { fg = colors.neutral_blue },
		DiffDelete = { fg = colors.neutral_red },
		DiffText = { fg = colors.neutral_blue },

		GitSignsAdd = { fg = colors.neutral_green },
		GitSignsDelete = { fg = colors.neutral_red },
		GitSignsChange = { fg = colors.neutral_blue },
		GitSignsChangeNr = { fg = colors.neutral_yellow },
		GitSignsChangeLn = { fg = colors.neutral_yellow },
		GitSignsChangeDelete = { fg = colors.neutral_orange },

		SignifySignAdd = { fg = colors.neutral_green },
		SignifySignChange = { fg = colors.neutral_yellow },
		SignifySignDelete = { fg = colors.neutral_red },

		GitGutterAdd = { fg = colors.neutral_green },
		GitGutterChange = { fg = colors.neutral_yellow },
		GitGutterChangeDelete = { fg = colors.neutral_orange },
		GitGutterDelete = { fg = colors.neutral_red },

		DiagnosticError = { fg = colors.red },
		DiagnosticWarn = { fg = colors.faded_yellow },
		DiagnosticInfo = { fg = colors.faded_blue },
		DiagnosticHint = { fg = colors.fg },
		DiagnosticOk = { fg = colors.green },
		DiagnosticUnderlineError = { sp = colors.red, style = "underline" },
		DiagnosticUnderlineWarn = { sp = colors.faded_yellow, style = "underline" },
		DiagnosticUnderlineInfo = { sp = colors.faded_blue, style = "underline" },
		DiagnosticUnderlineHint = { sp = colors.fg, style = "underline" },
		DiagnosticUnderlineOk = { sp = colors.green, style = "underline" },

		gitCommitBranch = {},
		gitCommitDiscardedFile = {},
		gitCommitDiscardedType = {},
		gitCommitHeader = {},
		gitCommitSelectedFile = {},
		gitCommitSelectedType = {},
		gitCommitUntrackedFile = {},
		gitEmail = {},

		NERDTreeGitStatusDirDirty = {},
		NERDTreeGitStatusModified = {},
		NERDTreeGitStatusRenamed = {},
		NERDTreeGitStatusStaged = {},
		NERDTreeGitStatusUntracked = {},
		NERDTreeClosable = {},
		NERDTreeCWD = {},
		NERDTreeDir = {},
		NERDTreeDirSlash = {},
		NERDTreeExecFile = {},
		NERDTreeFile = {},
		NERDTreeFlags = {},
		NERDTreeHelp = {},
		NERDTreeLinkDir = {},
		NERDTreeLinkFile = {},
		NERDTreeLinkTarget = {},
		NERDTreeOpenable = {},
		NERDTreePart = {},
		NERDTreePartFile = {},
		NERDTreeUp = {},

		LspInlayHint = { fg = colors.gray1, bg = colors.bg },

		markdownBold = { style = "bold" },
		markdownCode = {},
		markdownCodeDelimiter = {},
		markdownError = {},
		markdownH1 = { style = "bold" },
		markdownUrl = { fg = colors.bright_blue },
		markdownFootnote = { link = "TSNote" },
		markdownLinkText = { link = "TSURI" },
		markdownLinkTextDelimiter = { fg = colors.gray4 },
		markdownLinkDelimiter = { fg = colors.gray4 },

		mkdDelimiter = {},
		mkdLineBreak = {},
		mkdListItem = {},
		mkdCodeStart = { fg = colors.gray4 },
		mkdCodeEnd = { fg = colors.gray4 },
		mkdURL = { fg = colors.bright_blue },

		NvimTreeFolderName = { fg = colors.gray8 },
		NvimTreeRootFolder = { fg = colors.fg },
		NvimTreeSpecialFile = {},

		TelescopeBorder = { fg = colors.gray5 },
		TelescopePromptBorder = { fg = colors.fg },
		TelescopeMatching = {},
		TelescopeSelection = { style = "bold" },
		TelescopeSelectionCaret = { fg = colors.fg },
		TelescopeMultiSelection = {},

		BufferCurrent = { fg = colors.fg, bg = colors.bg },
		BufferCurrentMod = { fg = colors.fg, bg = colors.bg },
		BufferCurrentSign = { fg = colors.fg, bg = colors.bg },
		BufferVisible = { fg = colors.gray8, bg = colors.bg },
		BufferVisibleMod = { fg = colors.gray8, bg = colors.bg },
		BufferVisibleSign = { fg = colors.gray8, bg = colors.bg },
		BufferInactive = { fg = colors.gray3, bg = colors.bg_alt },
		BufferInactiveMod = { fg = colors.gray3, bg = colors.bg_alt },
		BufferInactiveSign = { fg = colors.gray3, bg = colors.bg_alt },

		gitcommitSummary = { link = "Normal" },
		gitcommitOverflow = { link = "SpellBad" },
	}
	return plugin_syntax
end

function M.colorscheme()
	vim.api.nvim_command("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.api.nvim_command("syntax reset")
	end
	vim.o.termguicolors = true
	vim.g.colors_name = "monochrome"
	local syntax = M.load_syntax()
	for group, tables in pairs(syntax) do
		M.highlight(group, tables)
	end
	M.terminal_color()
	M.fzf_color()
	local plugin_syntax = M.load_plugin_syntax()
	for group, tables in pairs(plugin_syntax) do
		M.highlight(group, tables)
	end

	local signs = {
		{ name = "DiagnosticSignError", text = "✕" },
		{ name = "DiagnosticSignWarn", text = "✕" },
		{ name = "DiagnosticSignHint", text = "‣" },
		{ name = "DiagnosticSignInfo", text = "‣" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end
end

function M.reset()
	package.loaded["monochrome"] = nil
	require("monochrome").colorscheme()
end

return M
