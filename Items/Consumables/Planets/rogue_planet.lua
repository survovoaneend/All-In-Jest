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
    local hands_to_upgrade = {}
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
          for j = 1, #hands_to_upgrade do
            if k == hands_to_upgrade[j] then
              should_add = false
            end
          end
          if should_add then
            table.insert(hands_to_upgrade, k)
          end
        end
      end
    end
    SMODS.upgrade_poker_hands(hands_to_upgrade)
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
