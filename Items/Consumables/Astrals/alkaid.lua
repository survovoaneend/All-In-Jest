local alkaid = {
    object_type = "Consumable",
	key = 'alkaid',
	set = 'aij_astral',
    atlas = 'consumable_atlas',
	pos = { x = 10, y = 5 },
    soul_pos = { x = 10, y = 6 },
	cost = 4,
	unlocked = true,
	discovered = false,
    order = 7,
	config = { hand = nil, grade = '', pin = 'Alkaid', extra = {cards = 1}},
    attributes = {'hand_type', 'space', 'modify_card', 'enhancements'},
    loc_vars = function(self, info_queue, card)
        -- Rest of loc_vars is defined in the ConsumableType in hooks.lua
		return {
			vars = {
				(card.area and not card.area.config.collection) and card.ability.consumeable.hand or '(hand)',
                card.ability.extra.cards
			},
		}
    end,
    all_in_jest = {
        grades = {
            ["Retrograde"] = 0.25, 
            ["Passigrade"] = 0.65, 
            ["Prograde"] = 0.1,
        }
    },
}
local alkaid_pin = {
	object_loader = All_in_Jest,
    object_type = "Astral",
	key = 'alkaid_pin',
    pin = 'Alkaid',
    atlas = 'misc_atlas',
	pos = { x = 2, y = 1 },
    discovered = false,
    order = 7,
    config = {},

    pixel_size = { w = 53, h = 42 },

    loc_vars = function(self, info_queue, card)
        
		return {
			vars = {
				card.ability.extra.hand,
                card.ability.extra.cards
			},
		}
    end,

    calculate = function(self, card, context)
        if context.before and not context.repetition then
            for i = 1, card.ability.extra.cards do
                local valid_cards = {}
                for i = 1, #context.scoring_hand do
                    if next(SMODS.get_enhancements(context.scoring_hand[i])) == nil then
                        valid_cards[#valid_cards+1] = context.scoring_hand[i]
                    end
                end
                if #valid_cards == 0 then return end
                local cur_card = pseudorandom_element(valid_cards, pseudoseed('alkaid'))
                local all_enhancements = get_current_pool("Enhanced")
                local valid_enhancements = {}

                for _, enhancement in ipairs(all_enhancements) do
                    if enhancement ~= "UNAVAILABLE" and not (enhancement == 'm_stone' or enhancement == 'm_aij_canvas' or G.P_CENTERS[enhancement].no_rank) then
                        valid_enhancements[#valid_enhancements + 1] = enhancement
                    end
                end
                local random_enhancement_key = SMODS.poll_enhancement({ guaranteed = true, key_append = 'alkaid'..i, options = valid_enhancements })
                local enhancement_center = {}
                for k, v in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                    if v.key == random_enhancement_key then 
                        enhancement_center = v
                    end
                end
                cur_card:set_ability(enhancement_center, nil, true)
                G.E_MANAGER:add_event(Event({
                    func = function()
                        cur_card:juice_up()
                        return true
                    end
                })) 
            end
            return {
                message = localize('k_aij_change_ex'),
                colour = G.C.PURPLE
            }
        end
    end,
}
return {name = {"Astrals"}, items = {alkaid, alkaid_pin}}
