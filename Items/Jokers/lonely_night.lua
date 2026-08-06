local lonely_night = {
    object_type = "Joker",
    order = 415,
    key = "lonely_night",
   
    config = {
        extra = {
            
        }
    },
    attributes = { 'retrigger', 'joker_slot' },
    rarity = 2,
    pos = { x = 2, y = 16 },
    atlas = 'joker_atlas',
    cost = 7,
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
         if context.repetition then
            if #G.jokers.cards < G.jokers.config.card_limit then
                return {
                    repetitions = 1,
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { lonely_night } }
