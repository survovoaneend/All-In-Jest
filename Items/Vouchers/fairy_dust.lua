local fairy_dust = {
  object_type = "Voucher",
  key = 'fairy_dust',
  config = {
    extra = {
      rate = 2
    }
  },
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 0 },
  discovered = false,
  order = 0,

  loc_vars = function(self, info_queue)
    return {vars = {self.config.extra.rate}}
  end,

  redeem = function(self)
    G.GAME.jest_fairy_edition_rate = self.config.extra.rate
  end
}
return {name = "Vouchers", items = {fairy_dust}}