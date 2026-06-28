local scopophobia = {
    object_type = "Consumable",
	key = 'scopophobia',
	set = 'Spectral',
    atlas = 'consumable_atlas',
	pos = { x = 0, y = 7 },
	cost = 4,
    ignore = true,
	unlocked = true,
	discovered = false,
    order = 8,
	config ={},
    can_use = function(self, card)
    end,
	use = function(self, card, area, copier)
    end,
}
return {name = {"Spectrals"}, items = {scopophobia}}