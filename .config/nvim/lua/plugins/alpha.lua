-- local alpha = require('alpha')
-- local dashboard = require('alpha.themes.dashboard')

-- dashboard.section.buttons.val = {
--     dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
--     dashboard.button( "SPC f f", "  > Find file", ":cd $HOME/dev| Telescope find_files<CR>"),
--     dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
-- 	dashboard.button("SPC o s","  > Open Session", "<cmd>SearchSession<CR>"),
--     dashboard.button( "s", "  > Settings" , ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
--     dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
-- }

-- dashboard.section.header.val = {
-- [[   _______                    .__           ]],
-- [[   \      \   ____  _______  _|__| _____    ]],
-- [[   /   |   \_/ __ \/  _ \  \/ /  |/     \   ]],
-- [[  /    |    \  ___(  <_> )   /|  |  Y Y  \  ]],
-- [[  \____|__  /\___  >____/ \_/ |__|__|_|  /  ]],
-- [[          \/     \/                    \/   ]],

-- }
-- alpha.setup(dashboard.opts)

-- -- Disable folding on alpha buffer
-- vim.cmd([[
--     autocmd FileType alpha setlocal nofoldenable
-- 	autocmd FileType alpha set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
-- ]])
