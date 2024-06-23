return { 
  'dmmulroy/ts-error-translator.nvim',
  lazy = false,
  config = function ()
    require("ts-error-translator").setup()
  end
}
