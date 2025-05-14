local osiris = {
    object_type = "Consumable",
	key = 'osiris',
	set = 'Tarot',
	pos = { x = 6, y = 0 },
	cost = 3,
     ignore = true,
	unlocked = true,
	discovered = false,
	order = 6,
	config = { money = 0, },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		return { vars = { card.ability.money } }
	end,
	can_use = function(self, card, area, copier)
        if G.jokers.highlighted and (#G.jokers.highlighted == 1) and G.jokers.highlighted[1] and not G.jokers.highlighted[1].ability["eternal"] then
            local self_card = G.jokers.highlighted[1]
            card.ability.money = 0
            card.ability.money = card.ability.money + (self_card.sell_cost * 3)
            card.ability.money = card.ability.money
            return true  
        end
    end,
    use = function(self, card)
        local self_card = G.jokers.highlighted[1]
        card.ability.money = 0
        card.ability.money = card.ability.money + (self_card.sell_cost * 3)
        card.ability.money = card.ability.money
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('timpani')
            card:juice_up(0.3, 0.5)
            ease_dollars(card.ability.money, true)
            return true end }))
        self_card:start_dissolve()
        delay(0.6)
    end,
}
return {name = {"Tarots"}, items = {osiris}}