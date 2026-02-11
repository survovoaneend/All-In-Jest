local disco_joker = {
    object_type = "Joker",
    order = 548,
    key = "disco_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 6, y = 26 },
    atlas = 'joker_atlas',
    cost = 6,
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
            if context.other_card.edition then
                return {
                    repetitions = 1,
                }
            end
        end
    end,
    in_pool = function(self, args)
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.edition then
                    return true
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { disco_joker } }
