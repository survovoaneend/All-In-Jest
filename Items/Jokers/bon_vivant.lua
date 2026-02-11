local bon_vivant = {
    object_type = "Joker",
    order = 587,
    key = "bon_vivant",
  
    config = {
        extra = {
            dollars = 10,
            count = 0,
            target = 10,
        }
    },
    rarity = 1,
    pos = { x = 0, y = 28 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.count,
                card.ability.extra.target
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
            card.ability.extra.count = card.ability.extra.count + 1
            if card.ability.extra.count == card.ability.extra.target then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                    end
                }
            end
        end
        if context.end_of_round and context.main_eval and not context.blueprint then
            card.ability.extra.count = 0
            return { message = localize('k_reset') }
        end
    end
}


return { name = { "Jokers" }, items = { bon_vivant } }