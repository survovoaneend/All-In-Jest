local cutesy_joker = {
    object_type = "Joker",
    order = 560,
    key = "cutesy_joker",
    config = {
        extra = {
            
        }
    },
    rarity = 3,
    pos = { x = 23, y = 26 },
    atlas = 'joker_atlas',
    cost = 8,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                
            }
        }
    end,

    calculate = function(self, card, context)
        if context.mod_probability and context.trigger_obj and context.trigger_obj.ability and context.trigger_obj.ability.consumeable then
            return {
                numerator = context.denominator,
                denominator = context.denominator
            }
        end
    end
}

return { name = { "Jokers" }, items = { cutesy_joker } }
