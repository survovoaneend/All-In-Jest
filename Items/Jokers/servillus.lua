local servillus = {
    object_type = "Joker",
    order = 10028,

    key = "servillus",
    config = {
        extra = {

        }
    },
    attributes = {},
    rarity = 4,
    unlock_condition = { hidden = true },
    pos = { x = 7, y = 18 },
    atlas = 'legendary_atlas',
    cost = 20,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    soul_pos = { x = 7, y = 19 },

    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = {set = 'Tag', key = 'tag_aij_nonstandard'}
        return {
            vars = {

            }
        }
    end,

    calculate = function(self, card, context)
        local eff_card = context.blueprint_card or card
        local tag_name = localize { type = 'name_text', set = 'Tag', key = 'tag_aij_nonstandard' }
        if context.end_of_round and context.beat_boss and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = (function()
                    add_tag(Tag('tag_aij_nonstandard'))
                    play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end)
            }))
            card_eval_status_text(eff_card, 'extra', nil, nil, nil, {
                message = '+' .. tag_name,
            })
            return nil, true
        end
    end
}
return { name = { "Jokers" }, items = { servillus } }
