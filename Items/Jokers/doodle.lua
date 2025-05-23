local doodle = {
    object_type = "Joker",
    order = 27,

    key = "doodle",
    config = {
      extra = {
        odds = 2
      }
    },
    rarity = 3,
    pos = { x = 24, y = 0 },
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      return { vars = { 
        ''..(G.GAME and G.GAME.probabilities.normal or 1),
        card.ability.extra.odds
      } }
    end,
  --thank you unstable
  calculate = function(self, card, context)
    local my_index = nil
    for i, joker_in_area in ipairs(G.jokers.cards) do
      if joker_in_area == card then
        my_index = i
        break
      end
    end


    if not my_index or #G.jokers.cards <= 1 then
      return
    end

    local target_joker1 = nil
    local target_joker2 = nil
    local num_jokers = #G.jokers.cards

    
    if my_index then
      if my_index > 1 then
        target_joker1 = G.jokers.cards[my_index - 1]
      end
      if my_index < num_jokers then
        target_joker2 = G.jokers.cards[my_index + 1]
      end
    end
    --thank you chatgpt
    if pseudorandom('doodle' .. G.SEED) < G.GAME.probabilities.normal / card.ability.extra.odds then

      
      local effect1_def
      if target_joker1 then
        effect1_def = SMODS.blueprint_effect(card, target_joker1, context)
      end
 
      local effect2_def
      if target_joker2 then
        effect2_def = SMODS.blueprint_effect(card, target_joker2, context)
      end
 
      if effect1_def then
        if effect2_def then
          effect1_def.extra = effect2_def
        end
        return effect1_def
      elseif effect2_def then
        return effect2_def
      else
        return nil
      end
    end
    return nil, true
  end
  
}
return { name = {"Jokers"}, items = {doodle} }
