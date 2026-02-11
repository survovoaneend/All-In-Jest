local duende = {
    object_type = "Joker",
    order = 346,

    key = "duende",
    config = {
        extra = {
            dollars = 2
        }
    },
    rarity = 1,
    pos = { x = 17, y = 13 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local empty_slots = 0
        if G.jokers then
            empty_slots = G.jokers.config.card_limit - #G.jokers.cards
        end
        return {
            vars = {
                empty_slots * card.ability.extra.dollars,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)

    end,
    calc_dollar_bonus = function(self, card)
        local empty_slots = G.jokers.config.card_limit - #G.jokers.cards
        if empty_slots > 0 then
            return empty_slots * card.ability.extra.dollars
        end
    end

}
return { name = { "Jokers" }, items = { duende } }
