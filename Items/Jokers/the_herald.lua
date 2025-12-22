local the_herald = {
    object_type = "Joker",
    order = 497,

    key = "the_herald",
    config = {
        extra = {
            
        }
    },
    rarity = 3,
    pos = { x = 3, y = 24 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local most_played_hand = nil
        local val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible then
                val = v.played
                most_played_hand = k
            end
        end
        return {
            vars = {
                most_played_hand or "Hand"
            }
        }
    end,

    calculate = function(self, card, context)
        if context.poker_hands and context.scoring_hand then
            local most_played_hand = nil
            local val = 1
            for k, v in pairs(G.GAME.hands) do
                if v.played >= val and v.visible then
                    val = v.played
                    most_played_hand = k
                end
            end
            if most_played_hand and not next(context.poker_hands[most_played_hand]) then
                table.insert(context.poker_hands[most_played_hand], context.scoring_hand)
            end
        end
    end
}
return { name = { "Jokers" }, items = { the_herald } }
