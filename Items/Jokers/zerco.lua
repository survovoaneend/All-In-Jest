local zerco = {
    object_type = "Joker",
    order = 278,

    key = "zerco",
    config = {
      
    },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 2, y = 6},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 2, y = 7},
  
    loc_vars = function(self, info_queue, card)
      info_queue[#info_queue+1] = {key = 'e_negative_playing_card', set = 'Edition', config = {extra = G.P_CENTERS['e_negative'].config.card_limit} }
    end,
  
    calculate = function(self, card, context)
      if context.after and G.GAME.current_round.hands_played == 0 then
        G.E_MANAGER:add_event(Event ( {
          trigger = 'before',
          delay = 1,
          func = function()
            local _card = context.scoring_hand[1]
            if not _card.edition then
              _card:set_edition({negative = true}, true)
            end
            return true
          end } ))
      end
    end
  
}
return { name = {"Jokers"}, items = {zerco} }
