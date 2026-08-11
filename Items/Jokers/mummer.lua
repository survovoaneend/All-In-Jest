local mummer = {
  object_type = "Joker",
  order = 161,

  key = "mummer",
  config = {
    triggers = "0"
  },
  attributes = { 'trigger_cards', 'enhancements' },
  rarity = 3,
  pos = { x = 2, y = 6 },
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
    info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
  end,

  in_pool = function(self, args)
    if G.deck then
      if #G.deck.cards > 0 then
        for i = 1, #G.deck.cards do
          if SMODS.has_enhancement(G.deck.cards[i], 'm_steel') then
            return true
          end
        end
      end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.repetition and context.cardarea == G.hand then
      if SMODS.has_enhancement(context.other_card, 'm_steel') then
        local steel_count = 0
        if context.scoring_hand then
          for _, scoring_card in ipairs(context.scoring_hand) do
            if SMODS.has_enhancement(scoring_card, 'm_steel') then
              steel_count = steel_count + 1
            end
          end
        end

        if steel_count > 0 then
          return {
            message = localize('k_again_ex'),
            repetitions = steel_count,
            card = card
          }
        end
      end
    end
  end
}
return { name = { "Jokers" }, items = { mummer } }
