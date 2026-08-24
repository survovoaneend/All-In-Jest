local jongleur = {
    object_type = "Joker",
    order = 171,
    lite = true,
    key = "jongleur",
    config = {
        extra = {
            reroll_sale = 2
        }
    },
    attributes = { 'economy', 'reroll', 'shop', 'passive' },
    rarity = 1,
    pos = { x = 12, y = 6 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.reroll_sale } }
    end,

    add_to_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost - card.ability.extra.reroll_sale
        calculate_reroll_cost(true)
    end,

    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + card.ability.extra.reroll_sale
        calculate_reroll_cost(true)
    end
}
return { name = {"Jokers"}, items = { jongleur } }