local richie_rich = {
    object_type = "Joker",
    order = 237,
    
    key = "richie_rich",
    config = {
      extra = {
        dollars = 0,
        xdollars = 0.1
      }
    },
    rarity = 2,
    pos = { x = 5, y = 9},
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xdollars + 1
            }
        }
    end,
  
    calculate = function(self, card, context)
      if context.end_of_round and context.main_eval then
        card.ability.extra.dollars = math.floor(G.GAME.dollars * card.ability.extra.xdollars)
        G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + card.ability.extra.dollars
            return {
                dollars = card.ability.extra.dollars,
                remove_default_message = true,
                message = localize { type = 'variable', key = "a_aij_times_money", vars = { card.ability.extra.xdollars + 1 } },
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
return { name = {"Jokers"}, items = {richie_rich} }
