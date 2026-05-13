local pinhead = {
    object_type = "Joker",
    order = 107,

    key = "pinhead",
    config = {
      extra = {
        money = 8
      }
    },
    rarity = 2,
    pos = { x = 2, y = 4 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return {
        vars = { card.ability.extra.money }
      }
    end,

    calc_dollar_bonus = function(self, card)
      if G.GAME.current_round.hands_played == 1 then
        local dollar_bonus = card.ability.extra.money
        return dollar_bonus
      end
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+$" },
                { ref_table = "card.joker_display_values", ref_value = "money" },
            },
            text_config = { colour = G.C.GOLD },
            reminder_text = {
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
            },
            calc_function = function(card)
                card.joker_display_values.localized_text = "(" .. localize("k_round") .. ")"
                card.joker_display_values.money = (G.GAME.current_round.hands_played == 0 or (G.GAME.current_round.hands_played == 1 and G.STATE == G.STATES.HAND_PLAYED)) and card.ability.extra.money or 0
            end
        }
    end,
}
return { name = {"Jokers"}, items = {pinhead} }
