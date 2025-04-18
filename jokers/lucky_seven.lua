SMODS.Joker {
    key = "lucky_seven",
    config = {
      
    },
    loc_txt = {
      name = "Lucky Seven",
      text ={
          "Turn all scored {C:attention}7s{} into",
          "{C:attention}Lucky Cards{}."
      },
  },
    rarity = 2,
    pos = { x = 1, y = 0 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = G.P_CENTERS.m_lucky
    end,
  
    calculate = function(self, card, context)
      if context.before and not context.blueprint then
        local cards = {}
        for k, v in ipairs(context.scoring_hand) do
          if v:get_id() == 7 and v.config.center == G.P_CENTERS.c_base then
            cards[#cards+1] = v
            v:set_ability(G.P_CENTERS.m_lucky, nil, true)
            G.E_MANAGER:add_event(Event({
                func = function()
                    v:juice_up()
                    return true
                end
            }))
            return {
              message = 'Lucky!'
            }
          end
        end
      end
    end
  }