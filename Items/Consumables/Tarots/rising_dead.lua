local rising_dead_tarot = {
    object_type = "Consumable",
	key = 'rising_dead',
	set = 'Tarot',
	pos = { x = 15, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 18,
	config = { max_highlighted = 2 },
	attributes = {'modify_card', 'enhancements', 'seals', 'position'},
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.max_highlighted,
			}
		}
	end,
	can_use = function(self, card)
    if G.hand and (#G.hand.highlighted == card.ability.max_highlighted) then
      local rightmost = G.hand.highlighted[1]
      for i=1, #G.hand.highlighted do if G.hand.highlighted[i].T.x > rightmost.T.x then 
        rightmost = G.hand.highlighted[i] end 
      end
      if rightmost.config.center ~= G.P_CENTERS.c_base or rightmost.seal then
        return true
      end
    end
  end,

	use = function(self, card)
		local rightmost = G.hand.highlighted[1]
		for i=1, #G.hand.highlighted do 
      if G.hand.highlighted[i].T.x > rightmost.T.x then 
        rightmost = G.hand.highlighted[i] 
      end
    end
		G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
      play_sound('tarot1')
      card:juice_up(0.3, 0.5)
      return true 
    end }))

    for i=1, #G.hand.highlighted do
      local percent = 1.15 - (i-0.999)/(#G.hand.highlighted-0.998)*0.3
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
        G.hand.highlighted[i]:flip()
        play_sound('card1', percent)
        G.hand.highlighted[i]:juice_up(0.3, 0.3)
        return true
      end }))
    end

    delay(0.2)

    G.E_MANAGER:add_event(Event({
			trigger = 'after', 
			delay = 0.4, 
      func = function()
        for i = 1, #G.hand.highlighted do
          if G.hand.highlighted[i] ~= rightmost then
            G.hand.highlighted[i]:set_ability(G.P_CENTERS[rightmost.config.center.key])
            if rightmost.config.aij_other_center and rightmost.config.aij_other_center['center'] then
              All_in_Jest.set_other_enhancement(G.hand.highlighted[i], rightmost.config.aij_other_center['center'].key)
            end
            G.hand.highlighted[i]:set_seal(rightmost.seal, true, true)
          end
        end
        return true
      end
    }))

		for i=1, #G.hand.highlighted do
      local percent = 0.85 + (i-0.999)/(#G.hand.highlighted-0.998)*0.3
      G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
        G.hand.highlighted[i]:flip()
        play_sound('tarot2', percent, 0.6)
        G.hand.highlighted[i]:juice_up(0.3, 0.3)
        return true
      end }))
    end

    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4,func = function()
      G.hand:unhighlight_all()
      return true
    end }))

    delay(0.2)
	end,
}
return {name = {"Tarots"}, items = {rising_dead_tarot}}