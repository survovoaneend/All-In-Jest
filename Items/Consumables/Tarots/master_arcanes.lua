local master_arcanes = {
    object_type = "Consumable",
	key = 'master_arcanes',
	set = 'Tarot',
	 
	pos = { x = 4, y = 6 },
	cost = 3,
	unlocked = true,
	discovered = false,
	order = 4,
	config = { },
	atlas = 'consumable_atlas',
	loc_vars = function(self, info_queue, card)
		
	end,
	can_use = function(self, card, area, copier)
        if #G.consumeables.cards <= G.consumeables.config.card_limit or self.area == G.consumeables then 
            return true 
        end
    end,
    use = function(self, card)
        create_consumable("Spectral", nil, nil, nil)
    end,
}
return {name = {"Tarots"}, items = {master_arcanes}}