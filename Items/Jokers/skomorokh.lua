local skomorokh = {
    object_type = "Joker",
    order = 209,

    key = "skomorokh",
    config = {
        extra = {
            xmult = 1,
            xmult_mod = 0.2,
        }
    },
    rarity = 1,
    pos = { x = 23, y = 7 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    in_pool = function(self, args)
        if G.playing_cards then
            for _, card in ipairs(G.playing_cards) do
                if card.edition then
                    return true
                end
            end
        end
        return false
    end,

    loc_vars = function(self, info_queue, card)
        local edition_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.edition then edition_tally = edition_tally + 1 end
            end
        end
        return {
            vars = {
                card.ability.extra.xmult_mod,
                card.ability.extra.xmult + edition_tally * card.ability.extra.xmult_mod
            }
        }
    end,

    calculate = function(self, card, context)
        local edition_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card.edition then edition_tally = edition_tally + 1 end
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult + edition_tally * card.ability.extra.xmult_mod
            }
        end
    end

}
return { name = { "Jokers" }, items = { skomorokh } }
