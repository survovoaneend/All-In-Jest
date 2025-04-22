SMODS.Joker {
  -- Assuming 'jen' prefix based on previous examples
  key = "krampus",

  config = {
      extra = {
          dollars = 5
      }
  },

  rarity = 2,
  pos = { x = 11, y = 1 }, 
  atlas = 'joker_atlas',
  cost = 7,
  unlocked = true,
  discovered = true,


  blueprint_compat = true,
  eternal_compat = true,

  loc_vars = function(self, info_queue, card)

      info_queue[#info_queue+1] = G.P_CENTERS.m_gold
      info_queue[#info_queue+1] = G.P_CENTERS.m_stone
      return { vars = { card.ability.extra.dollars } }
  end,

  calculate = function(self, card, context)
    if context.before and not context.blueprint then
      local cards = {}
      for k, v in ipairs(context.scoring_hand) do
        if v.ability.name == 'Gold Card' then
          cards[#cards+1] = v
          v:set_ability(G.P_CENTERS.m_stone, nil, true)
          G.E_MANAGER:add_event(Event({
              func = function()
                  card:juice_up()
                  v:juice_up()
                  return true
              end
          })) 
        end
      end
      return {
        message = 'Stone',
        colour = G.C.JOKER_GREY
      }
    end
    if context.individual and context.cardarea == G.play then
      if context.other_card.ability.name == 'Stone Card' then
          local dollar_bonus = card.ability.extra.dollars
          return {
              dollars = dollar_bonus,
              card = card,
              colour = G.C.MONEY 
          }
      end
  end
  end
}