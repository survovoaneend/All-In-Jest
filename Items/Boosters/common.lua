local rarity = 'Common'
local common_normal_1 = {
    object_type = "Booster",
    order = 1,
    key = 'common_normal_1', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 2 }, 
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
    get_weight = function(self)
        return (G.GAME.aij_common_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "common_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_common_packs",
    kind = "aij_common",
}
local common_jumbo_1 = {
    object_type = "Booster",
    order = 1,
    key = 'common_jumbo_1', 
    atlas = 'booster_atlas', 
    pos = { x = 3, y = 2 }, 
    cost = 6, 
    weight = 0.6, 
    config = { extra = 5, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Common)
        ease_background_colour({ new_colour = G.C.RARITY.Common, special_colour = G.C.RARITY.Common, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_common_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "common_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_common_packs",
    kind = "aij_common",
}
local common_mega_1 = {
    object_type = "Booster",
    order = 1,
    key = 'common_mega_1', 
    atlas = 'booster_atlas', 
    pos = { x = 5, y = 2 }, 
    cost = 8, 
    weight = 0.15, 
    config = { extra = 5, choose = 2 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Common)
        ease_background_colour({ new_colour = G.C.RARITY.Common, special_colour = G.C.RARITY.Common, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_common_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "common_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_common_packs",
    kind = "aij_common",
}
local common_normal_2 = {
    pos = { x = 1, y = 2 }, 
    key = 'common_normal_2'
}
local common_normal_3 = {
    pos = { x = 2, y = 2 }, 
    key = 'common_normal_3'
}
for k, v in pairs(common_normal_1) do
    if common_normal_2[k] == nil then
        common_normal_2[k] = v
    end
    if common_normal_3[k] == nil then
        common_normal_3[k] = v
    end
end
local common_jumbo_2 = {
    pos = { x = 4, y = 2 }, 
    key = 'common_jumbo_2'
}
for k, v in pairs(common_jumbo_1) do
    if common_jumbo_2[k] == nil then
        common_jumbo_2[k] = v
    end
end
return { 
    name = {"Boosters"}, 
    items = {
        common_normal_1, 
        common_normal_2, 
        common_normal_3,
        common_jumbo_1,
        common_jumbo_2,
        common_mega_1,
    } 
}
