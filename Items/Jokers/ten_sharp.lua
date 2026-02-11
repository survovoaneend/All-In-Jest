local ten_sharp = {
    object_type = "Joker",
    order = 434,
    key = "ten_sharp",
    
    config = {
        extra = {
            
        }
    },
    rarity = 1,
    pos = { x = 12, y = 20 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            local idx = 0
            for i, v in ipairs(context.scoring_hand) do
                if v == context.other_card then idx = i break end
            end
            
            local triggers = false
            if idx > 1 then
                if context.scoring_hand[idx-1]:get_id() == 10 then triggers = true end
            end
            if idx < #context.scoring_hand then
                if context.scoring_hand[idx+1]:get_id() == 10 then triggers = true end
            end
            
            if triggers then
                return {
                    repetitions = 1,
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { ten_sharp } }
