local crab_in_a_bucket = {
    object_type = "Joker",
    order = 432,
    key = "crab_in_a_bucket",
    
    config = {
        extra = {
            chips  = 8
        }
    },
    rarity = 1,
    pos = { x = 10, y = 20 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local diff = 0
        if G.playing_cards then 
            diff = math.max(0, #G.playing_cards - G.GAME.starting_deck_size)
        end
        return {
            vars = {
                card.ability.extra.chips,
                G.GAME.starting_deck_size or 52,
                diff * card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local diff = math.max(0, #G.playing_cards - G.GAME.starting_deck_size)
            if diff > 0 then
                return {
                    chips = diff * card.ability.extra.chips
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { crab_in_a_bucket } }
