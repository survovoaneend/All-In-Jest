local glasgow_smile = {
    object_type = "Joker",
    order = 479,
    key = "glasgow_smile",
    
    config = {
        extra = {
            chips = 0,
            gain = 30
        }
    },
    rarity = 2,
    pos = { x = 20, y = 23 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.gain
            }
        }
    end,
    in_pool = function(self, args)
        if G.deck then
            if #G.deck.cards > 0 then
                for i = 1, #G.deck.cards do
                    if G.deck.cards[i].config.center == G.P_CENTERS["m_bonus"] then
                        return true
                    end
                end
            end
        end
        return false
    end,

    calculate = function(self, card, context)
        if context.after and not context.blueprint then
            if G.GAME.current_round.hands_played == 0 and #context.full_hand == 1 then
                 local played_card = {context.full_hand[1]}
                 if played_card[1].config.center == G.P_CENTERS.m_bonus then
                     card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.gain
                     
                     G.E_MANAGER:add_event(Event({
                        func = function()
                            played_card[1]:start_dissolve()
                            SMODS.destroy_cards(played_card)
                            return true
                        end
                    }))
                    return {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.CHIPS
                    }
                 end
            end
        end
         if context.individual and context.cardarea == G.play then
            if context.other_card.config.center == G.P_CENTERS.m_bonus and card.ability.extra.chips > 0 then
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { glasgow_smile } }
