local melpomene = {
    object_type = "Joker",
    order = 1066,

    key = "melpomene",
    config = {
       
    },
    rarity = 4,
    pos = { x = 3, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 3, y = 13 },

    loc_vars = function(self, info_queue, card)
        
    end,

    calculate = function(self, card, context)
        
    end,
}
return { name = { "Jokers" }, items = { melpomene } }