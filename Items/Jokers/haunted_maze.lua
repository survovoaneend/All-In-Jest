local haunted_maze = {
    object_type = "Joker",
    order = 941,

    key = "haunted_maze",
    config = {

    },
    attributes = {'mult', 'hand_type'},
    rarity = 2,
    pos = { x = 15, y = 43},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
         if context.individual and context.cardarea == G.play and next(context.poker_hands['Straight']) then
            local straight_played = (G.GAME.hands[context.scoring_name] and G.GAME.hands[context.scoring_name].played) or 0
            if straight_played > 0 then
                return {
                    mult = straight_played
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {haunted_maze} }