SMODS.Joker {
    key = "atom",
    config = {
      
    },
    rarity = 2,
    pos = { x = 14, y = 1 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
      if context.before then
        if #context.full_hand == 1 and context.full_hand[1]:get_id() == 14 then
          local text = "High Card"
          level_up_hand(context.blueprint_card or card, text, nil, 1)
        end
      end
    end
  }