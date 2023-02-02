local ikigai = {

    ikigai0_gui = "#2E3440", -- ikigai0 in palette
    ikigai1_gui = "#3B4252", -- ikigai1 in palette
    ikigai2_gui = "#434C5E", -- ikigai2 in palette
    ikigai3_gui = "#4C566A", -- ikigai3 in palette
    ikigai3_gui_bright = "#616E88", -- out of palette
    ikigai4_gui = "#D8DEE9", -- ikigai4 in palette
    ikigai5_gui = "#E5E9F0", -- ikigai5 in palette
    ikigai6_gui = "#ECEFF4", -- ikigai6 in palette
    ikigai7_gui = "#8FBCBB", -- ikigai7 in palette
    ikigai8_gui = "#88C0D0", -- ikigai8 in palette
    ikigai9_gui = "#81A1C1", -- ikigai9 in palette
    ikigai10_gui = "#5E81AC", -- ikigai10 in palette dark blue
    ikigai11_gui = "#BF616A", -- ikigai11 in palette red
    ikigai12_gui = "#D08770", -- ikigai12 in palette orange
    ikigai13_gui = "#EBCB8B", -- ikigai13 in palette yellow
    ikigai14_gui = "#A3BE8C", -- ikigai14 in palette green
    ikigai15_gui = "#B48EAD", -- ikigai15 in palette pink

    white = "#D9E0EE", -- White
	gray2 = "#C3BAC6", -- Gray2
	gray1 = "#988BA2", -- Gray1
	gray0 = "#6E6C7E", -- Gray0
	black4 = "#575268", -- Black4
	black3 = "#302D41", -- Black3
	black2 = "#1E1E2E", -- Black2
	black1 = "#1A1826", -- Black1
	black0 = "#161616", -- Black0

    none = "NONE",
    bg = "#131313",
    darkbg = "#111111",
    brightbg = "#202020",
    --brightbg = "#262626"
    -- brightbg = "#1c1c1c", org
    brightbg2 = "#393939",
    -- brightbg2 = "#262626",
    fg = "#cfcfcf",
    grey = "#3B4142",
    greycomments = "#888888",
    greynum = "#605958",

    red = "#cc6464",
    yellow = "#F3C292",
    dessert = "#d0af89",
    -- dessert = "#b49688",
    orange = "#E49273",
    blue = "#7180AC",
    green = "#8d987e",
    purple = "#aaa1c8",
    cyan = "#89DDFF",

}

-- Enable contrast sidebars, floating windows and popup menus
if vim.g.ikigai_contrast then
	ikigai.sidebar = ikigai.ikigai1_gui
	ikigai.float = ikigai.ikigai1_gui
else
	ikigai.sidebar = ikigai.ikigai0_gui
	ikigai.float = ikigai.ikigai0_gui
end

if vim.g.ikigai_cursorline_transparent then
	ikigai.cursorlinefg = ikigai.ikigai0_gui
else
	ikigai.cursorlinefg = ikigai.ikigai1_gui
end

return ikigai
