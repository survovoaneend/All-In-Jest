local the_god = {
  object_type = "Blind",
  key = 'the_god',

  boss = {
    min = 1,
  },
  mult = 2,
  boss_colour = HEX("9badaf"),
  atlas = 'blinds',
  pos = { X = 0, y = 48 },
  order = 31,
  dollars = 5,


  calculate = function(self, blind, context)

  end,
  -- just ortalab's The Tarot
  -- Copied code from evaluate_play in state_events.lua
  debuff_hand = function(self, cards, hand, handname, check)
    local _, _, _,scoring_hand, _ = G.FUNCS.get_poker_hand_info(cards)
    local final_scoring_hand = {}
    for i = 1, #cards do
      local splashed = SMODS.always_scores(cards[i]) or next(find_joker('Splash'))
      local unsplashed = SMODS.never_scores(cards[i])
      if not splashed then
        for _, card in pairs(scoring_hand) do
          if card == cards[i] then splashed = true end
        end
      end
      local effects = {}
      SMODS.calculate_context({ modify_scoring_hand = true, other_card = cards[i], full_hand = cards, scoring_hand = scoring_hand, in_scoring = true }, effects)
      local flags = SMODS.trigger_effects(effects, cards[i])
      if flags.add_to_hand then splashed = true end
      if flags.remove_from_hand then unsplashed = true end
      if splashed and not unsplashed then table.insert(final_scoring_hand, cards[i]) end
    end
    if #final_scoring_hand ~= #cards then
      G.GAME.blind.triggered = true
      return true
    end
  end,

}
return { name = { "Blinds" }, items = { the_god } }
