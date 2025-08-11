local trophy = {
  object_type = "Voucher",
  key = 'trophy',
  config = {
    
  },
  requires = {
    'v_aij_gold_medal'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 3, y = 0 },
  discovered = false,
  order = 4,

  loc_vars = function(self, info_queue)
    
  end,

  redeem = function(self)
    
  end,

  in_pool = function(self, args)
    if G.GAME then
        if G.GAME.round_resets then
            if G.GAME.round_resets.ante >= 3 then
                return true
            end
        end
    end
    return false
  end,
}
return {name = "Vouchers", items = {trophy}}