local rogue_planet = {
  object_type = "Consumable",
  key = 'rogue',
  set = 'Planet',
  pos = { x = 6, y = 6 },
  cost = 3,
  unlocked = true,
  discovered = false,
  order = 33,
  config = {},
  atlas = 'consumable_atlas',
  loc_vars = function(self, info_queue, card)
    return {
      vars = {

      },
    }
  end,
  can_use = function(self, card)
    for _, k in ipairs(G.handlist) do
      local hand = G.GAME.hands[k]
      if hand.visible then
        for i = 1, #G.jokers.cards do
          local text = retrieve_joker_text(G.jokers.cards[i])
          if text:find(k) or text:find(localize(k, 'poker_hands')) then
            return true
          end
        end
      end
    end
    return false
  end,
  use = function(self, card, area, copier)
    local available_hands = {}
    local level_hands = {}
    for _, k in ipairs(G.handlist) do
      local hand = G.GAME.hands[k]
      if hand.visible or k == "aij_Royal Flush" then
        available_hands[#available_hands + 1] = k
      end
    end
    for _, k in ipairs(available_hands) do
      for i = 1, #G.jokers.cards do
        local text = retrieve_joker_text(G.jokers.cards[i])
        local like_hands = {}
        local should_add = true
        for _, v in ipairs(available_hands) do
          if (v:find(k) or v:find(localize(k, 'poker_hands'))) and v ~= k then
            like_hands[#like_hands + 1] = v
          end
        end
        for _, v in ipairs(like_hands) do
          if text:find(v) or text:find(localize(v, 'poker_hands')) then
            should_add = false
          end
        end
        if (text:find(k) or text:find(localize(k, 'poker_hands'))) and should_add then
          for j = 1, #level_hands do
            if k == level_hands[j] then
              should_add = false
            end
          end
          if should_add then
            table.insert(level_hands, k)
          end
        end
      end
    end
    for _, k in ipairs(level_hands) do
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 0.8, delay = 0.3 },
        { handname = localize(k, 'poker_hands'), chips = G.GAME.hands[k].chips, mult = G.GAME.hands[k].mult, level = G
        .GAME.hands[k].level })
      level_up_hand(card, k)
      update_hand_text({ sound = 'button', volume = 0.7, pitch = 1.1, delay = 0 },
        { mult = 0, chips = 0, handname = '', level = '' })
    end
  end,
  in_pool = function(self, args)
    if G.GAME and G.jokers then
      for _, k in ipairs(G.handlist) do
        local hand = G.GAME.hands[k]
        if hand.visible then
          for i = 1, #G.jokers.cards do
            local text = retrieve_joker_text(G.jokers.cards[i])
            if text:find(k) or text:find(localize(k, 'poker_hands')) then
              return true
            end
          end
        end
      end
    end
    return false
  end,
  aij_weight = function(self)
    return -3
  end,
}
return { name = { "Planets" }, items = { rogue_planet } }
