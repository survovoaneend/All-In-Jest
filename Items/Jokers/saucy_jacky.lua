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
    attributes = { 'mult', 'scaling', 'destroy_card', 'rank', 'jack', 'queen' },
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
                    destroyed_queen = true
                end
            end
            SMODS.destroy_cards(queens)
            if destroyed_queen then
                SMODS.scale_card(card, {
                    ref_table = card.ability.extra,
                    ref_value = "curr_mult",
                    scalar_value = "mult_per_queen",
                    operation = function(ref_table, ref_value, initial, change)
                        ref_table[ref_value] = initial + change * #queens
                    end,
                })
                return nil, true
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
