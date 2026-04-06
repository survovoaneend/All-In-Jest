local colour_test = {
    object_type = "Joker",
    order = 293,

    key = "colour_test",
    config = {

    },
    rarity = 3,
    pos = { x = 15, y = 11 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        if not card.edition or (card.edition and not card.edition.key == 'e_polychrome') then
            info_queue[#info_queue + 1] = G.P_CENTERS.e_polychrome
        end
    end,

    calculate = function(self, card, context)
        if context.before and context.scoring_hand and G.GAME.current_round.hands_left == 0 and not context.blueprint then
            local poly = context.scoring_hand[1]
            poly:set_edition('e_polychrome')
            return {
                message = localize('k_aij_polychrome_ex'),
            }
        end
    end

}
return { name = { "Jokers" }, items = { colour_test } }
