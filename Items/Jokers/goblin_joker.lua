local goblin_joker = {
    object_type = "Joker",
    order = 93,

    key = "goblin_joker",
    config = {
        extra = {
            draw_extra = 2,
            active = false
        }
    },
    rarity = 3,
    pos = { x = 13, y = 3 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.draw_extra,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.pre_discard then
            card.ability.extra.active = true
        end

        if context.drawing_cards and card.ability.extra.active then
            return {
                cards_to_draw = context.amount + card.ability.extra.draw_extra,
                message = "+" .. card.ability.extra.draw_extra
            }
        end

        if context.hand_drawn then
            card.ability.extra.active = false
        end
    end

}

return { name = { "Jokers" }, items = { goblin_joker } }