local comedy_of_errors = {
    object_type = "Joker",
    order = 258,
    lite = true,
    key = "comedy_of_errors",
    config = {
      extra = {
        dollars = 1
      }
    },
    rarity = 1,
    pos = { x = 5, y = 10},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.discard then 
            if context.other_card:is_suit("Hearts") then
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
                G.E_MANAGER:add_event(Event({func = (function() G.GAME.dollar_buffer = 0; return true end)}))
                return {
                    dollars = card.ability.extra.dollars
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {comedy_of_errors} }