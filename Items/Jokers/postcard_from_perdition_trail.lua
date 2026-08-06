local postcard_from_perdition_trail = {
  object_type = "Joker",
  order = 209,

  key = "postcard_from_perdition_trail",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.5
    }
  },
  attributes = { 'modify_card', 'seals', 'xmult', 'scaling' },
  rarity = 3,
  pos = { x = 17, y = 7 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.xmult,
        card.ability.extra.xmult_mod
      }
    }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local removed_a_seal = false
      local seals_removed = 0
      for i = 1, #context.scoring_hand do
        local cardd = context.scoring_hand[i]
        if cardd.seal then
          cardd:set_seal(nil, true)
          cardd:juice_up()
          seals_removed = seals_removed + 1
          removed_a_seal = true
        end
      end
      if removed_a_seal then
        SMODS.scale_card(card, {
          ref_table = card.ability.extra,
          ref_value = "xmult",
          scalar_value = "xmult_mod",
          operation = function(ref_table, ref_value, initial, change)
              ref_table[ref_value] = initial + change * seals_removed
          end,
        })
        return nil, true
      end
    end
    if context.joker_main then
      return {
        xmult = card.ability.extra.xmult
      }
    end
    local seal_count = 0
    if G.GAME and G.playing_cards then
      for _, card in ipairs(G.playing_cards) do
        if card.seal then
          seal_count = seal_count + 1
        end
      end
    end
    if seal_count > 0 then
      return true
    else
      return false
    end
  end,


}
return { name = { "Jokers" }, items = { postcard_from_perdition_trail } }
