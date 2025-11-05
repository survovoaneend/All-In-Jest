local magick_joker = {
  object_type = "Joker",
  order = 88,
  key = "magick_joker",
  config = {
    current_suit = "Spades",
    _saved_chip_values = {}
  },
  rarity = 2,
  pos = { x = 8, y = 3 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    local suit = G.GAME.current_round.jest_magick_joker_card and G.GAME.current_round.jest_magick_joker_card.suit or "Spades"
    return {
      vars = {
        localize(suit, "suits_plural"),
        colours = { G.C.SUITS[suit] },
      }
    }
  end,

  calculate = function(self, card, context)
    -- Effect is in lovely patch on eval_card() in common_events.lua
  end,

  joker_display_def = function(JokerDisplay)
        ---@type JDJokerDefinition
        return {
            text = {
                { text = "+" },
                { ref_table = "card.joker_display_values", ref_value = "mult" },
            },
            text_config = { colour = G.C.MULT },
            calc_function = function(card)
                local suit = G.GAME.current_round.jest_magick_joker_card and G.GAME.current_round.jest_magick_joker_card.suit or "Spades"
                local count = 0
                active = false
                local text, _, scoring_hand = JokerDisplay.evaluate_hand()
                if text ~= 'Unknown' then
                    for _, scoring_card in pairs(scoring_hand) do
                        if scoring_card:is_suit(suit) then
                            count = count + scoring_card:get_chip_bonus()
                        end
                    end
                end
                card.joker_display_values.mult = count
            end
        }
    end,

}
return { name = { "Jokers" }, items = { magick_joker } }
