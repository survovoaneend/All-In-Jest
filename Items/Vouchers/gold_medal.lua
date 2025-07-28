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

  loc_vars = function(self, info_queue)
    return {vars = {self.config.extra.rate}}
  end,

  redeem = function(self)
    G.GAME.jest_gold_tag_rate = self.config.extra.rate
  end
}
return {name = "Vouchers", items = {gold_medal}}