local uranium = {
    object_type = "Joker",
    order = 563,
    key = "uranium",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 1, y = 27 },
    atlas = 'joker_atlas',
    cost = 6,
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
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Two Pair" then
            return {
                repetitions = 1
            }
        end
    end
}

return { name = { "Jokers" }, items = { uranium } }
