return {
  { 
    'mrcjkb/rustaceanvim', 
    config = function()
  -- Update this path
  local extension_path = vim.env.HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/'
  local codelldb_path = extension_path .. 'adapter/codelldb'
  local liblldb_path = extension_path .. 'lldb/lib/liblldb'
  local this_os = vim.uv.os_uname().sysname;

  -- The path is different on Windows
  if this_os:find "Windows" then
    codelldb_path = extension_path .. "adapter\\codelldb.exe"
    liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
  else
    -- The liblldb extension is .so for Linux and .dylib for MacOS
    liblldb_path = liblldb_path .. (this_os == "Linux" and ".so" or ".dylib")
  end

      local opts = { noremap = true }
      local keymap = vim.api.nvim_set_keymap
      keymap("n", "cr", "<cmd>term cargo check<cr>", opts)
      keymap("i", "<C-_>", "<cmd>RustLsp codeAction<CR>", opts)
      keymap("n", "<C-_>", "<cmd>RustLsp codeAction<CR>", opts)
      keymap("n", "<C-_>", "<cmd>RustLsp codeAction<CR>", opts)
  local cfg = require('rustaceanvim.config')
  return {
    dap = {
      adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path),
    },
  }
end,
    version = '^4', 
    ft = { 'rust' },
  },
}
