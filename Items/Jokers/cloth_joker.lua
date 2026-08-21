local cloth_joker = {
    object_type = "Joker",
    order = 785,

    key = "cloth_joker",
    config = {
        extra = {
            xmult = 2,
            dollars = 4
        }
    },
    attributes = { "queen", "xmult", "lose_economy" },
    rarity = 3,
    pos = { x = 17, y = 35},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { 
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 12 then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = -card.ability.extra.dollars,
                xmult = card.ability.extra.xmult,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = 0
                            return true
                        end
                    }))
                end
            }
        end
    end
}
return { name = {"Jokers"}, items = {cloth_joker} }