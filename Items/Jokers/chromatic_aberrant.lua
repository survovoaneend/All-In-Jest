local chromatic_aberrant = {
    object_type = "Joker",
    order = 715,

    key = "chromatic_aberrant",
    config = {
        extra = {
            perm_odds = 0,
            perm_odds_max = 5,
            perm_odds_mod = 1,
            temp_odds = 0,
            temp_odds_mod = 1,
        }
    },
    attributes = {},
    rarity = 2,
    pos = { x = 17, y = 32 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.perm_odds,
                card.ability.extra.perm_odds_max,
                card.ability.extra.perm_odds_mod,
                card.ability.extra.temp_odds,
                card.ability.extra.temp_odds_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            card.ability.extra.temp_odds = 0
            if next(context.poker_hands['Straight Flush']) then
                if card.ability.extra.perm_odds < card.ability.extra.perm_odds_max then
                    card.ability.extra.perm_odds = card.ability.extra.perm_odds + card.ability.extra.perm_odds_mod
                    return {
                        message = localize("k_upgrade_ex"),
                    }
                end
            elseif next(context.poker_hands['Straight']) or next(context.poker_hands['Flush']) then
                card.ability.extra.temp_odds = card.ability.extra.temp_odds + card.ability.extra.temp_odds_mod
                return {
                        message = localize{type = "variable", key = "a_aij_odds", vars = {card.ability.extra.temp_odds_mod}},
                        colour = G.C.GREEN
                    }
            end
        end
        if context.mod_probability and not context.blueprint then
            local total_boost = card.ability.extra.perm_odds + (card.ability.extra.temp_odds or 0)
            if total_boost > 0 then
                return {
                    numerator = context.numerator + total_boost
                }
            end
        end
        if context.after and not context.blueprint then
            card.ability.extra.temp_odds = 0
        end
    end
}
return { name = {"Jokers"}, items = {chromatic_aberrant} }