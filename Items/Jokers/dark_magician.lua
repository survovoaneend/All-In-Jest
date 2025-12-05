local dark_magician = {
    object_type = "Joker",
    order = 515,

    key = "dark_magician",
    config = {
        extra = {

        }
    },
    rarity = 3,
    pos = { x = 5, y = 21 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return { vars = {  } }
    end,

    calculate = function(self, card, context)
        
    end
}
return { name = { "Jokers" }, items = { dark_magician } }
