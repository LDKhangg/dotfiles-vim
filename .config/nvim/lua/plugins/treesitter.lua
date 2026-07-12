return {
  "nvim-treesitter/nvim-treesitter",
  version = false,
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" }, -- Chỉ load khi ông bắt đầu mở hoặc tạo file code
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      "java",
      "python",
      "javascript",
      "typescript",
      "lua",
      "html",
      "css",
      "bash",
      "markdown",
    },
  },
  config = function(_, opts)
    -- Kiểm tra an toàn trước khi gọi module
    local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
    if not status_ok then
      return
    end
    treesitter_configs.setup(opts)
  end,
}
