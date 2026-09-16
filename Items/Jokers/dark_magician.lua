local dark_magician = {
	object_type = "Joker",
	order = 524,

	key = "dark_magician",
	config = {
		extra = {},
	},
	attributes = { "consumable", "tarot", "planet", "spectral" },
	rarity = 3,
	pos = { x = 5, y = 21 },
	atlas = "joker_atlas",
	cost = 8,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card)
		return { vars = {} }
	end,

	calculate = function(self, card, context)
		if context.create_booster_card then
			if not context.booster.config.center.draw_hand then
				context.booster.config.center.aij_fake_draw_hand = true
			end
			context.booster.config.center.draw_hand = true
		end
	end,
	add_to_deck = function(self, card, from_debuff)
		if #SMODS.find_card("j_aij_dark_magician") == 0 then
     		G.GAME.consumeable_usage_total = G.GAME.consumeable_usage_total or {tarot = 0, planet = 0, spectral = 0, tarot_planet = 0, all = 0}
			
			G.GAME.consumeable_usage_total.dark_magician_old = {
				tarot = G.GAME.consumeable_usage_total.tarot,
				planet = G.GAME.consumeable_usage_total.planet,
				tarot_planet = G.GAME.consumeable_usage_total.tarot_planet,
				spectral = G.GAME.consumeable_usage_total.spectral
			}

			local total = G.GAME.consumeable_usage_total.tarot + G.GAME.consumeable_usage_total.planet + G.GAME.consumeable_usage_total.spectral
			G.GAME.consumeable_usage_total.tarot = total
			G.GAME.consumeable_usage_total.planet = total
			G.GAME.consumeable_usage_total.tarot_planet = total
			G.GAME.consumeable_usage_total.spectral = total
		end
	end,
	remove_from_deck = function(self, card, from_debuff)
		if #SMODS.find_card("j_aij_dark_magician") == 0 then
			G.GAME.consumeable_usage_total.tarot = G.GAME.consumeable_usage_total.dark_magician_old.tarot
			G.GAME.consumeable_usage_total.planet = G.GAME.consumeable_usage_total.dark_magician_old.planet
			G.GAME.consumeable_usage_total.tarot_planet = G.GAME.consumeable_usage_total.dark_magician_old.tarot_planet
			G.GAME.consumeable_usage_total.spectral = G.GAME.consumeable_usage_total.dark_magician_old.spectral
			G.GAME.consumeable_usage_total.dark_magician_old = nil
			for k, v in ipairs(G.P_CENTER_POOLS.Booster) do
				if v.aij_fake_draw_hand and v.draw_hand then
					v.aij_fake_draw_hand = nil
					v.draw_hand = nil
				end
			end
		end
	end,
}

local ref_smods_poll_object = SMODS.poll_object
function SMODS.poll_object(args)
	local card_type = args.type or args.set

	if next(SMODS.find_card("j_aij_dark_magician")) and (card_type == "Tarot" or card_type == "Spectral" or card_type == "Planet") then
		local poll = pseudorandom("j_aij_dark_magician_poll")
		if poll < 0.4 then
			args.type = "Tarot"
			args.set = "Tarot"
		elseif poll < 0.8 then
			args.type = "Planet"
			args.set = "Planet"
		else
			args.type = "Spectral"
			args.set = "Spectral"
		end
	end

	return ref_smods_poll_object(args)
end

-- local ref_smods_create_poll_pool = SMODS.create_poll_pool
-- function SMODS.create_poll_pool(labels, args)
-- 	if next(SMODS.find_card("j_aij_dark_magician")) then
-- 		local sets = {}

-- 		for i = 1, #labels do
-- 			sets[labels[i]] = true
-- 		end

-- 		if sets["Tarot"] or sets["Planet"] or sets["Spectral"] or sets["Tarot_Planet"] then
-- 			if not sets["Tarot"] and not sets["Tarot_Planet"] then
-- 				table.insert(labels, "Tarot")
-- 			end
-- 			if not sets["Planet"] and not sets["Tarot_Planet"] then
-- 				table.insert(labels, "Planet")
-- 			end
-- 			if not sets["Spectral"] then
-- 				table.insert(labels, "Spectral")
-- 			end
-- 		end
-- 	end

-- 	return ref_smods_create_poll_pool(labels, args)
-- end

return { name = { "Jokers" }, items = { dark_magician } }
