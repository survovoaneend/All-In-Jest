local tin = {
    object_type = "Joker",
    order = 562.5,
    key = "tin",
    
    config = {
        extra = {
            
        }
    },
    attributes = { 'retrigger', 'hand_type' },
    rarity = 3,
    pos = { x = 14, y = 28 },
    atlas = 'joker_atlas',
    cost = 8,
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
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Flush" then
            return {
                repetitions = 1
            }
        end
    end
}

return { name = { "Jokers" }, items = { tin } }