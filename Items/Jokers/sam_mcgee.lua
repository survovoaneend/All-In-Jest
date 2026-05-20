local sam_mcgee = {
    object_type = "Joker",
    order = 469,
    key = "sam_mcgee",
    
    config = {
        extra = {
            threshold = 5,
            gain = 1 
        }
    },
    rarity = 2,
    pos = { x = 11, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.threshold,
                card.ability.extra.gain
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if #context.full_hand > card.ability.extra.threshold then
                local extra_cards = #context.full_hand - card.ability.extra.threshold
                return {
                    xmult = 1 + (extra_cards * card.ability.extra.gain)
                }
            end
        end
    end,

    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_aij_ice"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { sam_mcgee } }
