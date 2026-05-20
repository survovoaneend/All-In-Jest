local jogre = {
    object_type = "Joker",
    order = 569,
    key = "jogre",
    config = {
        extra = {
            dollars = 15
        }
    },
    rarity = 1,
    pos = { x = 7, y = 27 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
            }
        }
    end,

    all_in_jest = {
        end_calc_dollar_bonus = function(self, card, cashout_dollars)
            if card.ability.extra.dollars > 0 then
                local dollar_bonus = card.ability.extra.dollars - cashout_dollars
                return dollar_bonus
            end
        end
    }
}
return { name = { "Jokers" }, items = { jogre } }
