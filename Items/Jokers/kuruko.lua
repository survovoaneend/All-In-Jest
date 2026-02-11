local kuruko = {
    object_type = "Joker",
    order = 303,

    key = "kuruko",
    config = {
        extra = {
            mult = 1
        }
    },
    rarity = 2,
    pos = { x = 0, y = 12 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if G.playing_cards then
                local matches = 0
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == context.other_card:get_id() then matches = matches + 1 end
                end
                return {
                    mult = matches * card.ability.extra.mult
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { kuruko } }
