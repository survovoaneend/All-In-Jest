local charles = {
  object_type = "Joker",
  order = 183,

  key = "charles",
  config = {
    extra = {
      xmult = 1,
      xmult_mod = 0.25
    }
  },
  rarity = 3,
  pos = { x = 19, y = 9},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,
  perishable_compat = false,

  loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.xmult_mod,
          card.ability.extra.xmult
        }
      }
  end,

  calculate = function(self, card, context)
    local heart_kings, all_cards = 0, 0
    if context.before then
      for k, v in ipairs(context.full_hand) do
        all_cards = all_cards + 1
        if v:get_id() == 13 and v:is_suit('Hearts') then
          heart_kings = heart_kings + 1
        end
      end
     if heart_kings == all_cards and not context.blueprint then 
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "xmult",
	        scalar_value = "xmult_mod",
        })
      end
    end
    if context.joker_main then
      return {
          xmult = card.ability.extra.xmult,
      }
    end
  end
}
return { name = {"Jokers"}, items = {charles} }
