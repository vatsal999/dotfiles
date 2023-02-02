local colors = require("ikigai.colors")

local ikigai = {}

ikigai.normal = {
	a = { fg = colors.fg, bg = colors.brightbg2 },
	b = { fg = colors.fg, bg = colors.brightbg },
	c = { fg = colors.fg, bg = colors.bg },
	x = { fg = colors.fg, bg = colors.bg },
	y = { fg = colors.fg, bg = colors.brightbg },
	z = { fg = colors.fg, bg = colors.brightbg2 },
}

ikigai.insert = {
	a = { fg = colors.bg, bg = colors.green },
	b = { fg = colors.fg, bg = colors.brightbg},
	c = {  fg = colors.fg, bg = colors.bg },
	x = {  fg = colors.fg, bg = colors.bg },
	y = { fg = colors.fg, bg = colors.brightbg },
	z = { fg = colors.bg, bg = colors.green },
}

ikigai.visual = {
	a = { fg = colors.ikigai0_gui, bg = colors.ikigai7_gui },
	b = { fg = colors.ikigai4_gui, bg = colors.ikigai2_gui },
	y = {  fg = colors.ikigai5_gui, bg = colors.ikigai2_gui },
}

ikigai.replace = {
	a = { fg = colors.ikigai0_gui, bg = colors.ikigai11_gui },
	b = { fg = colors.ikigai4_gui, bg = colors.ikigai2_gui },
	y = { fg = colors.ikigai4_gui, bg = colors.ikigai2_gui },
	z = { fg = colors.ikigai0_gui, bg = colors.ikigai11_gui },
}

ikigai.command = {
	a = { fg = colors.bg , bg = colors.yellow, gui = "bold" },
	b = { fg = colors.fg, bg = colors.brightbg },
    c = { fg = colors.fg, bg = colors.bg},
    x = { fg = colors.fg, bg = colors.bg},
	y = { fg = colors.fg, bg = colors.brightbg },
	z = { fg = colors.bg , bg = colors.yellow},
}

ikigai.inactive = {
	a = { fg = colors.brightbg2, bg = colors.bg, gui = "bold" },
	b = { fg = colors.brightbg2, bg = colors.bg },
	c = { fg = colors.brightbg2, bg = colors.bg },
}

return ikigai
