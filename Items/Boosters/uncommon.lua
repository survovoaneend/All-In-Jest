local rarity = 'Uncommon'
local uncommon_normal_1 = {
    object_type = "Booster",
    order = 2,
    key = 'uncommon_normal_1', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 1 }, 
    cost = 4, 
    weight = 1.2, 
    config = { extra = 3, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Uncommon)
        ease_background_colour({ new_colour = G.C.RARITY.Uncommon, special_colour = G.C.RARITY.Uncommon, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_uncommon_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "uncommon_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_uncommon_packs",
    kind = "aij_uncommon",
}
local uncommon_jumbo_1 = {
    object_type = "Booster",
    order = 2,
    key = 'uncommon_jumbo_1', 
    atlas = 'booster_atlas', 
    pos = { x = 3, y = 1 }, 
    cost = 6, 
    weight = 0.6, 
    config = { extra = 5, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Uncommon)
        ease_background_colour({ new_colour = G.C.RARITY.Uncommon, special_colour = G.C.RARITY.Uncommon, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_uncommon_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "uncommon_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_uncommon_packs",
    kind = "aij_uncommon",
}
local uncommon_mega_1 = {
    object_type = "Booster",
    order = 2,
    key = 'uncommon_mega_1', 
    atlas = 'booster_atlas', 
    pos = { x = 5, y = 1 }, 
    cost = 8, 
    weight = 0.15, 
    config = { extra = 5, choose = 2 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Uncommon)
        ease_background_colour({ new_colour = G.C.RARITY.Uncommon, special_colour = G.C.RARITY.Uncommon, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_uncommon_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "uncommon_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_uncommon_packs",
    kind = "aij_uncommon",
}
local uncommon_normal_2 = {
    pos = { x = 1, y = 1 }, 
    key = 'uncommon_normal_2'
}
local uncommon_normal_3 = {
    pos = { x = 2, y = 1 }, 
    key = 'uncommon_normal_3'
}
for k, v in pairs(uncommon_normal_1) do
    if uncommon_normal_2[k] == nil then
        uncommon_normal_2[k] = v
    end
    if uncommon_normal_3[k] == nil then
        uncommon_normal_3[k] = v
    end
end
local uncommon_jumbo_2 = {
    pos = { x = 4, y = 1 }, 
    key = 'uncommon_jumbo_2'
}
for k, v in pairs(uncommon_jumbo_1) do
    if uncommon_jumbo_2[k] == nil then
        uncommon_jumbo_2[k] = v
    end
end
return { 
    name = {"Boosters"}, 
    items = {
        uncommon_normal_1, 
        uncommon_normal_2, 
        uncommon_normal_3,
        uncommon_jumbo_1,
        uncommon_jumbo_2,
        uncommon_mega_1,
    } 
}
