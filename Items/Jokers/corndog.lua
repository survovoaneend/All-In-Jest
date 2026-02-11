local corndog = {
    object_type = "Joker",
    order = 495,

    key = "corndog",
    config = {
        extra = {
            hands = 10,
        }
    },
    rarity = 2,
    pos = { x = 1, y = 24 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.aij_before_before and context.scoring_name then
            if G.play then
                card.ability.extra.hands = card.ability.extra.hands - 1
                return {
                    message = localize("k_aij_change_ex"),
                    func = function()
                        if card.ability.extra.hands <= 0 then
                            SMODS.destroy_cards(card, nil, nil, true)
                            card_eval_status_text(card, 'extra', nil, nil, nil, {
                                message = localize('k_eaten_ex'),
                                colour = G.C.RED
                            })
                        end
                    end
                }
            end
        end
    end
}
return { name = { "Jokers" }, items = { corndog } }
