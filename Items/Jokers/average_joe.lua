local average_joe = {
    object_type = "Joker",
    order = 150,
    
    key = "average_joe",
    config = {
      extra = {
        percent = 20
      }
    },
    rarity = 2,
    pos = { x = 19, y = 5 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = {
          card.ability.extra.percent
        }
      }
    end,
  
    calculate = function(self, card, context)
      if context.joker_main then
        -- balance_percent(context.blueprint_card or card,(card.ability.extra.percent*0.01))
        return {
            aij_balance_percent = card.ability.extra.percent * 0.01
        }
      end
    end,
    in_pool = function(self, args)
        if G.GAME then
            if G.GAME.selected_back.effect.center.key ~= 'b_plasma' then
                return true
            end
        end
        return false
    end,
  
}
return { name = {"Jokers"}, items = {average_joe} }
