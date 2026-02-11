local plutonium = {
    object_type = "Joker",
    order = 562,
    key = "plutonium",

    config = {
        extra = {
            retriggers = 2
        }
    },
    rarity = 1,
    pos = { x = 0, y = 27 },
    atlas = 'joker_atlas',
    cost = 4,
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
        if context.repetition and context.cardarea == G.play and context.scoring_name == "High Card" then
            return {
                repetitions = card.ability.extra.retriggers
            }
        end
    end
}

return { name = { "Jokers" }, items = { plutonium } }
