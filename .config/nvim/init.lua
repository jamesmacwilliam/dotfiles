local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth", "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

ensure_packer()

vim.g.loaded_sleuth = 1

local packer = require("packer")
packer.startup(function(use)
  use 'junegunn/fzf'
  use 'junegunn/fzf.vim'
  use 'mileszs/ack.vim'
  use 'nanotech/jellybeans.vim'
  use 'danilo-augusto/vim-afterglow'
  use 'micha/vim-colors-solarized'
  use 'tpope/vim-rails'
  use 'christoomey/vim-tmux-runner'
  use 'vim-test/vim-test'
  use 'scrooloose/nerdcommenter'
  use 'tpope/vim-fugitive'
  use 'airblade/vim-gitgutter'
  use 'scrooloose/syntastic'
  use 'sheerun/vim-polyglot'
  use 'bling/vim-airline'
  use 'vim-airline/vim-airline-themes'

  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-endwise'
  use 'docunext/closetag.vim'
  use 'tpope/vim-sleuth'
  use 'w0rp/ale'
  --use 'ervandew/supertab'

  use 'hashivim/vim-terraform'

  -- js / typescript / jsx
  use 'pangloss/vim-javascript'
  use 'leafgarland/typescript-vim'
  use 'MaxMEllon/vim-jsx-pretty'
  use 'peitalin/vim-jsx-typescript'

  use 'posva/vim-vue'

  -- copilot (disabled)
  --use 'github/copilot.vim'
  --use 'nvim-lua/plenary.nvim'
  --use 'CopilotC-Nvim/CopilotChat.nvim'
end)

packer.install()

-- add noinsert or noselect to your completeopt otherwise chat autocompletion will not work. For best autocompletion experience, also add popup to your completeopt
--vim.o.completeopt = "menuone,noselect,popup"

--require("CopilotChat").setup({
--  model = "claude-3.7-sonnet",
--})

-- Load legacy vim config
vim.cmd('source ~/.vimrc')

--vim.g.copilot_enabled = false

--vim.g.copilot_no_tab_map = true

--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "copilot-chat",
--  callback = function()
--    vim.cmd("Copilot enable")
--    vim.defer_fn(function()
--      if vim.fn['copilot#Enabled']() == 1 then
--        vim.api.nvim_buf_set_keymap(0, "i", "<Tab>", 'copilot#Accept("\\<CR>")', {
--          noremap = true,
--          silent = true,
--          expr = true,
--          script = true,
--        })
--      else
--        print("Copilot not enabled in this buffer")
--      end
--    end, 100)
--  end,
--})
