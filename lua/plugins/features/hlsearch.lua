return {
  'nvimdev/hlsearch.nvim',
  event = 'VeryLazy',
  config = function()
    require('hlsearch').setup()
  end
}
