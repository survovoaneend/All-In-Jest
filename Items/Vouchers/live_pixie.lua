local live_pixie = {
  object_type = "Voucher",
  key = 'live_pixie',
  config = {
    extra = {
      rate = 4
    }
  },
  requires = {
    'v_aij_fairy_dust'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 1, y = 0 },
  discovered = false,
  order = 1,

  loc_vars = function(self, info_queue)
    return {vars = {self.config.extra.rate}}
  end,

  redeem = function(self)
    G.GAME.jest_fairy_edition_rate = self.config.extra.rate
  end
}
return {name = "Vouchers", items = {live_pixie}}