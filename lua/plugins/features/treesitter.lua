return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  opts = {
    ensure_installed = {
      "go",
      "html",
      "css",
      "lua",
      "kotlin",
      "jq",
      "dockerfile",
      "tsx",
      "python",
      "php",
      "dart"
    }
  },
  config = true
}
