local clay_joker = {
    object_type = "Joker",
    order = 102,
    ignore = true,
    key = "clay_joker",
    config = {
        extra = {

        }
    },
    rarity = 2,
    pos = { x = 22, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,

    calculate = function(self, card, context)
    end

}

return { name = { "Jokers" }, items = { clay_joker } }
