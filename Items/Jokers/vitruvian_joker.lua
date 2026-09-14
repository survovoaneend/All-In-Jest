local count_jokers = function()
	local count = 0
	if not G.jokers or not G.jokers.cards then
		return 0
	end
	for _, area in ipairs(SMODS.get_card_areas("jokers")) do
		if area.cards then
			for _, v in pairs(area.cards) do
				if v and type(v) == "table" and v.config.center.set == "Joker" then
					count = count + 1
				end
			end
		end
	end
	return count
end

local vitruvian_joker = {
	object_type = "Joker",
	order = 276,
	lite = true,
	key = "vitruvian_joker",
	config = {
		extra = {
			xmult = 2,
		},
	},
	attributes = { "xmult", "joker" },
	rarity = 2,
	pos = { x = 17, y = 10 },
	atlas = "joker_atlas",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = true,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return {
			vars = {
				card.ability.extra.xmult,
			},
		}
	end,

	calculate = function(self, card, context)
		if context.joker_main and count_jokers() == 5 then
			return {
				xmult = card.ability.extra.xmult,
			}
		end
	end,
}
return { name = { "Jokers" }, items = { vitruvian_joker } }
