local embraced_arcane = {
  object_type = "Voucher",
  key = 'embraced_arcane',
  config = {
    extra = {
      picks = 1
    }
  },
  atlas = 'vouchers_atlas',
  pos = { x = 2, y = 1 },
  discovered = false,
  order = 8,

  loc_vars = function(self, info_queue)
    return {vars = {self.config.extra.picks}}
  end,

  calculate = function(self, card, context)
    if context.open_booster then
        if context.card.config.center.kind == "Arcana" and G.GAME.jest_change_booster_options.pack_choices ~= "unlimited" then
            G.GAME.pack_choices = G.GAME.pack_choices + self.config.extra.picks
        end
    end
  end,
}
return {name = "Vouchers", items = {embraced_arcane}}