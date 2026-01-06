local trophy = {
  object_type = "Voucher",
  key = 'trophy',
  config = {
    extra = {
      odds = 3,
    }
  },
  requires = {
    'v_aij_gold_medal'
  },
  atlas = 'vouchers_atlas',
  pos = { x = 3, y = 0 },
  discovered = false,
  order = 3,

  loc_vars = function(self, info_queue)
    local numerator, denominator = SMODS.get_probability_vars(self, 1, self.config.extra.odds)
    return {
        vars = {
            numerator, denominator,
        }
    }
  end,

  calculate = function(self, card, context)
    if context.end_of_round and not context.individual and not context.repetition then
        G.GAME.all_in_jest.apply.v_aij_trophy_chance = SMODS.pseudorandom_probability(card, 'v_aij_trophy', 1, 3)
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
return {name = "Vouchers", items = {trophy}}