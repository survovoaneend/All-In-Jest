local vexed = {
    object_type = "Joker",
    order = 679,

    key = "vexed",
    config = {
        extra = {
            chance = 50
        }
    },
    attributes = { 'generation', 'joker', 'on_sell' },
    rarity = 2,
    pos = { x = 11, y = 30},
    atlas = 'joker_atlas',
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    dongtong_compat = false,
    perishable_compat = true,

    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chance,
            }
        }
    end,

    calculate = function(self, card, context)
        if context.selling_card and context.card.ability.set == "Joker" then
            local copy_chance = pseudorandom('aij_vexed', 1, 100)
            if copy_chance <= card.ability.extra.chance and (#G.jokers.cards + G.GAME.joker_buffer-1) < G.jokers.config.card_limit then
                local juiced_card = context.blueprint_card or card
                G.GAME.joker_buffer = G.GAME.joker_buffer + 1
                G.E_MANAGER:add_event(Event({func = function()
                    local temp_card = copy_card(context.card, nil, nil, nil, false)
                    temp_card:add_to_deck()
                    G.jokers:emplace(temp_card)
                    temp_card:start_materialize()
                    G.GAME.joker_buffer = G.GAME.joker_buffer - 1
                    if juiced_card == context.card then
                        temp_card:juice_up(0.6, 0.1)
                    else
                        juiced_card:juice_up(0.6, 0.1)
                    end
                    return true
                end }))
                return nil, true
            end
        end
    end
}
return { name = {"Jokers"}, items = {vexed} }