local rising_sun = {
    object_type = "Joker",
    order = 124,
    lite = true,
    key = "rising_sun",
    config = {
        extra = {
            retriggers = 1,
        }
    },
    rarity = 1,
    pos = { x = 18, y = 4 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.repetition and context.cardarea == G.play and (G.GAME.current_round.hands_left == 0 or G.GAME.current_round.hands_played == 0)then
        if context.other_card == context.scoring_hand[1] or context.other_card == context.scoring_hand[#context.scoring_hand] then
            return {
                message = localize('k_again_ex'),
                repetitions = card.ability.extra.retriggers,
                card = card
            }
        end
      end 
    end,

    joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            reminder_text = {
                { text = "(" },
                { ref_table = "card.joker_display_values", ref_value = "localized_text" },
                { text = ")" },
            },
            calc_function = function(card)
                local active = false
                if (G.GAME.current_round.hands_played == 0 or (G.GAME.current_round.hands_played == 1 and G.STATE == G.STATES.HAND_PLAYED) or G.GAME.current_round.hands_left == 0 or (G.GAME.current_round.hands_left == 1 and G.STATE ~= G.STATES.HAND_PLAYED)) then
                    active = true
                end
                card.joker_display_values.active = active
                card.joker_display_values.localized_text = active and localize("k_active_ex") or localize("jdis_inactive")
            end,
            retrigger_function = function(playing_card, scoring_hand, held_in_hand, joker_card)
                if held_in_hand then return 0 end
                local first_card = scoring_hand and JokerDisplay.calculate_leftmost_card(scoring_hand)
                local last_card = scoring_hand and JokerDisplay.calculate_rightmost_card(scoring_hand)
                return first_card and last_card and (playing_card == first_card or playing_card == last_card) and joker_card.joker_display_values.active and JokerDisplay.calculate_joker_triggers(joker_card) * joker_card.ability.extra.retriggers or 0
            end
        }
    end,
  
}
return { name = {"Jokers"}, items = {rising_sun} }
