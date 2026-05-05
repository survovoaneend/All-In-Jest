local tussaud = {
    object_type = "Joker",
    order = 593,
    key = "tussaud",
  
    config = {
        extra = {
            xmult_gain = 0.5
        }
    },
    rarity = 2,
    pos = { x = 6, y = 28 },
    atlas = 'joker_atlas',
    cost = 7,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,


    loc_vars = function(self, info_queue, card)
        local unique_seals = {}
        local count = 0
        for _, c in ipairs(G.playing_cards or {}) do
            if c.seal and not unique_seals[c.seal] then
                unique_seals[c.seal] = true
                count = count + 1
            end
        end
        return { vars = { card.ability.extra.xmult_gain, 1 + (count * card.ability.extra.xmult_gain) } }
    end,

    calculate = function(self, card, context)
         if context.joker_main then
            local unique_seals = {}
            local count = 0
            for _, c in ipairs(G.playing_cards or {}) do
                if c.seal and not unique_seals[c.seal] then
                    unique_seals[c.seal] = true
                    count = count + 1
                end
            end
            if count > 0 then
                return {
                    xmult = 1 + (count * card.ability.extra.xmult_gain)
                }
            end
        end
    end
}


return { name = { "Jokers" }, items = { tussaud } }