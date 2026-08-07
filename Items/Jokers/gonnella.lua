local gonnella = {
    object_type = "Joker",
    order = 1037,

    key = "gonnella",
    config = {
      
    },
    attributes = { 'generation', 'joker', 'editions', 'negative', 'on_sell' },
    rarity = 4,
	unlock_condition = {hidden = true},
    pos = { x = 6, y = 6},
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    soul_pos = { x = 6, y = 7},
  
    loc_vars = function(self, info_queue, card)
        
    end,
  
    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == "Joker" and (not context.card.edition or context.card.edition.key ~= 'e_negative') then
            local vanilla_rarities = {"Common", "Uncommon", "Rare", "Legendary"}
            SMODS.add_card { set = "Joker", edition = 'e_negative', rarity = vanilla_rarities[context.card.config.center.rarity] or context.card.config.center.rarity, legendary = context.card:is_rarity('Legendary') }
            return {
                message = localize{type = "variable", key = "a_aij_jokers", vars = {1}},
            }
        end
    end
}
return { name = {"Jokers"}, items = {gonnella} }
