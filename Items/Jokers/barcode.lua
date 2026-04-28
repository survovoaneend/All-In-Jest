local barcode = {
    object_type = "Joker",
    order = 656,

    key = "barcode",
    config = {
        extra = {
            sale = 50
        }
    },
    rarity = 1,
    pos = { x = 22, y = 30},
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    pixel_size = { w = 57, h = 94 },

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sale,
            }
        }
    end,

    calculate = function(self, card, context)

    end
}
return { name = {"Jokers"}, items = {barcode} }