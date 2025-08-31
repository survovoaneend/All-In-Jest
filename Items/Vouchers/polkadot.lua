local polkadot = {
  object_type = "Voucher",
  key = 'polkadot',
  config = {
    sticker_effects = nil
  },
  atlas = 'vouchers_atlas',
  pos = { x = 5, y = 0 },
  discovered = false,
  order = 6,
  requires = {
    'v_aij_sticker_sheet'
  },
  loc_vars = function(self, info_queue)
      if self.config.sticker_effects ~= G.GAME.all_in_jest.sticker_effects then
          self.config.sticker_effects = G.GAME.all_in_jest.sticker_effects
      end
      return {vars = {}}
  end,

  redeem = function(self)
      if self.config.sticker_effects ~= G.GAME.all_in_jest.sticker_effects then
          self.config.sticker_effects = G.GAME.all_in_jest.sticker_effects
      end
      G.GAME.rental_rate = math.max(G.GAME.rental_rate - self.config.sticker_effects['rental'], 0)
      G.GAME.perishable_rounds = G.GAME.perishable_rounds and G.GAME.perishable_rounds + self.config.sticker_effects['perishable'] or 5 + self.config.sticker_effects['perishable']
      for k, v in pairs(G.jokers.cards) do
          if v.ability.perishable then
              v.ability.perish_tally = v.ability.perish_tally and v.ability.perish_tally + self.config.sticker_effects['perishable'] or 5 + self.config.sticker_effects['perishable']
          end
      end
  end
}
return {name = "Vouchers", items = {polkadot}}