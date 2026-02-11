local kingmaker = {
    object_type = "Joker",
    order = 470,
    key = "kingmaker",
    config = {
        extra = {
            odds = 5
        }
    },
    rarity = 3,
    pos = { x = 12, y = 23 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'kingmaker')
        return {
            vars = {
                numerator,
                denominator
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            local cards = {}
            for _, v in ipairs(context.scoring_hand) do
                if SMODS.pseudorandom_probability(card, 'kingmaker', 1, card.ability.extra.odds) then
                    table.insert(cards, v)
                end
            end
            if #cards > 0 then
                All_in_Jest.change_card(nil, 'King', cards)
                return {
                    message = localize('k_aij_change_ex')
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { kingmaker } }
