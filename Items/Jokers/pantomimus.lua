local pantomimus = {
    object_type = "Joker",
    order = 152,
    lite = true,
    key = "pantomimus",
    config = {
        extra = {
            chips = 0,
            chip_mod = 2
        }
    },
    rarity = 1,
    pos = { x = 21, y = 5 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.chip_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and context.cardarea == G.jokers and not context.blueprint then
        SMODS.scale_card(card, {
	        ref_table = card.ability.extra,
            ref_value = "chips",
	        scalar_value = "chip_mod",
            operation = function(ref_table, ref_value, initial, change)
	            ref_table[ref_value] = initial + #G.hand.cards * change
            end,
        })
      end
      if context.joker_main then 
        return {
            chips = card.ability.extra.chips
        }
    end
    end
  
}
return { name = {"Jokers"}, items = {pantomimus} }
