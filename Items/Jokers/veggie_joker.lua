local veggie_joker = {
    object_type = "Joker",
    order = 448,
    key = "veggie_joker",

    config = {
        extra = {
            chips = 0
        }
    },
    rarity = 1,
    pos = { x = 17, y = 22 },
    atlas = 'joker_atlas',
    cost = 4,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local total_ranks = 0
            for i = 1, #context.removed do
                if context.removed[i]:get_id() >= 2 and context.removed[i]:get_id() <= 10 then
                    local rank = context.removed[i]:get_id()
                    total_ranks = total_ranks + rank
                end
            end
            card.ability.extra.chips = card.ability.extra.chips + total_ranks * 3
            return { 
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                colour = G.C.CHIPS
            }
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

return { name = { "Jokers" }, items = { veggie_joker } }
