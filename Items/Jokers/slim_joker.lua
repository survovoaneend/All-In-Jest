local slim_joker = {
    object_type = "Joker",
    order = 51,
     
    key = "slim_joker",
    config = {
      extra = {
        initial_mult = 24,
        mult_mod = 4
      }
    },
    rarity = 1,
    pos = { x = 22, y = 1 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    pixel_size = { w = 59, h = 93 },
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.initial_mult,
                card.ability.extra.mult_mod
            }
        }
    end,
  
    calculate = function(self, card, context)
        if context.joker_main then
            local _mult = 0
            _mult = card.ability.extra.initial_mult - card.ability.extra.mult_mod * #context.full_hand
            if _mult > 0 then 
                return {
                    mult = _mult
                }
            end
        end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" }
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local played_hand = JokerDisplay.current_hand
                card.joker_display_values.mult = card.ability.extra.initial_mult - card.ability.extra.mult_mod * #played_hand
            end
        }
    end
  
}
return { name = {"Jokers"}, items = {slim_joker} }
