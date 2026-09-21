local anagraph = {
	object_type = "Joker",
	order = 199,
	key = "anagraph",
	config = {
		extra = {
			has_triggered = false,
		},
	},
	attributes = { "generation", "destroy_card", "joker", "playing_card" },
	rarity = 1,
	pos = { x = 7, y = 7 },
	atlas = "joker_atlas",
	cost = 4,
	unlocked = true,
	discovered = false,
	blueprint_compat = false,
	eternal_compat = true,
	perishable_compat = true,

	loc_vars = function(self, info_queue, card) end,

	calculate = function(self, card, context)
		if context.selling_card and not context.blueprint then
			local sold_card = context.card
			local area = sold_card.area
			return {
				extra = {
					func = function()
						G.E_MANAGER:add_event(Event({
							func = function()
								local o_card = copy_card(sold_card, nil, nil, nil, false)
								o_card.ability.has_anagraph_triggered = true
								sold_card.ability.has_anagraph_triggered = true
								o_card.ability.jest_sold_self = nil
								o_card:start_materialize()
								o_card:add_to_deck()
								area:emplace(o_card)
								SMODS.destroy_cards(o_card)
								return true
							end,
						}))
					end,
					message = localize("k_again_ex")
				}
			}
		end
		if context.aij_after_destroying_cards and not context.blueprint then
			local removed_cards = {}
			for _, v in ipairs(context.removed) do
				if not v.ability.has_anagraph_triggered then
					table.insert(removed_cards, v)
				end
			end
			local destroy_cards_again = {}
			for k, removed_card in pairs(removed_cards) do
				local area = context.removed_areas[k]
				local o_card = copy_card(removed_card, nil, nil, nil, false)
				o_card.states.visible = false
				destroy_cards_again[#destroy_cards_again + 1] = o_card
				o_card.ability.has_anagraph_triggered = true
				removed_card.ability.has_anagraph_triggered = true
				o_card.ability.jest_sold_self = nil
				G.E_MANAGER:add_event(Event({
					func = function()
						o_card:start_materialize()
						o_card:add_to_deck()
						area:emplace(o_card)
						return true
					end,
				}))
			end
			if #removed_cards > 0 then
				return {
					message = localize("k_again_ex"),
					func = function()
						SMODS.destroy_cards(destroy_cards_again)
					end
				}
			end
		end
	end,
}
local sell_card_ref = Card.sell_card
function Card:sell_card()
	if self.ability then
		self.ability.jest_sold_self = true
	end
	local ref = sell_card_ref(self)
	return ref
end

-- local start_dissolve_ref = Card.start_dissolve
-- function Card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
-- 	local ref = start_dissolve_ref(self, dissolve_colours, silent, dissolve_time_fac, no_juice)
-- 	if G.jokers and self.ability.set == "Joker" and self.config.center.key ~= "j_aij_anagraph" then
-- 		local has_anagraph = next(SMODS.find_card("j_aij_anagraph"))
-- 		if has_anagraph and (self.ability.has_anagraph_triggered == nil or not self.ability.has_anagraph_triggered) then
-- 			G.E_MANAGER:add_event(Event({
-- 				trigger = "before",
-- 				delay = 1.0,
-- 				func = function()
-- 					local card = copy_card(self, nil, nil, nil, false)
-- 					card:start_materialize()
-- 					card:add_to_deck()
-- 					card.ability.has_anagraph_triggered = true
-- 					G.jokers:emplace(card)
-- 					card.ability.jest_sold_self = nil
-- 					G.E_MANAGER:add_event(Event({
-- 						trigger = "before",
-- 						delay = 1.0,
-- 						func = function()
-- 							card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
-- 							return true
-- 						end,
-- 					}))
-- 					return true
-- 				end,
-- 			}))
-- 		end
-- 	end
-- 	if (G.hand or G.play) and SMODS.is_playing_card(self) then
-- 		local has_anagraph = next(SMODS.find_card("j_aij_anagraph"))
-- 		if has_anagraph and (self.ability.has_anagraph_triggered == nil or not self.ability.has_anagraph_triggered) then
-- 			G.E_MANAGER:add_event(Event({
-- 				trigger = "before",
-- 				delay = 1.0,
-- 				func = function()
-- 					local card = copy_card(self, nil, nil, nil, false)
-- 					card:start_materialize()
-- 					card:add_to_deck()
-- 					card.ability.has_anagraph_triggered = true
-- 					G.hand:emplace(card)
-- 					card.ability.jest_sold_self = nil
-- 					G.E_MANAGER:add_event(Event({
-- 						trigger = "before",
-- 						delay = 1.0,
-- 						func = function()
-- 							card:start_dissolve(dissolve_colours, silent, dissolve_time_fac, no_juice)
-- 							return true
-- 						end,
-- 					}))
-- 					return true
-- 				end,
-- 			}))
-- 		end
-- 	end
-- 	return ref
-- end

return { name = { "Jokers" }, items = { anagraph } }
