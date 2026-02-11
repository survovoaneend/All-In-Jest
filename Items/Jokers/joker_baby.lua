local joker_baby = {
    object_type = "Joker",
    order = 58,


    key = "joker_baby",
    config = {
        extra = {
            mult_mod = 2
        }
    },
    rarity = 1,
    pos = { x = 4, y = 2 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_mod
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 4 or
                context.other_card:get_id() == 5 then
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                    context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult_mod
                    return {
                        extra = { message = localize('k_upgrade_ex'), colour = G.C.MULT },
                        card = card
                    }
            end
        end
    end

}
return { name = { "Jokers" }, items = { joker_baby } }
