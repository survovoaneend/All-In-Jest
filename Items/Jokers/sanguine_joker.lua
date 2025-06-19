local sanguine_joker = {
    object_type = "Joker",
    order = 349,
    
    key = "sanguine_joker",
    config = {
        extra = {
            odds = 10
        }
    },
    rarity = 3,
    pos = { x = 19, y = 13},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.GAME.probabilities.normal,
                card.ability.extra.odds
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit("Hearts") and pseudorandom('sanguine_joker') < G.GAME.probabilities.normal/card.ability.extra.odds then
                return {
                    focus = card,
                    message = localize('aij_plus_tag'),
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            trigger = 'before',
                            delay = 0.0,
                            func = (function()
                                jest_add_tag(jest_poll_tag("sanguine_tag"))
                                return true
                            end)
                        }))
                    end,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {sanguine_joker} }
