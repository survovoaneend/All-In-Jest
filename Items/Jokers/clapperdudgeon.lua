local clapperdudgeon = {
    object_type = "Joker",
    order = 585,
    key = "clapperdudgeon",
  
    config = {
        extra = {
            xmult = 3,
            max_dollars = 4
        }
    },
    rarity = 2,
    pos = { x = 23, y = 27 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.max_dollars } }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
            if (G.GAME.dollars or 0) <= card.ability.extra.max_dollars then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { clapperdudgeon } }