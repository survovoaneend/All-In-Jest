local ninja = {
    object_type = "Joker",
    order = 439,
    key = "ninja",
    config = {
        extra = {
            
        }
    },
    attributes = { 'trigger_cards', 'position' },
    rarity = 3,
    pos = { x = 20, y = 20 },
    atlas = 'joker_atlas',
    cost = 9,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        
    end
}

return { name = { "Jokers" }, items = { ninja } }
