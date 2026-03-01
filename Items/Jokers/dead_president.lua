local dead_president = {
  object_type = "Joker",
  order = 120,
  lite = true,
  key = "dead_president",
  config = {
    extra = {
      max = 50,
    }
  },
  rarity = 1,
  pos = { x = 15, y = 4 },
  atlas = 'joker_atlas',
  cost = 4,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = false,

  pixel_size = { w = 46, h = 95 },

  loc_vars = function(self, info_queue, card)
    return {
      vars = {
        card.ability.extra.max,
      }
    }
  end,

  calculate = function(self, card, context)
    if context.selling_self then
      local my_pos = -1

      local sold_card = context.blueprint_card or card

      for i = 1, #G.jokers.cards do
        if G.jokers.cards[i] == sold_card then
          my_pos = i
          break
        end
      end
      if my_pos > 0 then
        local left_joker = G.jokers.cards[my_pos - 1]
        if left_joker and left_joker.sell_cost <= 0 or left_joker == sold_card then
          left_joker = nil
        end
        local right_joker = G.jokers.cards[my_pos + 1]
        if right_joker and right_joker.sell_cost <= 0 or right_joker == sold_card then
          right_joker = nil
        end

        if left_joker or right_joker then
          -- Making this an event so retriggers animate properly
          G.E_MANAGER:add_event(Event({ --Add bonus chips from this card
            trigger = "before",
            delay = 0.75 * 1.25,
            func = function()
              play_sound("generic1", 0.98 + math.random() * 0.04, 1)
              if left_joker then
                left_joker.ability.extra_value = (left_joker.ability.extra_value or 0) + math.min(left_joker.sell_cost, card.ability.extra.max)
                left_joker:set_cost()
                left_joker:juice_up(0.5, 0.3)
                card_eval_status_text(left_joker, 'extra', nil, nil, nil, {
                  message = localize('k_val_up'),
                  colour = G.C.MONEY,
                  instant = true,
                  silent = true
                })
                juiced = true
              end
              if right_joker then
                right_joker.ability.extra_value = (right_joker.ability.extra_value or 0) + math.min(right_joker.sell_cost, card.ability.extra.max)
                right_joker:set_cost()
                right_joker:juice_up(0.5, 0.3)
                card_eval_status_text(right_joker, 'extra', nil, nil, nil, {
                  message = localize('k_val_up'),
                  colour = G.C.MONEY,
                  instant = true,
                  silent = true
                })
              end
              return true
            end
          }))

          return nil, true
        end
      end
    end

    return nil
  end
}
return { name = { "Jokers" }, items = { dead_president } }
