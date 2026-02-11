local melpomene = {
    object_type = "Joker",
    order = 1066,

    key = "melpomene",
    config = {
       
    },
    rarity = 4,
    pos = { x = 3, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 3, y = 13 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_face() then
            local hand_stats = G.GAME.hands[context.scoring_name]
            return {
                chips = to_number(hand_stats.chips),
                mult = to_number(hand_stats.mult)
            }
        end
    end,
}
return { name = { "Jokers" }, items = { melpomene } }