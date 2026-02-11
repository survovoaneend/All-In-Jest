local lonely_night = {
    object_type = "Joker",
    order = 396,
    key = "lonely_night",
   
    config = {
        extra = {
            
        }
    },
    rarity = 3,
    pos = { x = 2, y = 16 },
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
         if context.repetition and context.cardarea == G.play then
            if #G.jokers.cards < G.jokers.config.card_limit then
                return {
                    repetitions = 1,
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { lonely_night } }
