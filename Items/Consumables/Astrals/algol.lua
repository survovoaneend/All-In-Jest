local algol = {
    object_type = "Consumable",
	key = 'algol',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 10, y = 3 },
    soul_pos = { x = 10, y = 4 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 0,
	config = { hand = nil },
    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.consumeable.hand or '(hand)'
			},
		}
    end,
    can_use = function(self, card)
        return true 
    end,
	use = function(self, card, area, copier)
        
    end,
}
local algol_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'algol',
    atlas = 'consumable_atlas',
	pos = { x = 10, y = 3 },
    discovered = false,
    order = 0,
    config = {hand = nil},

    loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.astral and card.ability.astral.hand or '(hand)'
			},
		}
    end,

    apply = function(self, tag, context)
        
    end,
}
return {name = {"Astrals"}, items = {algol, algol_pin}}