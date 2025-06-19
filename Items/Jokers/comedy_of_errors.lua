local comedy_of_errors = {
    object_type = "Joker",
    order = 258,
    
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
            if not context.other_card.debuff and context.other_card:is_suit("Hearts") then
                ease_dollars(card.ability.extra.dollars)
                return {
                    message = localize('$')..card.ability.extra.dollars,
                    colour = G.C.MONEY,
                    card = card
                }
            end
        end
    end
  
}
return { name = {"Jokers"}, items = {comedy_of_errors} }
