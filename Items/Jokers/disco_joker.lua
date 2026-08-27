local disco_joker = {
    object_type = "Joker",
    order = 567,
    key = "disco_joker",
    config = {
        extra = {
            
        }
    },
    attributes = { 'retrigger', 'editions' },
    rarity = 2,
    pos = { x = 6, y = 26 },
    atlas = 'joker_atlas',
    lite = true,
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
        if context.repetition then
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
