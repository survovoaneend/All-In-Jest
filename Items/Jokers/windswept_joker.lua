local windswept_joker = {
    object_type = "Joker",
    order = 423,
    key = "windswept_joker",

    config = {
        extra = {
            levels = 2
        }
    },
    rarity = 3,
    pos = { x = 23, y = 20 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.levels
            }
        }
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            if next(context.poker_hands['Straight Flush']) then
                local card_to_juice = context.blueprint_card or card
                return {
                    message = localize('k_upgrade_ex'),
                    func = function()
                        local text = "Straight Flush"
                        level_up_hand(card_to_juice, text, nil, card.ability.extra.levels)
                    end
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { windswept_joker } }
