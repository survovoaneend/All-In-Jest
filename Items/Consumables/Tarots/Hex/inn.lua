local inn = {
    object_type = "Consumable",
    key = 'inn',
    set = 'Tarot',
    pos = { x = 2, y = 8 },
    set_card_type_badge = function(self, card, badges)
        badges[#badges + 1] = create_badge(localize('k_tarot_hex'), HEX('4f6367'), G.C.WHITE, 1.2)
    end,
    cost = 6,
    unlocked = true,
    discovered = false,
    hidden = true,
    ignore = true,
    soul_rate = 0.003 / 5,
    soul_set = 'Tarot',
    order = 503,
    config = { },
    atlas = 'consumable_atlas',
    loc_vars = function(self, info_queue, card)
    end,
    can_use = function(self, card)
    end,
    use = function(self, card)
    end,
}
return { name = { "Tarots" }, items = { inn } }
