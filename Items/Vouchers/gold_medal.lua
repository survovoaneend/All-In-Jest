local gold_medal = {
  object_type = "Voucher",
  key = 'gold_medal',
  config = {
    extra = {
      rate = 4
    }
  },
  atlas = 'vouchers_atlas',
  pos = { x = 2, y = 0 },
  discovered = false,
  order = 2,

  loc_vars = function(self, info_queue)
    return {vars = {self.config.extra.rate}}
  end,

  redeem = function(self)
    if not G.GAME.all_in_jest.apply.v_aij_gold_medal_been_used then
        G.GAME.all_in_jest.gold_tag_rate = G.GAME.all_in_jest.gold_tag_rate + self.config.extra.rate
        G.GAME.all_in_jest.apply.v_aij_gold_medal_been_used = true
    end
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
return {name = "Vouchers", items = {gold_medal}}