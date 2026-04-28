local numbertaker = {
    object_type = "Joker",
    order = 516,
    key = "numbertaker",
    config = {
        extra = {
            cur_mult = 0
        }
    },
    rarity = 2,
    pos = { x = 2, y = 25 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.cur_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if not SMODS.has_no_rank(context.other_card) then
                local rank = context.other_card.base.nominal
                card.ability.extra.cur_mult = card.ability.extra.cur_mult + rank
                aij_remove_rank(context.other_card)
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_upgrade_ex')})
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.cur_mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { numbertaker } }
