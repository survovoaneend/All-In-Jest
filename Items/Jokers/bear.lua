local bear = {
    object_type = "Joker",
    order = 526,
    key = "bear",
   
    config = {
        extra = {
            mult = 1,
            dollars = 100
        }
    },
    rarity = 1,
    pos = { x = 11, y = 25 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        local diff = math.max(0, card.ability.extra.dollars - G.GAME.dollars)
        local mult_to_add = math.floor(diff / 5)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.dollars,
                mult_to_add * card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local diff = math.max(0, card.ability.extra.dollars - G.GAME.dollars)
            local mult_to_add = math.floor(diff / 5)
            if mult_to_add > 0 then
                return {
                    mult = mult_to_add * card.ability.extra.mult
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { bear } }
