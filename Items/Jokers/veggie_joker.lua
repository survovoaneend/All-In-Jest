local veggie_joker = {
    object_type = "Joker",
    order = 448,
    key = "veggie_joker",

    config = {
        extra = {
            chips = 0
        }
    },
    attributes = { 'chips', 'scaling', 'on_destroy', 'rank', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten' },
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
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "chips",
                scalar_table = {value = total_ranks*3},
                scalar_value = "value",
                message_key = 'a_chips',
                message_colour = G.C.CHIPS
            })
            return nil, true
        end
        if context.joker_main then
            return {
                chips = card.ability.extra.chips
            }
        end
    end
}

return { name = { "Jokers" }, items = { veggie_joker } }
