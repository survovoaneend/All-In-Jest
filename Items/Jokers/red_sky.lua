local red_sky = {
  object_type = "Joker",
  order = 125,
  lite = true,
  key = "red_sky",
  config = {

  },
  rarity = 2,
  pos = { x = 19, y = 4 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

  end,

  calculate = function(self, card, context)
    -- Effect is in lovely patch on eval_card() in common_events.lua
  end,

  joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult", retrigger_type = "mult" },
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local active = false
                if (G.GAME.current_round.hands_played == 0 or (G.GAME.current_round.hands_played == 1 and G.STATE == G.STATES.HAND_PLAYED) or G.GAME.current_round.hands_left == 0 or (G.GAME.current_round.hands_left == 1 and G.STATE ~= G.STATES.HAND_PLAYED)) then
                    active = true
                end
                local count = 0
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' and active then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:get_id() > 0 and not scoring_card.debuff then
                            count = count + scoring_card:get_id()
                        end
                    end
                end
                card.joker_display_values.mult = count
            end,
        }
    end,

}
return { name = { "Jokers" }, items = { red_sky } }
