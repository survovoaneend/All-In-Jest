SMODS.Joker {
    key = "dead_president",
    config = {
      
    },
    loc_txt = {
      name = "Dead President",
      text ={
          "Sell this {C:attention}Joker{} to",
          "{C:attention}double{} the {C:money}Sell Values{}",
          "of adjacent {C:attention}Jokers"
      },
  },
    rarity = 1,
    pos = { x = 15, y = 4 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    set_ability = function(self, card, initial, delay_sprites)
      local w_scale, h_scale = 46 / 71, 95 / 95
  
      card.T.h = card.T.h * h_scale
      card.T.w = card.T.w * w_scale
    end,
  
    set_sprites = function(self, card, front)
      local w_scale, h_scale = 46 / 71, 95 / 95
  
      card.children.center.scale.y = card.children.center.scale.y * h_scale
      card.children.center.scale.x = card.children.center.scale.x * w_scale
    end,
  
    load = function(self, card, card_table, other_card)
      local w_scale, h_scale = 46 / 71, 95 / 95
  
      card.T.h = card.T.h * h_scale
      card.T.w = card.T.w * w_scale
    end,
  
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