local second_tier_meme = {
    object_type = "Joker",
    order = 121,

    key = "second_tier_meme",
    config = {
      
    },
    rarity = 2,
    pos = { x = 16, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local most_played_hand = nil
        local second_most_played_hand = nil
        local val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible then
                val = v.played
                most_played_hand = k
            end
        end
        val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible and k ~= most_played_hand then
                val = v.played
                second_most_played_hand = k
            end
        end
        return {
            vars = {
                second_most_played_hand and localize(second_most_played_hand, "poker_hands") or localize("k_none"),
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local hand_info = G.FUNCS.get_poker_hand_info(G.play.cards)
            local most_played_hand = nil
            local second_most_played_hand = nil
            local val = 1
            for k, v in pairs(G.GAME.hands) do
                local hand_count = v.played
                if k == context.scoring_name then
                    hand_count = hand_count - 1
                end
                if hand_count >= val and v.visible then
                    val = hand_count
                    most_played_hand = k
                end
            end
            val = 1
            for k, v in pairs(G.GAME.hands) do
                local hand_count = v.played
                if k == context.scoring_name then
                    hand_count = hand_count - 1
                end
                if hand_count >= val and v.visible and k ~= most_played_hand then
                    val = hand_count
                    second_most_played_hand = k
                end
            end
            if hand_info == second_most_played_hand then
                return {
                    message = localize('k_again_ex'),
                    repetitions = 1,
                    card = card
                }
            end
        end
    end
}
return { name = {"Jokers"}, items = {second_tier_meme} }
