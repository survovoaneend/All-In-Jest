local sleepy_joker = {
    object_type = "Joker",
    order = 8,
 

    key = "sleepy_joker",
    config = {
      extra = {
        xmult = 2
      }
    },
    rarity = 2,
    pos = { x = 6, y = 0 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            if context.full_hand and #context.full_hand > 0 then
                local all_dark_suits = true
                for _, played_card in ipairs(context.full_hand) do
                    if not (played_card:is_suit('Spades', true) or played_card:is_suit('Clubs', true)) then
                        -- BUG: debuffed cards/wilds not handled correctly
                        all_dark_suits = false
                        break
                    end
                end

                if all_dark_suits then
                    return {
                        xmult = card.ability.extra.xmult
                    }
                end
            end
        end
        return nil
    end,
    
    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                {
                    border_nodes = {
                        { text = "X" },
                        { ref_table = "card.joker_display_values", ref_value = "x_mult", retrigger_type = "exp" }
                    }
                }
            },
            calc_function = function(card)
                local all_dark_suits = true
                for _, played_card in ipairs(JokerDisplay.current_hand) do
                    if not (played_card:is_suit('Spades', true) or played_card:is_suit('Clubs', true)) then
                        all_dark_suits = false
                        break
                    end
                end

                card.joker_display_values.x_mult = all_dark_suits and card.ability.extra.xmult or 1
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {sleepy_joker} }
