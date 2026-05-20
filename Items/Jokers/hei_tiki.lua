local hei_tiki = {
    object_type = "Joker",
    order = 60,
    lite = true,
    key = "hei_tiki",
    config = {
      extra = {
        xmult = 0,
        xmult_mod = 0.1
      }
    },
    rarity = 3,
    pos = { x = 6, y = 2 },
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                1 + card.ability.extra.xmult,
                card.ability.extra.xmult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.final_scoring_step and context.cardarea == G.jokers and not context.blueprint then
            if hand_chips > mult then
                SMODS.scale_card(card, {
	                ref_table = card.ability.extra,
                    ref_value = "xmult",
	                scalar_value = "xmult_mod",
                })
            end
        end
        if context.joker_main then
            return {
                xmult = 1 + card.ability.extra.xmult,
            }
        end
    end
  
}
return { name = {"Jokers"}, items = {hei_tiki} }
