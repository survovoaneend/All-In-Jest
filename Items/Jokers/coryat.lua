local coryat = {
    object_type = "Joker",
    order = 1040,

    key = "coryat",
    config = {
        extra = {
            shop = 3,
            booster = 2,
            voucher = 1
        }
    },
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 9, y = 6 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 9, y = 7 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.shop,
                card.ability.extra.booster,
                card.ability.extra.voucher
            }
        }
    end,

    calculate = function(self, card, context)

    end,

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.shop)
        SMODS.change_booster_limit(card.ability.extra.booster)
        SMODS.change_voucher_limit(card.ability.extra.voucher)
    end,
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.shop)
        SMODS.change_booster_limit(-card.ability.extra.booster)
        SMODS.change_voucher_limit(-card.ability.extra.voucher)
    end

}
return { name = { "Jokers" }, items = { coryat } }
