local wax_stamp = {
  object_type = "Voucher",
  key = 'wax_stamp',
  config = {
    
  },
  atlas = 'vouchers_atlas',
  pos = { x = 0, y = 1 },
  discovered = false,
  order = 6,

  loc_vars = function(self, info_queue)
    
  end,

  redeem = function(self)
    G.GAME.all_in_jest.standard_pack_seal_rate = G.GAME.all_in_jest.standard_pack_seal_rate + 1
  end,
}
return {name = "Vouchers", items = {wax_stamp}}