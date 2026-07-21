local testing_booster = {
    object_type = "Booster",
    order = 1,
    key = 'testing_booster', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 0 }, 
    ignore = true,
    cost = 4, 
    weight = 1.2, 
    config = { extra = 3, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Common)
        ease_background_colour({ new_colour = G.C.RARITY.Common, special_colour = G.C.RARITY.Common, contrast = 2 })
    end,
    create_card = function(self, card, i)
        local set = "Joker"
        local key = 'the_treachery_of_jokers'
        return create_card(set, G.pack_cards, nil, nil, true, nil, 'j_aij_'..key, "testing_booster")
    end,
    group_key = "k_aij_testing_booster",
    kind = "aij_testing_booster",
}
return { 
    name = {"Boosters"}, 
    items = {
        testing_booster, 
    } 
}
