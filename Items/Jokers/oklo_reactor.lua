local oklo_reactor = {
    object_type = "Joker",
    order = 549,
    key = "oklo_reactor",
    
    config = {
        extra = {
           retriggers = 2 
        }
    },
    rarity = 2,
    pos = { x = 3, y = 22 },
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
        if context.repetition and context.cardarea == G.play then
            if SMODS.has_enhancement(context.other_card, 'm_gold') then
                return {
                    repetitions = card.ability.extra.retriggers,
                }
            end
        end
    end,
    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_gold"] then
                        return true
                    end
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { oklo_reactor } }
