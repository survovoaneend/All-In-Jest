local mint_condition = {
    object_type = "Sticker",
    key = "mint_condition",
	config = { extra = {  } },
	atlas = "stickers_atlas",
	order = 2,
	pos = {x = 3, y = 1},
	badge_colour = HEX('d56f7e'),
	ignore = true,
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
	sets = { Joker = true },
	rental_compat = false,
	apply = function(self, card, val)
        card.ability[self.key] = val
        if card.ability[self.key] then card:set_cost() end
		SMODS.Sticker.apply(self, card, val)
    end,
}
SMODS.Stickers['rental'].aij_mint_condition_compat = false
return {name = {"Stickers"}, items = {mint_condition}}