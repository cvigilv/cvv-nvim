-- Configuration
require'compe'.setup {
  enabled          = true;
  autocomplete     = true;
  debug            = false;
  min_length       = 1;
  preselect        = 'disable';
  documentation    = true;
  source = {
    path      = true;
    nvim_lsp  = true;
    ultisnips = true;
    omni      = true;
  };
}

-- Mappings
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  --elseif vim.fn['vsnip#available'](1) == 1 then
    --return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  --elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    --return t "<Plug>(vsnip-jump-prev)"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>",   "v:lua.tab_complete()",	  { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>",   "v:lua.tab_complete()",   { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
