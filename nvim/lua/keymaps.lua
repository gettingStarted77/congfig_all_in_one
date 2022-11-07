-- Shorten function name
local keymap = vim.keymap.set -- Silent keymap option
local opts = { remap = false, silent = false }
-- Remap space as leader key vim.g.mapleader = ' '
vim.g.mapleader = ' '

--Modes
--                           *map-table*
--          Mode  | Norm | Ins | Cmd | Vis | Sel | Opr | Term | Lang |
-- Command        +------+-----+-----+-----+-----+-----+------+------+
-- [nore]map      | yes  |  -  |  -  | yes | yes | yes |  -   |  -   |
-- n[nore]map     | yes  |  -  |  -  |  -  |  -  |  -  |  -   |  -   |
-- [nore]map!     |  -   | yes | yes |  -  |  -  |  -  |  -   |  -   |
-- i[nore]map     |  -   | yes |  -  |  -  |  -  |  -  |  -   |  -   |
-- c[nore]map     |  -   |  -  | yes |  -  |  -  |  -  |  -   |  -   |
-- v[nore]map     |  -   |  -  |  -  | yes | yes |  -  |  -   |  -   |
-- x[nore]map     |  -   |  -  |  -  | yes |  -  |  -  |  -   |  -   |
-- s[nore]map     |  -   |  -  |  -  |  -  | yes |  -  |  -   |  -   |
-- o[nore]map     |  -   |  -  |  -  |  -  |  -  | yes |  -   |  -   |
-- t[nore]map     |  -   |  -  |  -  |  -  |  -  |  -  | yes  |  -   |
-- l[nore]map     |  -   | yes | yes |  -  |  -  |  -  |  -   | yes  |

-- Normal --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

-- Resize with arrows
keymap('n', '<C-Up>', '<CMD>resize -2<CR>', opts)
keymap('n', '<C-Down>', '<Cmd>resize +2<CR>', opts)
keymap('n', '<C-Left>', '<Cmd>vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', '<Cmd>vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', '<Cmd>bnext<CR>', opts)
keymap('n', '<S-h>', '<Cmd>bprevious<CR>', opts)

-- Close buffers
keymap('n', '<S-q>', '<Cmd>bdelete<CR>', opts)

-- Clear highlights
keymap('n', '<leader>h', '<Cmd>nohlsearch<CR>', opts)

-- Copy/paste from clipboard
keymap({ 'n', 'v' }, 'cy', '"+y', opts)
keymap({ 'n', 'v' }, 'cp', '"+p', opts)

-- Better paste
keymap({ 'n', 'v' }, '<leader>p', '"_dP', opts)

-- keymap --
-- Press jk fast to enter
keymap('i', 'jk', '<ESC>', opts)
keymap('i', 'kj', '<ESC>', opts)

-- Visual --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', '<Cmd>m .+1<CR>==', opts)
keymap('v', '<A-k>', '<Cmd>m .-2<CR>==', opts)


-- Plugins --
-- NvimTree
keymap('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>', opts)

-- Telescope
keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', opts)
keymap('n', '<leader>ft', '<Cmd>Telescope live_grep<CR>', opts)
keymap('n', '<leader>fp', '<Cmd>Telescope projects<CR>', opts)
keymap('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', opts)

-- Diagnostic --
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'diagnostic.goto_prev' })
keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'diagnostic.goto_next' })
keymap('n', '<space>q', vim.diagnostic.setloclist, { desc = 'diagnostic.setloclist' })

-- DAP
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
