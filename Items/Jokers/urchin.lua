local urchin = {
    object_type = "Joker",
    order = 247,

    key = "urchin",
    config = {
        extra = {
            money = 0,
            money_mod = 2
        }
    },
    rarity = 1,
    pos = { x = 14, y = 9 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money,
                card.ability.extra.money_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            card.ability.extra.money = card.ability.extra.money + card.ability.extra.money_mod
            card_eval_status_text(card, 'extra', nil, nil, nil, {
                message = localize('k_upgrade_ex')
            })
        end
    end,
    calc_dollar_bonus = function(self, card)
        if card.ability.extra.money > 0 then
            local dollar_bonus = card.ability.extra.money
            return dollar_bonus
        end
    end

}
return { name = { "Jokers" }, items = { urchin } }
