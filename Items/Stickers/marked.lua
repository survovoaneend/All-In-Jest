local marked = {
  object_type = "Sticker",
  key = "marked",
	config = { aij = { pc_sticker = true }, extra = {  } },
	atlas = "stickers_atlas",
	order = 4,
	pos = {x = 0, y = 0},
	badge_colour = HEX('d95763'),
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
}
return {name = {"Stickers"}, items = {marked}}