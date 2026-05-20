local rock_n_roll_clown = {
    object_type = "Joker",
    order = 365,
    
    key = "rock_n_roll_clown",
    config = {
        extra = {
            chips_per_level = 1
        }
    },
    rarity = 1,
    pos = { x = 23, y = 19},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        local total_level = 0
        for _, hand_data in pairs(G.GAME.hands) do
            if hand_data.visible then
                total_level = total_level + hand_data.level
            end
        end

        return {
            vars = {
                card.ability.extra.chips_per_level,
                total_level * card.ability.extra.chips_per_level
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local total_level = 0
            
            for _, hand_data in pairs(G.GAME.hands) do
                if hand_data.visible then
                    total_level = total_level + hand_data.level
                end
            end
            
            if total_level > 0 then
                return {
                    chips = total_level * card.ability.extra.chips_per_level
                }
            end
        end

    end
  
}
return { name = {"Jokers"}, items = {rock_n_roll_clown} }
