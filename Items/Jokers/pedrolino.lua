local pedrolino = {
    object_type = "Joker",
    order = 99,

    key = "pedrolino",
    config = {
        extra = { blind_reduction = 90 }
    },
    rarity = 2,
    pos = { x = 19, y = 3 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.blind_reduction,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_self and not context.blueprint and G.GAME.blind.in_blind then
            All_in_Jest.ease_blind_requirement(nil, -1 * math.ceil(G.GAME.blind.chips * card.ability.extra.blind_reduction * 0.01))
            
            -- Ends blind if blind requirement is now met
            -- Copied from blind:disable()
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                func = function()
                    if G.GAME.chips - G.GAME.blind.chips >= 0 then
                        G.STATE = G.STATES.NEW_ROUND
                        G.STATE_COMPLETE = false
                    end
                    return true
                end
            }))
        end
    end

}
return { name = { "Jokers" }, items = { pedrolino } }
