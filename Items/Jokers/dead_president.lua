local dead_president = {
    object_type = "Joker",
    order = 120,

    key = "dead_president",
    config = {
      
    },
    rarity = 1,
    pos = { x = 15, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    pixel_size = { w = 46, h = 95 },
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.selling_self then
          local my_pos = -1
          for i = 1, #G.jokers.cards do
              if G.jokers.cards[i] == card then
                  my_pos = i
                  break
              end
          end
          if my_pos > 0 then
              local left_joker = G.jokers.cards[my_pos - 1] 
              local right_joker = G.jokers.cards[my_pos + 1]

              local juiced = false 

              if left_joker then
                  if left_joker.sell_cost > 0 and left_joker ~= card then
                      left_joker.ability.extra_value = (left_joker.ability.extra_value or 0) + left_joker.sell_cost 
                      left_joker:set_cost() 
                      left_joker:juice_up(0.5, 0.3) 
                      card_eval_status_text(left_joker, 'extra', nil, nil, nil, {
                          message = 'Value Up!',
                          colour = G.C.MONEY
                      })
                      juiced = true
                  end
              end

              if right_joker then
                  if right_joker.sell_cost > 0 and right_joker ~= card then
                      right_joker.ability.extra_value = (right_joker.ability.extra_value or 0) + right_joker.sell_cost
                      right_joker:set_cost()
                      right_joker:juice_up(0.5, 0.3)
                       card_eval_status_text(right_joker, 'extra', nil, nil, nil, {
                          message = 'Value Up!',
                          colour = G.C.MONEY
                      })
                      juiced = true
                  end
              end

              if juiced then
                  return true
              end
          end
      end

      return nil
  end
}
return { name = {"Jokers"}, items = {dead_president} }
