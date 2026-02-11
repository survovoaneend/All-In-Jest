local dwarf = {
    object_type = "Joker",
    order = 455,
    key = "dwarf",
    
    config = {
        extra = {
            mult = 6
        }
    },
    rarity = 1,
    pos = { x = 23, y = 22 },
    atlas = 'joker_atlas',
    cost = 3,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            local id = context.other_card:get_id()
            if id >= 2 and id <= 5 then
                local mult_add = card.ability.extra.mult - id 
                return {
                    mult = mult_add,
                    card = card
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { dwarf } }
