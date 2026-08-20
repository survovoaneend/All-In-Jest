local rarity = 'Rare'
local rare_normal_1 = {
    object_type = "Booster",
    order = 3,
    key = 'rare_normal_1', 
    atlas = 'booster_atlas', 
    pos = { x = 0, y = 5 }, 
    cost = 4,
    weight = 1.2, 
    config = { extra = 3, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Rare)
        ease_background_colour({ new_colour = G.C.RARITY.Rare, special_colour = G.C.RARITY.Rare, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_rare_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "rare_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_rare_packs",
    kind = "aij_rare",
}
local rare_jumbo_1 = {
    object_type = "Booster",
    order = 3,
    key = 'rare_jumbo_1', 
    atlas = 'booster_atlas', 
    pos = { x = 3, y = 5 }, 
    cost = 6,
    weight = 0.6, 
    config = { extra = 5, choose = 1 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Rare)
        ease_background_colour({ new_colour = G.C.RARITY.Rare, special_colour = G.C.RARITY.Rare, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_rare_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "rare_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_rare_packs",
    kind = "aij_rare",
}
local rare_mega_1 = {
    object_type = "Booster",
    order = 3,
    key = 'rare_mega_1', 
    atlas = 'booster_atlas', 
    pos = { x = 5, y = 5 }, 
    cost = 8,
    weight = 0.15, 
    config = { extra = 5, choose = 2 }, 
    discovered = false, 
    unlocked = true, 
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.choose, card.ability.extra} }
    end,
    ease_background_colour = function(self)
        ease_colour(G.C.DYN_UI.MAIN, G.C.RARITY.Rare)
        ease_background_colour({ new_colour = G.C.RARITY.Rare, special_colour = G.C.RARITY.Rare, contrast = 2 })
    end,
    get_weight = function(self)
        return (G.GAME.aij_rare_packs_rate or 0) * self.weight
    end,
    create_card = function(self, card, i)
        local card_params = {
            set = "Joker",
            rarity = rarity,
            area = G.pack_cards,
            skip_materialize = true,
            soulable = false,
            key_append = "rare_pack" ,
        }
        local _card = SMODS.create_card(card_params)
        return _card
    end,
    group_key = "k_aij_rare_packs",
    kind = "aij_rare",
}
local rare_normal_2 = {
    pos = { x = 1, y = 5 }, 
    key = 'rare_normal_2'
}
local rare_normal_3 = {
    pos = { x = 2, y = 5 }, 
    key = 'rare_normal_3'
}
for k, v in pairs(rare_normal_1) do
    if rare_normal_2[k] == nil then
        rare_normal_2[k] = v
    end
    if rare_normal_3[k] == nil then
        rare_normal_3[k] = v
    end
end
local rare_jumbo_2 = {
    pos = { x = 4, y = 5 }, 
    key = 'rare_jumbo_2'
}
for k, v in pairs(rare_jumbo_1) do
    if rare_jumbo_2[k] == nil then
        rare_jumbo_2[k] = v
    end
end
return { 
    name = {"Boosters"}, 
    items = {
        rare_normal_1, 
        rare_normal_2, 
        rare_normal_3,
        rare_jumbo_1,
        rare_jumbo_2,
        rare_mega_1,
    } 
}
