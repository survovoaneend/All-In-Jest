local diver = {
    object_type = "Joker",
    order = 406,
    key = "diver",

    config = {
        extra = {
            pack_size = 2,
        }
    },
    attributes = { 'booster', 'passive' },
    rarity = 2,
    pos = { x = 10, y = 16 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.pack_size
            }
        }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) + card.ability.extra.pack_size
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.modifiers.booster_size_mod = (G.GAME.modifiers.booster_size_mod or 0) - card.ability.extra.pack_size
    end
}

return { name = { "Jokers" }, items = { diver } }
