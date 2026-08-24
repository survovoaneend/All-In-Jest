local circus_monkey = {
    object_type = "Joker",
    order = 847,

    key = "circus_monkey",
    config = {
        extra = {
            mult = 1
        }
    },
    attributes = { 'perma_bonus', 'mult', 'joker'},
    rarity = 1,
    pos = { x = 19, y = 39 },
    atlas = 'joker_atlas',
    cost = 4,
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
        if context.setting_blind and G.jokers and #G.jokers.cards > 0 then
            for k, v in pairs(G.jokers.cards) do
                local leftmost = G.jokers.cards[1]
                if leftmost then
                    leftmost.ability.perma_mult = (leftmost.ability.perma_mult or 0) + card.ability.extra.mult
                    card_eval_status_text(leftmost, 'extra', nil, nil, nil, {
                        message = localize('k_upgrade_ex'),
                        colour = G.C.MULT
                    })
                    return nil, true
                end
            end
        end
    end
}
return { name = { "Jokers" }, items = { circus_monkey } }
