local stagehand = {
    object_type = "Joker",
    order = 290,

    key = "stagehand",
    config = {
        extra = {
            xmult = 1.1
        }
    },
    rarity = 1,
    pos = { x = 13, y = 11 },
    atlas = 'joker_atlas',
    cost = 4,
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
        if context.other_joker then
            if not (context.other_joker.edition and context.other_joker.edition.negative) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        context.other_joker:juice_up(0.5, 0.5)
                        return true
                    end
                }))
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
    end

}
return { name = { "Jokers" }, items = { stagehand } }
