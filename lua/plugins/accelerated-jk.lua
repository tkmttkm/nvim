return {
  "rainbowhxch/accelerated-jk.nvim",
  event = "VeryLazy",
  config = function()
    require("accelerated-jk").setup({
      mode = "time_driven", -- time_driven / distance_driven
      enable_deceleration = true,
      acceleration_motions = {},
      acceleration_limit = 150, -- 加速の上限
      deceleration_factor = 3,  -- 減速の強さ
    })
  end,
}
