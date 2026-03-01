local naiteh = {
    object_type = "Joker",
    order = 1058,
    lite = true,
    key = "naiteh",
    config = {
      extra = {
        h_size = 1,
        h_size_mod = 1,
      }
    },
    rarity = 4,
    pos = { x = 7, y = 10},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = false,
    soul_pos = { x = 7, y = 11},
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size,
                card.ability.extra.h_size_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.beat_boss and context.main_eval and not context.blueprint then
            SMODS.scale_card(card, {
	            ref_table = card.ability.extra,
                ref_value = "h_size",
	            scalar_value = "h_size_mod",
            })
            G.hand:change_size(card.ability.extra.h_size_mod)
            return nil, true
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        if card.ability.extra.h_size > 0 then
            G.hand:change_size(-card.ability.extra.h_size)
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if card.ability.extra.h_size > 0 then
            G.hand:change_size(card.ability.extra.h_size)
        end
    end,
}
return { name = {"Jokers"}, items = {naiteh} }