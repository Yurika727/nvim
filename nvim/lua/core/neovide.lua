--Guifont
vim.g.gui_font_default_size = 11
vim.g.gui_font_size = vim.g.gui_font_default_size
vim.g.gui_font_face = "Monospace"

RefreshGuiFont = function()
  vim.opt.guifont = string.format("%s:h%s",vim.g.gui_font_face, vim.g.gui_font_size)
end

ResizeGuiFont = function(delta)
  vim.g.gui_font_size = vim.g.gui_font_size + delta
  RefreshGuiFont()
end

ResetGuiFont = function()
  vim.g.gui_font_size = vim.g.gui_font_default_size
  RefreshGuiFont()
end

-- Call function on startup to set default value
ResetGuiFont()

-- Keymaps

local opts = { noremap = true, silent = true }
-- Change Font Size
vim.keymap.set({'n', 'i'}, "<C-+>", function() ResizeGuiFont(1)  end, opts)
vim.keymap.set({'n', 'i'}, "<C-->", function() ResizeGuiFont(-1) end, opts)
-- Clipboard
vim.keymap.set("v", "<S-C-c>", "\"+y")
vim.keymap.set("n", "<S-C-v>", "\"+p")
-- Position and size
vim.g.neovide_remember_window_size = true
vim.g.neovide_remember_window_position = true
vim.g.neovide_fullscreen = true
-- Cursor Settings
vim.g.neovide_cursor_animation_length=0.11
vim.g.neovide_cursor_trail_size=0.6
vim.g.neovide_cursor_vfx_mode = "wireframe"
