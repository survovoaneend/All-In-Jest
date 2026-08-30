local twilight_tarot = {
    object_type = "Consumable",
	key = 'twilight',
	set = 'Tarot',
	pos = { x = 13, y = 8 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 17,
	config = { 
		extra = {
			dollars_per_level = 2,
			max = 50
		}
	},
    attributes = {'economy', 'hand_type'},
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		local level = 1
        local most_played_hand = nil
        local val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible then
                val = v.played
                most_played_hand = k
            end
        end
        card.ability.extra.hand = most_played_hand or "None"
        
        if most_played_hand then
            level =  G.GAME.hands[most_played_hand].level or 1
        end

        local money = math.min(level * card.ability.extra.dollars_per_level, card.ability.extra.max)
        local hand_name = most_played_hand and localize(most_played_hand, 'poker_hands') or localize('k_none')

        return { vars = { card.ability.extra.dollars_per_level, card.ability.extra.max, money, hand_name } }
	end,
	can_use = function(self, card, area, copier)
		return true
	end,
	use = function(self, card)
		local level = 1
        local most_played_hand = nil
        local val = 1
        for k, v in pairs(G.GAME.hands) do
            if v.played >= val and v.visible then
                val = v.played
                most_played_hand = k
            end
        end

        if most_played_hand then
            level = G.GAME.hands[most_played_hand].level or 1
        end

        local money = math.min(level * card.ability.extra.dollars_per_level, card.ability.extra.max)

        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('timpani')
                card:juice_up(0.3, 0.5)
                ease_dollars(money, true)
                return true
            end
        }))
        delay(0.6)
	end,
}
return {name = {"Tarots"}, items = {twilight_tarot}}