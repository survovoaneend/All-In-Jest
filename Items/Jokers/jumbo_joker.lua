local jumbo_joker = {
	object_type = "Joker",
	order = 144,
	lite = true,
	key = "jumbo_joker",
	config = {
		extra = {},
	},
	attributes = { "booster", "shop" },
	rarity = 2,
	pos = { x = 0, y = 0 },
	soul_pos = { x = 2, y = 0 },
	atlas = "jumbo_joker",
	cost = 6,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	display_size = { w = 81, h = 111 },

	loc_vars = function(self, info_queue, card) end,
}

local smods_add_to_pool_ref = SMODS.add_to_pool
function SMODS.add_to_pool(prototype_obj, ...)
	if
		#SMODS.find_card("j_aij_jumbo_joker") > 0
		and prototype_obj.set == "Booster"
		and not (
			prototype_obj.name:find("Mega")
			or prototype_obj.name:find("Jumbo")
			or prototype_obj.key:find("mega")
			or prototype_obj.key:find("jumbo")
		)
	then
		return false
	else
		return smods_add_to_pool_ref(prototype_obj, ...)
	end
end

-- First shop buffon pack becomes jumbo with Jumbo Joker
local smods_get_pack_ref = get_pack
function get_pack(...)
	if not G.GAME.first_shop_buffoon and #SMODS.find_card("j_aij_jumbo_joker") > 0 then
		G.GAME.first_shop_buffoon = true
		return G.P_CENTERS["p_buffoon_jumbo_1"]
	else
		return smods_get_pack_ref(...)
	end
end

local aij_drawsteps_floating_sprite_ref = SMODS.DrawSteps.floating_sprite.func
SMODS.DrawSteps.floating_sprite.func = function(self)
	if not (self.config.center.key == "j_aij_jumbo_joker" and not self.children.center.states.hover.is) then
		return aij_drawsteps_floating_sprite_ref(self)
	end
end

-- For the "pop out" animation
local hoverref = Card.hover
function Card:hover()
	hoverref(self)
	if self.config.center.key == "j_aij_jumbo_joker" and self.config.center.discovered then
		local _pos = { x = 1, y = 0 }
		self.children.center:set_sprite_pos(_pos)
	end
end
local stop_hoverref = Card.stop_hover
function Card:stop_hover()
	stop_hoverref(self)
	if self.config.center.key == "j_aij_jumbo_joker" and self.config.center.discovered then
		local _pos = { x = 0, y = 0 }
		self.children.center:set_sprite_pos(_pos)
	end
end
return { name = { "Jokers" }, items = { jumbo_joker } }
