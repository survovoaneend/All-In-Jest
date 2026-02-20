local haggler = {
    object_type = "Joker",
    order = 604,
    key = "haggler",
  
    config = {
        extra = {
            odds = 2,
            dollars = 6
        }
    },
    rarity = 1,
    pos = { x = 18, y = 28 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'quantum_foam')
        return {
            vars = {
                numerator,
                denominator,
                card.ability.extra.dollars
            }
        }
    end,

    calculate = function(self, card, context)
        if context.discard then
            if SMODS.has_enhancement(context.other_card, 'm_gold') and SMODS.pseudorandom_probability(card, 'haggler', 1, card.ability.extra.odds) then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                return {
                    dollars = card.ability.extra.dollars,
                    func = function()
                        G.E_MANAGER:add_event(Event({ func = function() G.GAME.dollar_buffer = 0; return true end }))
                    end
                }
            end
        end
    end,
    in_pool = function(self, args) 
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_gold') then
                return true
            end
        end
        return false
    end,
}


return { name = { "Jokers" }, items = { haggler } }