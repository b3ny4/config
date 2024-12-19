
-- line numbers
vim.wo.number = true
-- relative line numbers
vim.wo.relativenumber = true

-- define leader (prefix for own shortcuts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- follow help links with enter key
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "help",
    callback = function ()
        vim.keymap.set("n", "<CR>", "<C-]>", {buffer = true})
    end
})


-- return to the last position when reopening the file
vim.api.nvim_command([[au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]])


-- indentation settings
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true

-- disable case sensitive pattern matching
vim.o.ignorecase = true
-- except when the pattern contains uppercase letters
vim.o.smartcase = true

-- save undo history
vim.opt.undofile = true

-- enable auto safe
vim.api.nvim_create_autocmd({"FocusLost", "BufLeave"}, {
  pattern = "*",
  callback = function (args)
    -- only autosave in normal mode
    if vim.api.nvim_get_mode().mode ~= "n" then return end

    -- do not auto save an empty buffer
    if (vim.fn.bufname(args.buf)) == "" then return end

    -- do not auto save readonly buffers
    if (vim.api.nvim_buf_get_option(args.buf, 'readonly')) then return end

    -- do not auto save non-modified buffers
    if (not vim.api.nvim_buf_get_option(args.buf, 'modified')) then return end

    vim.api.nvim_command("w")
  end,
  nested = true,
})


-- use system clipboard (requires xclip or wl-copy)
vim.o.clipboard = 'unnamedplus'


-- disable netrw in favor of nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


-- Shortcuts
--
-- Parameter 1: Mode (n = normal, i = insert...)
-- Parameter 2: Shortcut
-- Parameter 3: Keysequence
vim.keymap.set('n', '<leader>q', ':wqa<CR>')
