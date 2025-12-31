local tool = {
    object_type = "Joker",
    order = 359,
    key = "tool",
    config = {
        extra = {
            mult_mod = 2
        }
    },
    rarity = 1,
    pos = { x = 6, y = 14 },
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
        if context.change_suit then
            if not SMODS.has_no_suit(context.other_card) and context.old_suit ~= context.new_suit and not SMODS.has_enhancement(context.other_card, 'm_aij_canvas') then
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult or 0
                context.other_card.ability.perma_mult = context.other_card.ability.perma_mult + card.ability.extra.mult_mod
                local juiced_card = context.blueprint_card or card
                return {
                    message = localize("k_upgrade_ex"),
                    colour = G.C.RED,
                    message_card = context.other_card,
                    juice_card = juiced_card
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { tool } }
