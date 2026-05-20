local funny_money = {
    object_type = "Joker",
    order = 250,
    lite = true,
    key = "funny_money",
    config = {
      extra = {
       dollars = 10
      }
    },
    rarity = 1,
    pos = { x = 22, y = 9},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.dollars}
        }
    end,
  
    calculate = function(self, card, context)
      if context.skip_blind then
            G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
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
return { name = {"Jokers"}, items = {funny_money} }
