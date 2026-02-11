local neptunium = {
    object_type = "Joker",
    order = 565,
    key = "neptunium",
    
    config = {
        extra = {
            retriggers = 2
        }
    },
    rarity = 2,
    pos = { x = 3, y = 27 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.retriggers
            }
        }
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play and context.scoring_name == "Straight Flush" then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end
}

return { name = { "Jokers" }, items = { neptunium } }
