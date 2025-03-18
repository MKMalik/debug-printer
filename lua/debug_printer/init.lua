local M = {}

M.config = {
  keymap_normal = "<leader>pp",
  keymap_visual = "<leader>pp",
  print_statements = {
    java = 'System.out.println("%s: " + %s);',
    javascript = 'console.log("%s:", %s);',
    typescript = 'console.log("%s:", %s);',
    python = 'print("%s:", %s)',
    cpp = 'std::cout << "%s: " << %s << std::endl;',
    c = 'printf("%s: %d\\n", %s);',
    lua = 'print("%s: .. $%s");'
  }
}

function M.setup(user_config)
  -- Allow user overrides
  if user_config then
    M.config = vim.tbl_extend("force", M.config, user_config)
  end

  -- Bind keys using the correct module name
  vim.api.nvim_set_keymap("n", M.config.keymap_normal, ":lua require'debug-printer'.PrintDebug()<CR>",
    { noremap = true, silent = true })
  vim.api.nvim_set_keymap("v", M.config.keymap_visual, ":lua require'debug-printer'.PrintDebug()<CR>",
    { noremap = true, silent = true })
end

function M.PrintDebug()
  local mode = vim.fn.mode()
  local selected_text

  if mode == "v" then
    -- Get selected text in visual mode
    vim.cmd('normal! "vy')
    selected_text = vim.fn.getreg('v')
  else
    -- Select word in normal mode and retrieve it
    vim.cmd('normal! viw"vy')
    selected_text = vim.fn.getreg('v')
  end

  if selected_text == "" then
    print("No valid text selected!")
    return
  end

  -- Detect file type
  local filetype = vim.bo.filetype
  local format_string = M.config.print_statements[filetype]

  if not format_string then
    print("Unsupported file type: " .. filetype)
    return
  end

  -- Insert print statement in the next line
  local statement = format_string:format(selected_text, selected_text)
  vim.api.nvim_put({ statement }, "l", true, true)
end

return M;
