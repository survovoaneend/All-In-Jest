local totem_pole = {
    object_type = "Joker",
    order = 412,
    key = "totem_pole",
    config = {
        extra = {
            xmult = 2
        }
    },
    rarity = 2,
    pos = { x = 4, y = 20 },
    atlas = 'joker_atlas',
    cost = 5,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult
            }
        }
    end,

    calculate = function(self, card, context)
        if context.aij_before_before and not context.blueprint then
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    G.jokers:shuffle('totem')
                    play_sound('cardSlide1', 0.85)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.jokers:shuffle('totem')
                    play_sound('cardSlide1', 1.15)
                    return true
                end
            }))

            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.2,
                func = function()
                    G.jokers:shuffle('totem')
                    play_sound('cardSlide1', 1)
                    return true
                end
            }))
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}

return { name = { "Jokers" }, items = { totem_pole } }
