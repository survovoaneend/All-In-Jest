local saucy_jacky = {
    object_type = "Joker",
    order = 260,

    key = "saucy_jacky",
    config = {
        extra = {
            curr_mult = 0,
            mult_per_queen = 5,
        }
    },
    rarity = 3,
    pos = { x = 7, y = 10 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.curr_mult,
                card.ability.extra.mult_per_queen
            }
        }
    end,

    calculate = function(self, card, context)
        if context.after and context.scoring_hand and not context.blueprint then
            local queens = {}
            local destroyed_queen = false
            for i = 1, #context.scoring_hand do
                if context.scoring_hand[i]:get_id() == 12 then
                    table.insert(queens, context.scoring_hand[i])
                    card.ability.extra.curr_mult = card.ability.extra.curr_mult + card.ability.extra.mult_per_queen
                    destroyed_queen = true
                end
            end
            SMODS.destroy_cards(queens)
            if destroyed_queen then
                return {
                    message = localize('k_upgrade_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 11 and card.ability.extra.curr_mult > 0 then
            return {
                mult = card.ability.extra.curr_mult
            }
        end
    end

}
return { name = { "Jokers" }, items = { saucy_jacky } }
