local naiteh = {
    object_type = "Joker",
    order = 303,

    key = "naiteh",
    config = {
      extra = {
        h_size = 0,
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
        if context.end_of_round and G.GAME.blind.boss and context.main_eval and not context.blueprint then
            card.ability.extra.h_size = card.ability.extra.h_size + card.ability.extra.h_size_mod
            G.hand:change_size(card.ability.extra.h_size_mod)
            return {
                message = localize('k_upgrade_ex'),
                card = card
            }
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
}
return { name = {"Jokers"}, items = {naiteh} }