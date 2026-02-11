local pedestrian = {
    object_type = "Joker",
    order = 372,
    key = "pedestrian",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 24, y = 16 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            
            local current_index = nil
            for i, v in ipairs(context.scoring_hand) do
                if v == context.other_card then
                    current_index = i
                    break
                end
            end

            if current_index and current_index > 1 then
                local previous_card = context.scoring_hand[current_index - 1]

                if context.other_card:get_id() > previous_card:get_id() then
                    return {
                        repetitions = 1,
                    }
                end
            end
        end
    end
}

return { name = { "Jokers" }, items = { pedestrian } }
