local utils = require("neomood.utils")

require("neomood.autocmd_langs.base").create_au_for_lang("markdown", function(buf)
  local n = utils.n_buf

  n("<leader>mp", "<cmd>MarkdownPreviewToggle<cr>", "Markdown Preview", buf.buf)
end)
