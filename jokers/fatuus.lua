SMODS.Joker {
  key = "fatuus",
  config = {
      extra = {}
  },
  loc_txt = {
      name = "Fatuus",
      text = {
          'If played hand contains only',
          '{C:attention}Kings{} and {C:attention}Queens{}, apply a',
          '{C:blue}Blue Seal{} to a random', 
          'card in hand.',
  
      },
  },
  rarity = 2, 
  pos = { x = 3, y = 7 }, 
  atlas = 'joker_atlas',   
  cost = 6,
  unlocked = true,
  discovered = true,
  blueprint_compat = false, 
  eternal_compat = true, 

  loc_vars = function(self, info_queue, card)
      info_queue[#info_queue + 1] = {set = 'Other', key = 'blue_seal'}
      return {}
  end,

  calculate = function(self, card, context)
      if context.before and context.full_hand and #context.full_hand > 0 and not context.blueprint then

          local only_kings_queens = true
          for _, played_card in ipairs(context.full_hand) do
              local rank_id = played_card:get_id()
              if rank_id ~= 13 and rank_id ~= 12 then
                  only_kings_queens = false
                  break 
              end
          end

          if only_kings_queens then
              local eligible_cards_in_hand = {}
              if G.hand and G.hand.cards then
                  for _, hand_card in ipairs(G.hand.cards) do
                      if not hand_card:get_seal(true) then
                          table.insert(eligible_cards_in_hand, hand_card)
                      end
                  end
              end

              if #eligible_cards_in_hand > 0 then
                  local target_card = pseudorandom_element(eligible_cards_in_hand, pseudoseed('fatuus_target'))
                  if target_card then
                       return {
                        trigger = 'before',
                        delay = 1,
                          func = function()
                              card:juice_up(0.5, 0.5)   
                              target_card:set_seal('Blue') 
                          end,
                          card = card
                      }
                  end
              end
          end
      end
  end
}