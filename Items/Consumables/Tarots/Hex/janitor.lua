local janitor = {
    object_type = "Consumable",
    key = 'janitor',
    set = 'Tarot',
    pos = { x = 1, y = 8 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_tarot_hex'), HEX('4f6367'), G.C.WHITE, 1.2)
    end,
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = true,
    soul_rate = 0.01,
    soul_set = 'Tarot',
    order = 502,
    config = { },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
       
    end,
    can_use = function(self, card)
        if G.hand and (#G.hand.cards >= 1) then
	        return true
        end
    end,
    use = function(self, card)
        SMODS.destroy_cards(G.hand.cards, nil, true)
    end,
}
return { name = { "Tarots" }, items = { janitor } }
