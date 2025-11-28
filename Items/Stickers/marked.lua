local marked = {
  object_type = "Sticker",
  key = "marked",
	no_collection = true,
	config = { extra = {  } },
	atlas = "stickers_atlas",
	order = 1,
	pos = {x = 0, y = 0},
	badge_colour = HEX('d95763'),
	loc_vars = function(self, info_queue, card)
		return { vars = {}}
	end,
}
return {name = {"Stickers"}, items = {marked}}