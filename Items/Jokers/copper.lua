local copper = {
    object_type = "Joker",
    order = 584.3,
    key = "copper",
    
    config = {
        extra = {
            
        }
    },
    attributes = { 'retrigger', 'hand_type' },
    rarity = 1,
    pos = { x = 12, y = 27 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Three of a Kind" then
            return {
                repetitions = 1
            }
        end
    end
}

return { name = { "Jokers" }, items = { copper } }