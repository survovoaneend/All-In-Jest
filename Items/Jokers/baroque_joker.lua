local baroque_joker = {
    object_type = "Joker",
    order = 371,
    key = "baroque_joker",

    config = {
        extra = {
            mult = 0,
            gain = 3,
            last_hand = nil
        }
    },
    rarity = 2,
    pos = { x = 0, y = 17 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and not context.blueprint then
            local target_hand = card.ability.extra.last_hand
            if target_hand then
                if context.poker_hands and next(context.poker_hands[target_hand]) and context.scoring_name ~= target_hand then
                    card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.gain
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    }
                end
            end
        end
        if context.after and not context.blueprint then
            card.ability.extra.last_hand = context.scoring_name
        end

        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { baroque_joker } }
