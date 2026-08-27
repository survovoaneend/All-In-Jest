local american_comic = {
    object_type = "Joker",
    order = 277,
    key = "american_comic",
    config = {
        extra = {
            slots = 1
        }
    },
    attributes = { 'shop', 'shop_slot', 'passive' },
    rarity = 2,
    pos = { x = 18, y = 10},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots,
            }
        }
    end,
  
    add_to_deck = function(self, card, from_debuff)
        aij_change_shop_size_advanced(card.ability.extra.slots, 'american_comic_'..card.sort_id, 'Joker', 0)
    end,
    remove_from_deck = function(self, card, from_debuff)
        aij_change_shop_size_advanced(-card.ability.extra.slots, 'american_comic_'..card.sort_id, 'Joker', 0)
    end
}
return { name = {"Jokers"}, items = {american_comic} }
