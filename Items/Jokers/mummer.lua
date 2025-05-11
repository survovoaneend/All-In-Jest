local mummer = {
  object_type = "Joker",
  order = 158,

  key = "mummer",
  config = {
    triggers = "0"
  },
  rarity = 3,
  pos = { x = 2, y = 6},
  atlas = 'joker_atlas',
  cost = 8,
  unlocked = true,
  discovered = false,
  blueprint_compat = false,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)
     info_queue[#info_queue + 1] = G.P_CENTERS.m_steel
  end,

  in_pool = function(self, args)
    if G.deck then
        if #G.deck.cards > 0 then
            for i = 1, #G.deck.cards do
                if G.deck.cards[i].config.center == G.P_CENTERS["m_steel"] then
                    return true
                end
            end
        end
    end
    return false
  end,

  calculate = function(self, card, context)
    if context.individual and context.cardarea == G.play then
        if context.other_card.config.center == G.P_CENTERS["m_steel"] then
            if G.hand then
                if #G.hand.cards > 0 then
                    for i = 1, #G.hand.cards do
                        if G.hand.cards[i].config.center == G.P_CENTERS["m_steel"] then
                            SMODS.calculate_effect({xmult = G.hand.cards[i].config.center.config.h_x_mult}, G.hand.cards[i])
                        end
                    end
                end
            end
        end
    end
  end
}
return { name = {"Jokers"}, items = {mummer} }
