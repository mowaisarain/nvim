vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- increment and decrement numbers
keymap.set("n", "<leader>+", "<C-a>")
keymap.set("n", "<leader>-", "<C-x>")

-- split windows
keymap.set("n", "<leader>sv", "<C-w>v")  -- split vertically
keymap.set("n", "<leader>sh", "<C-w>s")  -- split horizontally
keymap.set("n", "<leader>se", "<C-w>=")  -- make split windows equal
keymap.set("n", "<leader>sx", ":close<CR>")  -- close current split window
keymap.set("n", "<leader>v+", ":vertical resize +5<CR>")  -- vertical resize current split
keymap.set("n", "<leader>v-", ":vertical resize -5<CR>")  -- vertical resize current split
keymap.set("n", "<leader>h+", ":horizontal resize +5<CR>")  -- horizontal resize current split
keymap.set("n", "<leader>h-", ":horizontal resize -5<CR>")  -- horizontal resize current split


-- tabs
keymap.set("n", "<leader>to", ":tabnew<CR>")  -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>")  -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>")  -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>")  -- go to previous tab

-- toggle maximize windows split
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")

-- navigate
keymap.set("n", "<leader>ls", "0")  -- line start
keymap.set("n", "<leader>le", "$")  -- line end

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>")
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Markdown Preview
keymap.set("n", "<leader>md", "<cmd>MarkdownPreview <cr>")
