local turrn = {
    object_type = "Joker",
    order = 949,
    
    key = "turrn",
    config = {
        extra = {
            slots = 5,
            slots_mod = 1
        }
    },
    attributes = {'shop', 'shop_slot', 'food', 'passive'},
    rarity = 3,
    pos = { x = 23, y = 43},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.slots,
                card.ability.extra.slots_mod
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.slots)
    end,

    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.slots)
    end,

    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if card.ability.extra.slots - card.ability.extra.slots_mod <= 0 then
                SMODS.destroy_cards(card, nil, nil, true)
                return {
                    message = localize('k_eaten_ex'),
                    colour = G.C.FILTER
                }
            else
                card.ability.extra.slots = card.ability.extra.slots - card.ability.extra.slots_mod
                change_shop_size(-card.ability.extra.slots_mod)
                return {
                    message = localize { type = 'variable', key = 'a_aij_slots_minus', vars = { card.ability.extra.slots_mod } },
                    colour = G.C.FILTER
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {turrn} }