local fly_agaric = {
    object_type = "Joker",
    order = 416,
    key = "fly_agaric",
    config = {
        extra = {
            
        }
    },
    rarity = 2,
    pos = { x = 16, y = 20 },
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = false,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                colours = {
                    G.C.SECONDARY_SET.Enhanced
                }
            }
        }
    end,

    calculate = function(self, card, context)
        if context.all_in_jest and context.all_in_jest.joker_ability_used and not context.all_in_jest.args.retriggered then
            local other_card = context.all_in_jest.card
            local center = other_card.config.center.all_in_jest
            local args = context.all_in_jest.args and copy_table(context.all_in_jest.args) or {}
            args.retriggered = true
            args.free = true
            G.E_MANAGER:add_event(Event({func = function()
                card_eval_status_text(card, 'extra', nil, nil, nil, {
                    message = localize('k_again_ex'),
                    colour = G.C.FILTER
                })
                center.use_ability(center, other_card, args)
                return true
            end }))
        end
    end,

    in_pool = function(self, args)
        if G.jokers then
            if #G.jokers.cards > 0 then
                for i = 1, #G.jokers.cards do
                    if G.jokers.cards[i].config.center.all_in_jest and G.jokers.cards[i].config.center.all_in_jest.use_ability then
                        return true
                    end
                end
            end
        end
        return false
    end,
}

return { name = { "Jokers" }, items = { fly_agaric } }
