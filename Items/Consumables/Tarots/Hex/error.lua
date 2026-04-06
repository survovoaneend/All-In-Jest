local error = {
    object_type = "Consumable",
    key = 'error',
    set = 'Tarot',
    pos = { x = 0, y = 8 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_tarot_hex'), HEX('4f6367'), G.C.WHITE, 1.2)
    end,
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = true,
    soul_rate = 0.01,
    soul_set = 'Tarot',
    order = 501,
    config = { max_highlight = 5 },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
       info_queue[#info_queue + 1] = {set = 'Other', key = 'aij_jest_chaotic_card', vars={1.5}}
       return {
		   vars = {
		       card.ability.max_highlight,
	       }
	   }
    end,
    can_use = function(self, card)
        if G.hand and (#G.hand.highlighted <= card.ability.max_highlight and #G.hand.highlighted > 0) then
	        return true
        end
    end,
    use = function(self, card)
        for i = 1, #G.hand.highlighted do
            local cur_card = G.hand.highlighted[i]
            if not cur_card.ability.aij_jest_chaotic_card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.Stickers["aij_jest_chaotic_card"]:apply(cur_card, true)
                        cur_card:juice_up()
                        return true
                    end
                }))
            end
        end
    end,
}
return { name = { "Tarots" }, items = { error } }
