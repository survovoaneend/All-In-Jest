local bellhop = {
    object_type = "Joker",
    order = 772,

    key = "bellhop",
    config = {
        extra = {
            slots = 1
        }
    },
    attributes = {'shop', 'shop_slot'},
    rarity = 1,
    pos = { x = 4, y = 35},
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.slots
            }
         }
    end,

    add_to_deck = function(self, card, from_debuff)
        change_shop_size(card.ability.extra.slots)
    end,
    remove_from_deck = function(self, card, from_debuff)
        change_shop_size(-card.ability.extra.slots)
    end
}
return { name = {"Jokers"}, items = {bellhop} }