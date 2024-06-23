return { 
  {
    'goolord/alpha-nvim',
    dependencies = {
        {'nvim-tree/nvim-web-devicons', 
        config = function ()
          require("nvim-web-devicons").setup(opts)
        end
      },
        'nvim-lua/plenary.nvim'
    },
    config = function ()
        require'alpha'.setup(require'alpha.themes.theta'.config)
    end
  }
}
