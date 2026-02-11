local goon_joker = {
    object_type = "Joker",
    order = 517,
    key = "goon_joker",
   
    config = {
        extra = {
            boss_mult = -5,
            mult = 20
        }
    },
    rarity = 1,
    pos = { x = 1, y = 25 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.boss_mult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.blind.boss then
                return { mult = card.ability.extra.boss_mult }
            else
                return { mult = card.ability.extra.mult }
            end
        end
    end
}

return { name = { "Jokers" }, items = { goon_joker } }
