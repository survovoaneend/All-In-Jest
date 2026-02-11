local funny_bunch = {
    object_type = "Joker",
    order = 450,
    key = "funny_bunch",

    config = {
        extra = {
            xmult_mod = 0.5
        }
    },
    rarity = 2,
    pos = { x = 19, y = 22 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        local commons = 0
        for _, v in ipairs(G.jokers.cards) do
            if v.config.center.rarity == 1 then
                commons = commons + 1
            end
        end

        return {
            vars = {
                card.ability.extra.xmult_mod,
                1 + (commons * card.ability.extra.xmult_mod)
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            local commons = 0
            for _, v in ipairs(G.jokers.cards) do
                if v.config.center.rarity == 1 then
                    commons = commons + 1
                end
            end
            if commons > 0 then
                return {
                    xmult = 1 + (commons * card.ability.extra.xmult_mod)
                }
            end
        end
    end
}

return { name = { "Jokers" }, items = { funny_bunch } }
