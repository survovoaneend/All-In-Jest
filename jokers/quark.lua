SMODS.Joker {
    key = "quark",
    config = {
      
    },
    loc_txt = {
      name = "Quark",
      text ={
          'Levels up {C:attention}Three of a Kind{} if the',
            'played hand is exactly {C:attention}three{}',
            'cards of the {C:attention}same rank',
            'but {C:attention}different suits{}.'
      },
  },
    rarity = 2,
    pos = { x = 16, y = 3 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
  
    loc_vars = function(self, info_queue, card)
  
    end,
  
    calculate = function(self, card, context)
        if context.before and context.scoring_hand then
            if context.poker_hands and next(context.poker_hands['Three of a Kind']) then
                if #context.scoring_hand == 3 then
                    local suits_present = {}
                    local all_different_suits = true
                    for _, scoring_card in ipairs(context.scoring_hand) do
                        if scoring_card.base.suit then
                            if suits_present[scoring_card.base.suit] then
                                all_different_suits = false
                                break 
                            else
                                suits_present[scoring_card.base.suit] = true
                            end
                        else
                            all_different_suits = false
                            break
                        end
                    end
                    if all_different_suits then
                        level_up_hand(card, 'Three of a Kind', false, 1)
                        return true 
                    end
                end
            end
        end

        return nil
    end
  }