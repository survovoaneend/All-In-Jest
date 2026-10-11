local joker_retextures = {
	object_loader = "Global",
	object_type = AltTexture,
	key = "joker_retextures",
	set = "Joker",
	path = "joker_retextures.png",
	keys = { "j_yorick", "j_chaos" },
	soul_keys = { "j_yorick" },
}

local texture_pack = {
	object_loader = "Global",
	object_type = TexturePack,
	key = "nevernamed_retrextures",
	textures = { "aij_joker_retextures" },
}

if next(SMODS.find_mod("malverk")) then
	return { name = { "Malverk" }, items = { joker_retextures, texture_pack } }
end
