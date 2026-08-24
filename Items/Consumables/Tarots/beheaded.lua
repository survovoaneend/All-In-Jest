local beheaded_tarot = {
    object_type = "Consumable",
	key = 'beheaded',
	set = 'Tarot',
	
	pos = { x = 11, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 15,
	config = {
		max_highlighted = 1
	},
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		info_queue[#info_queue+1] = {set = 'Other', key = 'aij_bomb'}
		return {
			vars = {
				card.ability.max_highlighted,
			}
		}
	end,
	can_use = function(self, card)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlighted and #G.hand.highlighted > 0) then
            return true
        end
    end,

    use = function(self, card, area, copier)
        local target_card = G.hand.highlighted[1]

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.15,
            func = function()
                if target_card.set_sticker then
                    target_card:set_sticker('aij_bomb', true)
                else
                    target_card.ability['aij_bomb'] = true
                end
                target_card:juice_up(0.3, 0.3)
                play_sound('gold_seal', 1.2, 0.4)
                return true
            end
        }))

        delay(0.5)
    end
}
return {name = {"Tarots"}, items = {beheaded_tarot}}