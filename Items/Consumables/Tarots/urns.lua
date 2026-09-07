local urns = {
    object_type = "Consumable",
	key = 'urns',
	set = 'Tarot',
	pos = { x = 16, y = 2 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 13,
	config = { max_highlighted = 1, ran_cards = 3 },
	attributes = {'modify_card', 'destroy_card', 'enhancements'},
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlighted,
				card.ability.ran_cards,
			}
		}
	end,
	can_use = function(self, card)
    if G.hand and #G.hand.cards >= card.ability.ran_cards and (#G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0) then
			for _, v in pairs(G.hand.highlighted) do
				if v.config.center == G.P_CENTERS.c_base or SMODS.is_eternal(v, {destroy_cards = true}) then
					return false
				end
			end
      return true
    end
  end,
	use = function(self, card)
    for i = 1, #G.hand.highlighted do
      local leftmost = G.hand.highlighted[1]
      for i=1, #G.hand.highlighted do
        if G.hand.highlighted[i].T.x < leftmost.T.x and not G.hand.highlighted[i].getting_sliced then
          leftmost = G.hand.highlighted[i]
        end
      end

      local center_key = leftmost.config.center.key
      local other_center_key = nil
      if leftmost.config.aij_other_center then
          other_center_key = v.config.aij_other_center['center'].key
      end

      SMODS.destroy_cards(leftmost)

      local valid_cards = {}
      for _, v in pairs(G.hand.cards) do
        if not v.highlighted and not SMODS.has_enhancement(v, center_key)  then
          valid_cards[#valid_cards+1] = v
        end
      end
      local selected_cards = {}
      for _ = 1, card.ability.ran_cards do
        local cur_card = pseudorandom_element(valid_cards, pseudoseed('urns'))
        for k, v in pairs(valid_cards) do
          if v == cur_card then
            valid_cards[k] = nil
          end
        end
        selected_cards[#selected_cards+1] = cur_card
      end

      G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
        play_sound('tarot1')
        card:juice_up(0.3, 0.5)
        return true
      end }))

      for j=1, #selected_cards do
        local percent = 1.15 - (j-0.999)/(#selected_cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
          selected_cards[j]:flip()
          play_sound('card1', percent)
          selected_cards[j]:juice_up(0.3, 0.3)
          return true
        end }))
      end
      
      G.E_MANAGER:add_event(Event({
        func = function()
          for j = 1, #selected_cards do
            selected_cards[j]:set_ability(G.P_CENTERS[center_key])
            if other_center_key then
              All_in_Jest.set_other_enhancement(selected_cards[j], other_center_key)
            end
          end
          return true
        end
      }))

      for j=1, #selected_cards do
        local percent = 0.85 + (j-0.999)/(#selected_cards-0.998)*0.3
        G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function() 
          selected_cards[j]:flip()
          play_sound('tarot2', percent, 0.6)
          selected_cards[j]:juice_up(0.3, 0.3)
          return true
        end }))
      end
    end
  end,
}
return {name = {"Tarots"}, items = {urns}}
