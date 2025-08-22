local pink_slip = {
    object_type = "Joker",
    order = 375,
    key = "pink_slip",
    config = {
        extra = {
            limit = 2,
        }
    },
    rarity = 2,
    pos = { x = 22, y = 16},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card) 
        return {
            vars = {
                card.ability.extra.limit,
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(card.ability.extra.limit)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_discard_limit(-card.ability.extra.limit)
    end,

    calculate = function(self, card, context)
        
    end
}
return { name = {"Jokers"}, items = {pink_slip} }
