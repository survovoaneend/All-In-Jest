local laurel = {
    object_type = "Joker",
    order = 1069,

    key = "laurel",
    config = {
        extra = {
            xmult = 1,
            xmult_mod = 0.25
        }
    },
    rarity = 4,
    pos = { x = 5, y = 12 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    soul_pos = { x = 5, y = 13 },

    loc_vars = function(self, info_queue, card)
        local count = 0
        for _, v in ipairs(G.playing_cards) do
            if next(SMODS.get_enhancements(v)) then count = count + 1 end
        end
        return { 
            vars = { 
                card.ability.extra.xmult_mod, 
                1 + (count * card.ability.extra.xmult_mod) 
            } 
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local count = 0
            for _, v in ipairs(G.playing_cards) do
                if next(SMODS.get_enhancements(v)) then count = count + 1 end
            end
            return {
                x_mult = 1 + (count * card.ability.extra.xmult_mod)
            }
        end
    end,
}
return { name = { "Jokers" }, items = { laurel } }
