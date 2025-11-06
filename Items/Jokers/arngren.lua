local arngren = {
    object_type = "Joker",
    order = 325,

    key = "arngren",
    config = {
        extra = {
            bonus_slots = 1
        }
    },
    rarity = 3,
    pos = { x = 21, y = 12},
    atlas = 'joker_atlas',
    cost = 10,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.bonus_slots)
        SMODS.change_booster_limit(card.ability.extra.bonus_slots)
        SMODS.change_voucher_limit(card.ability.extra.bonus_slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.bonus_slots)
        SMODS.change_booster_limit(-card.ability.extra.bonus_slots)
        SMODS.change_voucher_limit(-card.ability.extra.bonus_slots)
    end,
  
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.bonus_slots
            }
        }
    end,
  
    calculate = function(self, card, context)
        
    end
  
}
return { name = {"Jokers"}, items = {arngren} }
