local mike_check = {
    object_type = "Joker",
    order = 363,
    
    key = "mike_check",
    config = {
        extra = {
            count = 0,
            target = 3
        }
    },
    rarity = 2,
    pos = { x = 21, y = 19},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.target,
                card.ability.extra.count
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == 'Joker' and not context.blueprint then
            card.ability.extra.count = card.ability.extra.count + 1
            
            if card.ability.extra.count >= card.ability.extra.target then
                card.ability.extra.count = 0
                if #G.jokers.cards + G.GAME.joker_buffer < G.jokers.config.card_limit then
                    G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.add_card({
                                set = 'Joker',
                                rarity = 'Uncommon',
                                key_append = 'mike_check'
                            })
                            G.GAME.joker_buffer = 0
                            return true
                        end
                    }))
                    return {
                        message = localize('k_plus_joker'),
                        card = card
                    }
                end
            else
                return {
                    message = card.ability.extra.count .. "/" .. card.ability.extra.target,
                    colour = G.C.CHIPS,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {mike_check} }
