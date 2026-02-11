local quadrangled_joker = {
    object_type = "Joker",
    order = 561,
    key = "quadrangled_joker",
    
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 24, y = 26 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.hands['Four of a Kind'].chips, 
                G.GAME.hands['Four of a Kind'].mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main and #context.full_hand == 4 then
            return {
                chips = G.GAME.hands['Four of a Kind'].chips,
                mult = G.GAME.hands['Four of a Kind'].mult
            }
        end
    end
}

return { name = { "Jokers" }, items = { quadrangled_joker } }
